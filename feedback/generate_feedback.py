import os
import time
import torch
import transformers
from transformers import AutoTokenizer, AutoModelForCausalLM

model_size = 13
# Initialize model and tokenizer
model_dir = f"/xxx" # Path to the model directory

# Initialize Accelerator with multi-GPU support
# Load the model and tokenizer
model = AutoModelForCausalLM.from_pretrained(model_dir, device_map="auto")
tokenizer = AutoTokenizer.from_pretrained(model_dir)

# Prepare the model for multi-GPU inference

# Initialize the text generation pipeline
pipeline = transformers.pipeline(
    "text-generation",
    model=model,
    tokenizer=tokenizer,
    torch_dtype=torch.float16,
    device_map="auto",
    # device=3
)

# Function to read text from a file
def read_file(file_path):
    with open(file_path, 'r', encoding='utf-8') as file:
        return file.read()

# Function to write text to a file
def write_file(file_path, content):
    with open(file_path, 'w', encoding='utf-8') as file:
        file.write(content)

# Directory containing the input txt files
choice = f"starcoder2/feedback-{model_size}B"
input_dir = f'/xxx/generation_example/result_instance/{choice}/input-{model_size}b(Error_Prompts)'
output_dir = f'/xxx/generation_example/result_instance/{choice}/output-{model_size}b'
context_file = '/xxx/context/0_Prompt_model.txt'

# Read the context file
context_text = read_file(context_file)

# Ensure output directory exists
os.makedirs(output_dir, exist_ok=True)

run_start_time = time.time()
# Process each file in the input directory
for input_file in os.listdir(input_dir):
    if input_file.endswith('.txt'):
        input_path = os.path.join(input_dir, input_file)
            
        # Modify the output file name to add "res_n" before the file extension
        base_name, ext = os.path.splitext(input_file)
        output_file_name = f"{base_name}{ext}"
        output_path = os.path.join(output_dir, output_file_name)
            
        if os.path.exists(output_path):
            print(f"File {output_file_name} already exists. Skipping this prompt.")
            continue

        # Read input prompt text
        prompt_text = read_file(input_path)
            
        # Combine context and prompt text
        combined_text = context_text + "\n" + prompt_text
        # combined_text = prompt_text
            
        input_length = len(tokenizer.encode(combined_text))
        max_length = input_length + 400  # Adjust the additional length as needed
        
        for attempt in range(3):
            # Generate response using the model
            sequences = pipeline(
                combined_text,
                do_sample=True,
                top_k=10,
                num_return_sequences=1,
                eos_token_id=tokenizer.eos_token_id,
                max_length=max_length,
                truncation=True
            )
                
            # Extract generated text
            generated_text = sequences[0]['generated_text']
            response_text = generated_text[len(combined_text):].strip()  # Remove the prompt text from the generated text
                
            # Check if the generated text is empty
            if len(response_text) == 0:
                print(f"Warning: Generated text for {base_name} is empty on attempt {attempt + 1}. Retrying...")
            else:
                # Write the generated text to the output file
                write_file(output_path, response_text)
                print(f"Processed instruction {base_name}, output saved to {output_path}")
                break  # Exit the retry loop if generation was successful
        else:
            # If all attempts fail, save an empty file
            write_file(output_path, response_text)
            print(f"Warning: Empty file! Processed instruction {base_name}, output saved to {output_path}")

run_end_time = time.time()
print(f"Run time taken: {(run_end_time - run_start_time)/3600} hours")