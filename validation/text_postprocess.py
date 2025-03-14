import os
import re
import shutil

def extract_modelica_model(text, mode):
    if mode == "instance":
        match = re.search(r'model\s+(\w+)[\s\S]*?end\s+\1;', text, re.DOTALL)
        if match:
            return match.group(0)
        return None
     
    match1 = re.search(r'function\s+(\w+)[\s\S]*?end\s+\1;', text, re.DOTALL) # n
    match2 = re.search(r'block\s+(\w+)[\s\S]*?end\s+\1;', text, re.DOTALL)
    match3 = re.search(r'class\s+(\w+)[\s\S]*?end\s+\1;', text, re.DOTALL)
    match4 = re.search(r'model\s+(\w+)[\s\S]*?end\s+\1;', text, re.DOTALL)
    
    match_1 = re.findall(r'(?m)^\s*function\s+(\w+)\b\s*(.*?)\bend\s+\1\s*;$', text, re.DOTALL) # n
    match_2 = re.findall(r'(?m)^\s*block\s+(\w+)\b\s*(.*?)\bend\s+\1\s*;$', text, re.DOTALL)
    match_3 = re.findall(r'(?m)^\s*class\s+(\w+)\b\s*(.*?)\bend\s+\1\s*;$', text, re.DOTALL)
    match_4 = re.findall(r'(?m)^\s*model\s+(\w+)\b\s*(.*?)\bend\s+\1\s*;$', text, re.DOTALL)
                        
    # Extract matching blocks of code, keeping them unique
    function = [f"function {name}\n {content}end {name};" for name, content in match_1]
    block = [f"block {name}\n {content}end {name};" for name, content in match_2]
    class1 = [f"class {name}\n {content}end {name};" for name, content in match_3]    
    model = [f"model {name}\n {content}end {name};" for name, content in match_4]

    if match_2:
        return block[0]
    if match2:
        return match2.group(0)
    if match_3:
        return class1[0]
    if match3:
        return match3.group(0)
    if match_4:
        return model[0]
    if match4:
        return match4.group(0)
    if match_1:
        return function[0]
    if match1:
        return match1.group(0)
    return None

def process_files(input_folder, output_folder, mode):
    # If the output folder does not exist, create it
    if not os.path.exists(output_folder):
        os.makedirs(output_folder)

    for filename in os.listdir(input_folder):
        if filename.endswith('.txt'):
            input_file_path = os.path.join(input_folder, filename)
            output_file_path = os.path.join(output_folder, filename.replace('.txt', '.mo'))
            
            with open(input_file_path, 'r', encoding='utf-8') as infile:
                content = infile.read()
                
            model = extract_modelica_model(content, mode)
            
            if model:
                with open(output_file_path, 'w', encoding='utf-8') as outfile:
                    # outfile.write(model[0])
                    outfile.write(model)
                
    print("All of the models have been extracted in", output_folder)

def classify_files(output_folder):
    model_3_folder = os.path.join(output_folder, 'model-3.2.3')
    model_4_folder = os.path.join(output_folder, 'model-4.0.0')

    if not os.path.exists(model_3_folder):
        os.makedirs(model_3_folder)
    
    if not os.path.exists(model_4_folder):
        os.makedirs(model_4_folder)

    for filename in os.listdir(output_folder):
        if filename.endswith('.mo'):
            instance_match = re.match(r'instance_(\d+)_.*\.mo', filename)
            model_match = re.match(r'model_(\d+)_.*\.mo', filename)

            if instance_match:
                n = int(instance_match.group(1))
                old_file_path = os.path.join(output_folder, filename)
                if n > 84:
                    shutil.move(old_file_path, os.path.join(model_3_folder, filename))
                else:
                    shutil.move(old_file_path, os.path.join(model_4_folder, filename))

            elif model_match:
                m = int(model_match.group(1))
                old_file_path = os.path.join(output_folder, filename)
                if m > 109:
                    shutil.move(old_file_path, os.path.join(model_3_folder, filename))
                else:
                    shutil.move(old_file_path, os.path.join(model_4_folder, filename))

    print("Files are classified according to conditions.")