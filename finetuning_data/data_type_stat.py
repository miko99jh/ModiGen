import os
import json
import re
from collections import Counter

# Regular expressions for matching different types in the "model" content
type_patterns = {
    "package": re.compile(r'^\s*package\b'),
    "model": re.compile(r'^\s*model\b'),
    "class": re.compile(r'^\s*class\b'),
    "function": re.compile(r'^\s*function\b'),
    "block": re.compile(r'^\s*block\b'),
    "connector": re.compile(r'^\s*connector\b'),
    "record": re.compile(r'^\s*record\b'),
    "type": re.compile(r'^\s*type\b'),
    "enumeration": re.compile(r'^\s*enumeration\b'),
    "partial package": re.compile(r'^\s*partial\s+package\b'),
    "partial model": re.compile(r'^\s*partial\s+model\b'),
    "partial class": re.compile(r'^\s*partial\s+class\b'),
    "partial function": re.compile(r'^\s*partial\s+function\b'),
    "partial block": re.compile(r'^\s*partial\s+block\b'),
    "partial connector": re.compile(r'^\s*partial\s+connector\b'),
}

def detect_model_type(model_content):
    lines = model_content.split('\n')
    model_name = ""
    
    # Find the last model name
    for line in reversed(lines):
        match = re.match(r'\s*end\s+([a-zA-Z0-9_]+)\s*;', line)
        if match:
            model_name = match.group(1)
            break
    
    if not model_name:
        return "unknown"
    
    # Find model type by looking at lines before the model name
    for line in lines:
        if model_name in line:
            for type_name, pattern in type_patterns.items():
                if pattern.search(line):
                    return type_name
    return "unknown"

def process_json_file(filepath):
    type_counter = Counter()

    with open(filepath, 'r', encoding='utf-8') as file:
        data = json.load(file)
    
        for item in data:
            if 'output' in item:
                model_type = detect_model_type(item['output'])
                type_counter[model_type] += 1

    return type_counter

json_file_path = '/xxx/finetuning_data/train_modelica_all_unsupervised.json'
type_statistics = process_json_file(json_file_path)
    
# Print out the statistics
for model_type, count in type_statistics.items():
    print(f"{model_type}: {count}")
