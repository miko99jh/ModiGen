# If the stored output retains prompt words, you can use this script to remove prompt words
import os
import json

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

mode = 'instance'  # 'model' or 'instance'
# Directory containing the input txt files
output_dir = f'/xxx/generation_example/result_{mode}/starcoder2/15B-sft/output-15b-sft'
context_file = f'/xxx/context/0_Prompt_{mode}.txt'
json_file_path = '/xxx/json_files/test_6_libraries_new.json'

# Read the JSON file
data = read_json(json_file_path)
instructions = [item['instruction'] for item in data[f'{mode}']]

# Read the context file
context_text = read_file(context_file)

# Traverse all .txt files in the output folder
for filename in os.listdir(output_dir):
    if filename.endswith(".txt"):
        # Extract the m and n values from the file name
        parts = filename.split('_')
        m = int(parts[1])  # model_{m}
        n = int(parts[3].split('.')[0])  # response_{n}

        # Retrieve the prompt corresponding to the m value
        prompt_text = instructions[m-1]
        combined_text = context_text + "\n" + prompt_text
        # Construct the full path for the txt file
        file_path = os.path.join(output_dir, filename)

        # Read the contents of the txt file
        with open(file_path, 'r', encoding='utf-8') as file:
            file_content = file.read()

        # If the content starts with the prompt, remove the prompt portion
        if file_content.startswith(combined_text):
            file_content = file_content[len(combined_text):].strip()

        # Save the modified content back to the file
        with open(file_path, 'w', encoding='utf-8') as file:
            file.write(file_content)

        print(f"Processed {filename} - m: {m}, n: {n}")

