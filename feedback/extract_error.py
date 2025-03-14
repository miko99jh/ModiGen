# Description: This script is designed to extract simulation information (error information) from the generated model.
import os
import re
import json

def remove_specific_lines(error_msg):
    # Remove lines starting with "Warning:", "[<interactive>:", or "Notification:"
    lines = error_msg.split('\n')
    filtered_lines = [line for line in lines if not (line.startswith("Warning:") or line.startswith("[<interactive>:") or line.startswith("Notification:"))]
    return '\n'.join(filtered_lines)

# Function to read the content of a .mo file
def read_model_file(file_name):
    # Traverse the model_directory and its subdirectories to find the .mo file
    for root, dirs, files in os.walk(model_directory):
        for file in files:
            if file == file_name + '.mo':
                file_path = os.path.join(root, file)
                with open(file_path, 'r', encoding='utf-8') as f:
                    return f.read()
    return "Model file not found."

def read_prompt_file(prompt_file, file_name_prefix, mode):
    """
    From a single JSON file, based on the number (id) in file_name_prefix,
    Find the corresponding "instruction" and return. If not found, return.
    """
    # Extract the number in the prefix
    match = re.findall(r'\d+', file_name_prefix)
    if not match:
        return ""
    idx = int(match[0])

    with open(prompt_file, 'r', encoding='utf-8') as f:
        data = json.load(f)

    # Find the record with the corresponding id in data["model"]
    for item in data.get(f"{mode}", []):
        if item.get("id") == idx:
            return item.get("instruction", "")
    return ""

mode = "instance"
choice = f"GPT4o/GPT4o"
input_file = f'/xxx/generation_example/result_{mode}/{choice}/all_check_results_by_{mode}.json'
prompt_file = f'/xxx/generation_example/test_6_libraries_new.json'
model_directory = f'/xxx/generation_example/result_{mode}/{choice}/model-GPT4o'  # Replace with the path to the folder containing .mo files
# Define the output directory

output_directory = f'/xxx/generation_example/result_{mode}/codellama/feedback-GPT4o/input-GPT4o(Error_Prompts)'  # Replace with your desired path
# Ensure the output directory exists
os.makedirs(output_directory, exist_ok=True)

# Load the JSON data from a file
with open(input_file, 'r', encoding='utf-8') as file:
    data = json.load(file)

# Define the feedback template
template = """This is the model instance according to the above prompt:
[assistant]: Model Instance:
```
{model}
```

[user]: When I used modelica to test it, the system gave the following error:
[system]: {error_msg}
[user]: Please modify the model instance according to the current system error, and give the modified model instance.
"""

function_type = ["model_1", "model_2", "model_10", "model_16",
                 "model_24", "model_76", "model_77", "model_82", 
                 "model_101", "model_102", "model_103", "model_104", 
                 "model_110"]

error_type = ["model_21", "model_40", "model_65"]

# Process each model and save the results to respective files
for model_key, model_list in data.items():
    for model in model_list:
        # if model['error_msg']:
        if model['error_msg'] and ("status" not in model):
            if model_key in function_type and model['load_state'] == True:
                continue
            if model_key in error_type:
                continue
            cleaned_error_msg = remove_specific_lines(model['error_msg'])
            model_content = read_model_file(model['file_name'])
            file_name_prefix = model['file_name'].split('_response_')[0]
            prompt_content = read_prompt_file(prompt_file, file_name_prefix, mode)
            file_content = "[user]: "+ prompt_content + "\n\n" + template.format(model=model_content, error_msg=cleaned_error_msg)
            file_path = os.path.join(output_directory, f"{model['file_name']}.txt")
            with open(file_path, 'w', encoding='utf-8') as output_file:
                output_file.write(file_content)

print(f"Results have been saved to {output_directory}.")