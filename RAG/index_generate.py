import os
import json
import logging
import sys
from llama_index.core import Document, Settings, StorageContext, load_index_from_storage
from llama_index.core import VectorStoreIndex
from llama_index.core.embeddings import resolve_embed_model

# Enable logging to display progress
logging.basicConfig(stream=sys.stdout, level=logging.INFO)

# ================= 1. Environment and Model Configuration =================

# Parameter Alignment: Increase Chunk Size to 2048 to handle long Modelica code and docs
Settings.chunk_size = 2048 
Settings.chunk_overlap = 100

# Align Embedding Model
EMBED_MODEL_PATH = "local:BAAI/bge-m3"
Settings.embed_model = resolve_embed_model(EMBED_MODEL_PATH)

# ================= 2. Data Loading and Document Assembly =================
DATA_FILE = "docs/cleaned_rag_corpus_with_path.json"
documents = []

print("Loading the cleaned RAG corpus...")
with open(DATA_FILE, 'r', encoding='utf-8') as f:
    rag_data = json.load(f)
    for item in rag_data:
        text = item.get("model", "").strip()
        if not text:
            continue
            
        # Metadata Alignment: Ensure keys match the definitions in the GraphRAG script
        doc = Document(
            text=text,
            metadata={
                "path": item.get("path", ""), # Uniformly use modelica_path
                "description": item.get("description", ""),
                "documentation": item.get("documentation", "")
            }
        )
        
        # Key Alignment: Exclude excessively long metadata from vectorization interference
        # This resolves previous ValueErrors while ensuring the LLM can still access these docs during generation
        doc.excluded_embed_metadata_keys = ["documentation"]
        
        documents.append(doc)
        
print(f"Successfully loaded {len(documents)} components with decoupled retrieval/generation context.")

# ================= 3. Build and Persist Vector Index =================

PERSIST_DIR = "./storage_modelica"

if os.path.exists(PERSIST_DIR):
    print(f"Local cache directory {PERSIST_DIR} found for Baseline, loading...")
    storage_context = StorageContext.from_defaults(persist_dir=PERSIST_DIR)
    vector_index = load_index_from_storage(storage_context)
    print("Baseline vector index loaded successfully!")
    
else:
    print("Starting construction of pure Vector Index (Synced with 2048 ChunkSize)...")
    
    # This step automatically vectorizes the text using bge-m3
    vector_index = VectorStoreIndex.from_documents(
        documents=documents,
        show_progress=True
    )
    
    print("\nConstruction complete! Persisting vector data to local storage...")
    vector_index.storage_context.persist(persist_dir=PERSIST_DIR)
    print("💾 Vector data persisted successfully!")

print("-" * 40)
print("Comparison experiment Baseline (Vector Index) is ready!")