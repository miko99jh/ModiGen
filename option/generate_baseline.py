import os
import time
import json
import torch
import transformers
from transformers import AutoTokenizer, AutoModelForCausalLM

total_start_time = time.time()

model_size = 13
temp = 0.3
# Initialize model and tokenizer
model_dir =  f"/xxx/CodeLlama-{model_size}b-Instruct-hf"
model = AutoModelForCausalLM.from_pretrained(model_dir, device_map="auto")
tokenizer = AutoTokenizer.from_pretrained(model_dir)

# Initialize the text generation pipeline
pipeline = transformers.pipeline(
    "text-generation",
    model=model,
    tokenizer=tokenizer,
    torch_dtype=torch.float16,
    device_map="auto",
)

# Function to read JSON file
def read_json(file_path):
    with open(file_path, 'r', encoding='utf-8') as file:
        return json.load(file)

# Function to read text from a file
def read_file(file_path):
    with open(file_path, 'r', encoding='utf-8') as file:
        return file.read()
    
# Function to write text to a file
def write_file(file_path, content):
    with open(file_path, 'w', encoding='utf-8') as file:
        file.write(content)

mode = 'model' # 'model' or 'instance'
# Directory to store the output files
context_file = f'/xxx/context/0_Prompt_{mode}.txt'
output_dir = f'/xxx/result_{mode}/codellama-13b/output-{model_size}b-sft'
json_file_path = '/xxx/json_files/test_6_libraries_new.json'

# Read the JSON file
data = read_json(json_file_path)
instructions = [item['instruction'] for item in data[f'{mode}']]

# Read the context file
context_text = read_file(context_file)

# Ensure output directory exists
os.makedirs(output_dir, exist_ok=True)

for run_number in range(1, 11):
    run_start_time = time.time()
    # Process each instruction in the JSON file
    for idx, entry in enumerate(instructions):
        prompt_text = entry
        # Combine context and prompt text
        combined_text = context_text + "\n" + prompt_text

        output_file_name = f"{mode}_{idx+1}_response_{run_number}.txt"
        output_path = os.path.join(output_dir, output_file_name)
        
        if os.path.exists(output_path):
            print(f"File {output_file_name} already exists. Skipping this prompt.")
            continue
        
        input_length = len(tokenizer.encode(combined_text))
        max_length = input_length + 400  # Adjust the additional length as needed
        # max_length = 2408

        for attempt in range(3):
            sequences = pipeline(
                combined_text,
                do_sample=True,
                top_k=10,
                num_return_sequences=1,
                eos_token_id=tokenizer.eos_token_id,
                max_length=max_length,
                truncation=True,
                temperature=temp  # Lower temperature for improved accuracy
            )

            # Extract generated text
            generated_text = sequences[0]['generated_text']
            response_text = generated_text[len(combined_text):].strip()  # Remove the prompt text from the generated text

            # Check if the generated text is empty
            if len(response_text) == 0:
                print(f"Warning: Generated text for {idx+1} is empty on attempt {attempt + 1}. Retrying...")
            else:
                # Write the generated text to the output file
                write_file(output_path, generated_text)
                print(f"Processed instruction {idx+1}, output saved to {output_path}")
                break  # Exit the retry loop if generation was successful
        else:
            # If all attempts fail, save an empty file
            write_file(output_path, generated_text)
            print(f"Warning: Empty file! Processed instruction {idx+1}, output saved to {output_path}")

    run_end_time = time.time()
    print(f"Run {run_number} time taken: {(run_end_time - run_start_time)/3600} hours")

total_end_time = time.time()
print(f"Total time taken: {(total_end_time - total_start_time)/3600} hours")