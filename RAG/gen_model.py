import os
import sys
import time
import json
import torch
import concurrent.futures
from typing import Any, List

from transformers import AutoTokenizer, AutoModelForCausalLM
from llama_index.core import (
    VectorStoreIndex, 
    SimpleDirectoryReader, 
    Settings, 
    StorageContext, 
    load_index_from_storage,
    PromptTemplate
)
from llama_index.core.embeddings import resolve_embed_model
from llama_index.core.llms import CustomLLM, CompletionResponse, CompletionResponseGen, LLMMetadata
from llama_index.core.retrievers import VectorIndexRetriever
from llama_index.core.query_engine import RetrieverQueryEngine
from llama_index.core.postprocessor import SimilarityPostprocessor

# =============================================================================================
# Global Configuration & Custom LLM Class
# =============================================================================================
MAX_TIMEOUT = 60  # Maximum time in seconds for RAG query execution
TEMPERATURE = 0.3
SIMILARITY_THRESHOLD = 0.78  # Threshold to filter out irrelevant context

class QwenCustomLLM(CustomLLM):
    context_window: int = 8192
    num_output: int = 2408
    model_name: str = "Qwen2.5-coder-32B"
    tokenizer: Any = None
    model: Any = None

    def __init__(self, pretrained_model_path: str):
        super().__init__()
        self.tokenizer = AutoTokenizer.from_pretrained(pretrained_model_path, trust_remote_code=True)
        self.model = AutoModelForCausalLM.from_pretrained(
            pretrained_model_path,
            trust_remote_code=True,
            device_map="auto",
            torch_dtype=torch.float16,
        )

    @property
    def metadata(self) -> LLMMetadata:
        return LLMMetadata(
            context_window=self.context_window,
            num_output=self.num_output,
            model_name=self.model_name,
        )

    def complete(self, prompt: str, **kwargs: Any) -> CompletionResponse:
        inputs = self.tokenizer(prompt, return_tensors='pt')
        input_ids = inputs["input_ids"].to("cuda")
        attention_mask = inputs["attention_mask"].to("cuda")
        max_length = len(input_ids[0]) + 1024 
        
        outputs = self.model.generate(
            input_ids,
            max_length=max_length,
            temperature=TEMPERATURE,
            do_sample=True,
            top_k=10,
            attention_mask=attention_mask,
            pad_token_id=self.tokenizer.eos_token_id
        )
        response = self.tokenizer.decode(outputs[0][len(input_ids[0]):], skip_special_tokens=True)
        return CompletionResponse(text=response)

    def stream_complete(self, prompt: str, **kwargs: Any) -> CompletionResponseGen:
        response_obj = self.complete(prompt)
        for token in response_obj.text:
            yield CompletionResponse(text=token, delta=token)

# =============================================================================================
# Utility Functions
# =============================================================================================
def read_json(file_path):
    with open(file_path, 'r', encoding='utf-8') as f:
        return json.load(f)

def write_file(file_path, content):
    with open(file_path, 'w', encoding='utf-8') as f:
        f.write(content)

def process_instruction(idx, query, output_path, query_engine):
    """Executes the RAG query with a timeout and fallback logic."""
    try:
        print(f"Processing Task {idx+1}...")
        with concurrent.futures.ThreadPoolExecutor() as executor:
            future = executor.submit(query_engine.query, query)
            response_rag = future.result(timeout=MAX_TIMEOUT)
        write_file(output_path, response_rag.response)
        print(f"Saved: {output_path}")
    except concurrent.futures.TimeoutError:
        print(f"Timeout on Task {idx+1}, falling back to direct LLM call...")
        response = Settings.llm.complete(prompt=query)
        write_file(output_path, response.text)
    except Exception as e:
        print(f"Error on Task {idx+1}: {e}")
        response = Settings.llm.complete(prompt=query)
        write_file(output_path, response.text)

# =============================================================================================
# Main Execution Workflow
# =============================================================================================
def main():
    total_start_time = time.time()
    current_folder = os.path.dirname(os.path.abspath(__file__))
    
    # 1. Path Configuration
    # -----------------------------------------------------------------------------------------
    model_dir = "LLaMA-Factory/Qwen2.5coder-32B-sft"
    model_name = "Qwen2.5-coder-32B"
    json_file_path = os.path.join(current_folder, 'json_files/test_component_new.json')
    persist_dir = os.path.join(current_folder, "json_files/storage_modelica")
    output_dir = os.path.join(current_folder, f'result/{model_name}/output')

    # 2. Global Settings Initialization
    # -----------------------------------------------------------------------------------------
    Settings.embed_model = resolve_embed_model("local:RAG/BAAI/bge-m3")
    Settings.llm = QwenCustomLLM(model_dir)

    # 3. Retrieval Engine Setup (with Similarity Threshold)
    # -----------------------------------------------------------------------------------------
    try:
        storage_context = StorageContext.from_defaults(persist_dir=persist_dir)
        index = load_index_from_storage(storage_context)
        print("Index loaded successfully.")
    except Exception as e:
        print(f"Failed to load index: {e}")
        sys.exit(1)

    retriever = VectorIndexRetriever(index=index, similarity_top_k=2)
    # Filter nodes with similarity score below threshold
    similarity_cutoff = SimilarityPostprocessor(similarity_cutoff=SIMILARITY_THRESHOLD)
    
    query_engine = RetrieverQueryEngine.from_args(
        retriever=retriever,
        node_postprocessors=[similarity_cutoff]
    )

    # 4. Prompt Template Configuration
    # -----------------------------------------------------------------------------------------
    qa_prompt_tmpl_str = (
        "The following context provides relevant information for generating Modelica code.\n"
        "Focus on the Modelica syntax related to the query and ignore irrelevant information.\n"
        "---------------------\n"
        "{context_str}\n"
        "---------------------\n"
        "Given the context, generate the appropriate Modelica components (model, function, block, etc.) "
        "according to the description below. Ensure code adheres strictly to Modelica conventions.\n"
        "Note: Output only the valid Modelica script.\n"
        "Query: {query_str}\n"
    )
    qa_prompt_tmpl = PromptTemplate(qa_prompt_tmpl_str)
    query_engine.update_prompts({"response_synthesizer:text_qa_template": qa_prompt_tmpl})

    # 5. Task Execution (Pass@k Support)
    # -----------------------------------------------------------------------------------------
    os.makedirs(output_dir, exist_ok=True)
    data = read_json(json_file_path)
    instructions = [item['instruction'] for item in data['model']]

    for idx, instruction in enumerate(instructions):
        # Perform 10 independent runs per instruction for Pass@10 evaluation
        for run_number in range(1, 11):
            output_file_name = f"model_{idx+1}_response_{run_number}.txt"
            output_path = os.path.join(output_dir, output_file_name)

            if os.path.exists(output_path):
                print(f"Skipping {output_file_name} (already exists).")
                continue

            process_instruction(idx, instruction, output_path, query_engine)

    print("Generation complete!")
    duration = (time.time() - total_start_time) / 3600
    print(f"Total execution time: {duration:.2f} hours")

if __name__ == "__main__":
    main()