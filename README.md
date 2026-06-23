# ModiGen

ModiGen is a Large Language Model (LLM)-based workflow for **multi-domain Modelica component generation**.  
It provides an **automated pipeline** for generating, validating, and evaluating Modelica components.

---

### 🔧 **Pipeline Overview**

The pipeline includes the following core components:

- **Component Generation (`gen_model.py`)**: Generates Modelica components based on task-specific prompts and domain requirements.

- **Text Processing (`__main__.py`)**: Extracts Modelica source code (.mo files) from raw LLM-generated text outputs.

- **Component Validation (`__main__.py`)**: Uses OpenModelica (via OMPython) to perform syntax checking and simulation. Functional validation is conducted by comparing simulation trajectories against reference outputs.

- **Results Analysis (`__main__.py`)**: Aggregates results.

- **Metrics Calculation (`validation/compute_metrics.py`)**: Evaluates the final performance using the Pass@k metric.
---

### 🌟 **Key Features**

- **Retrieval-Augmented Generation (`RAG`)**: Constructs an index representing the structural information of Modelica components. This improves dependency analysis and retrieval efficiency for complex component generation.

- **Feedback-Driven Refinement (`feedback`)**: Automatically extracts simulation or syntax errors and generates diagnostic prompts for iterative model correction.

- **Fine-Tuning (`LLaMA-Factory`)**: Supports supervised fine-tuning (SFT) using the [LLaMA-Factory](https://github.com/hiyouga/LLaMA-Factory) framework to enhance Modelica-specific generation capabilities.

---

### 📁 **Project Structure (Excerpt)**

├── `gen_model.py`          # Prompt construction and LLM-based component generation  
├── `__main__.py`           # Main pipeline: post-processing, simulation, and results analysis  
├── `validation/`           # Modules for simulation, result checking, and metric computation  
│   ├── `library-OM/`       # Required Modelica dependency libraries for simulation  
│   └── `reference_model/`  # Reference ground-truth data for functional validation  
├── `json_files/`           # Benchmark datasets and metadata in JSON format  
├── `RAG/`                  # Index construction and RAG-based generation logic  
├── `feedback/`             # Error extraction and iterative prompt refinement scripts  
├── `result/`               # Output directory for generated code, logs, and evaluation reports  
├── `LLaMA-Factory/`        # Fine-tuning framework and training datasets  
├── `tools/`                # Utility scripts and helper functions for processing  
├── `README.md`             # Project documentation and usage guide  
└── `requirements.txt`      # Python dependencies for environment setup

---

### ⚙️ OpenModelica Library Configuration

Before running the evaluation pipeline, please make sure that the Modelica Standard Library (MSL) path in `validation/model_test_for_model.py` matches your local OpenModelica installation.

In our local environment, the MSL is loaded as follows:

```python
load1 = omc.sendExpression(
    f'loadFile("D:/Program/OpenModelica1.18.1-64bit/lib/omlibrary/Modelica {version}/package.mo")'
)
```

If OpenModelica is installed in a different location, please update this path accordingly.

The remaining Modelica dependency libraries used by the artifact are provided under `validation/library-OM/`.

---

### 🚀 Getting Started

▶ **Install dependencies**

```bash
pip install -r requirements.txt
```
Ensure OpenModelica (`omc`) is installed and available in your system `PATH`.

▶ **Prepare model checkpoints and data**

* Place your HuggingFace-compatible LLM (e.g., Llama-3.1, Qwen-2.5-Coder) in the local directory and update the path in `gen_model.py`.

* Ensure the benchmark datasets are available under `json_files/`.

▶ **Generate component**

Run prompt-based component generation:

```bash
python gen_model.py
```

▶ **Evaluate generated components**

Run the evaluation pipeline:

```bash
python __main__.py
```

▶ **View results**

Evaluation results will be saved under the `result/` directory.
