# Validate the generated code
import os
import re
import json
import numpy as np
from OMPython import OMCSessionZMQ
from validation.text_postprocess import process_files, classify_files
from validation.model_test_for_instance import load_simulation_durations, process_version_instance, load_libraries1
from validation.model_test_for_model import process_version_model, load_libraries
from validation.result_analysis import analyze_relationship, add_type_to_results
from validation.calc_passatk import estimate_pass_at_k

# Initialize the OMC session
omc = OMCSessionZMQ()

# Function to remove empty folders
def remove_empty_folders(path):
    removed_folders_count = 0  # Initialize delete counter
    for root, dirs, files in os.walk(path, topdown=False):
        for dir_name in dirs:
            dir_path = os.path.join(root, dir_name)
            if not os.listdir(dir_path):
                os.rmdir(dir_path)
                removed_folders_count += 1
                print(f"Removed empty folder: {dir_path}")
    print(f"Removed totally {removed_folders_count} empty folders.")
    return removed_folders_count

def main():
    mode = "instance"  # or "instance"
    current_folder = os.path.dirname(os.path.abspath(__file__))
    
    input_folder = os.path.join(current_folder, f"generation_example/result_{mode}/starcoder2/7B/output-7b") # LLMs' unprocessed output
    output_folder = os.path.join(current_folder, f"generation_example/result_{mode}/starcoder2/7B/model-7b") # Processed output

    ## Text processing, extract the standard .mo file
    process_files(input_folder, output_folder, mode)
    # Sort the generated.mo files by the Modelica version
    classify_files(output_folder)
    
    # The libraries that are dependent (including the tested components)
    lib_files_dir = os.path.join(current_folder, "library-OM")
    lib_files_json = os.path.join(current_folder, "json_files/libraries.json")

    with open(lib_files_json, 'r') as file:
        lib_files_data = json.load(file)

    # Directory containing the .mo files
    mo_files_base_dir = output_folder
    simu_base_dir = os.path.join(current_folder, f"generation_example/result_{mode}/starcoder2/7B/simulation")
    results_dir = os.path.join(current_folder, f"generation_example/result_{mode}/starcoder2/7B")
    os.makedirs(results_dir, exist_ok=True)

    # Dictionary to store all check results categorized by model number
    all_check_results = {}

   # ---------------------------------------------------------------------------------------------
   # model validation
    if mode == "model":
        # Process each version separately
        for version, lib_files in lib_files_data.items():
            mo_files_dir = os.path.join(mo_files_base_dir, f"model-{version}")
            simu_dir = os.path.join(simu_base_dir, f"simulation-{version}")
            os.makedirs(simu_dir, exist_ok=True)
            # Load libraries
            load_libraries(lib_files, lib_files_dir, version, omc)    
            model_results = process_version_model(version, mo_files_dir, simu_dir, all_check_results, lib_files, lib_files_dir, omc)
            omc.sendExpression("clear()")

        # Define the output JSON file path
        result_file = os.path.join(results_dir, f"all_check_results_by_model.json")

        # Save the check results to a JSON file
        with open(result_file, 'w') as file:
            json.dump(model_results, file, indent=4)
    
    elif mode == "instance":
        # Load simulation durations from CSV
        simulation_durations_csv = os.path.join(current_folder, f"reference_instance/simulation_durations.csv")
        simulation_durations = load_simulation_durations(simulation_durations_csv)

        # Process each version
        for version, lib_files in lib_files_data.items():
            mo_files_dir = os.path.join(mo_files_base_dir, f"model-{version}")
            simu_dir = os.path.join(simu_base_dir, f"simulation-{version}")
            os.makedirs(simu_dir, exist_ok=True)
            load_libraries1(lib_files, lib_files_dir, version, omc)    
            model_results = process_version_instance(version, mo_files_dir, simu_dir, all_check_results, simulation_durations, lib_files, lib_files_dir, omc)
            omc.sendExpression("clear()")
       
        result_file = os.path.join(results_dir, f"all_check_results_by_instance.json")

        # Save the check results to a JSON file
        with open(result_file, 'w') as file:
            json.dump(model_results, file, indent=4)

    # Remove empty folders
    remove_empty_folders(output_folder)

    print(f"All check results are saved.")

    # ---------------------------------------------------------------------------------------------
    # Count the number of simulable samples generated for each scenario
    txt_dir_path = input_folder
    input_file = result_file
    output_file = os.path.join(results_dir, f"results_analysis_{mode}.json")
    models_file = "json_files/test_6_libraries_new.json"  # Adjust the path to the location of your test.json

    # Regular expression to match the model number in the file name
    pattern = re.compile(f'{mode}_(\d+)_response_\d+\.txt')

    file_counts = {}

    # Total number of files and models
    total_files = 0

    # Statistics txt file
    for file_name in os.listdir(txt_dir_path):
        if file_name.endswith('.txt'):
            match = pattern.match(file_name)
            if match:
                model_number = match.group(1)
                model_key = f"{mode}_{model_number}"
                if model_key in file_counts:
                    file_counts[model_key] += 1
                else:
                    file_counts[model_key] = 1
                total_files += 1

    total_txt_files = {
        # "total_txt_files": total_files
    }

    # Sort the file count by model number
    sorted_file_counts = dict(sorted(file_counts.items(), key=lambda x: int(x[0].split('_')[1])))

    # Merge sorted counts into the result
    for key in sorted_file_counts:
        total_txt_files[key] = {
            "txt_files": sorted_file_counts[key]
        }

        # Read the models data from test.json
    with open(models_file, 'r', encoding='utf-8') as file:
        models_data = json.load(file)['model']

    # Read the JSON file
    with open(input_file, 'r', encoding='utf-8') as file:
        data = json.load(file)

    # Analyze relationships and get results
    analysis_results = analyze_relationship(data, total_files)
            
    # Refactor the result to the desired format
    formatted_results = {"results": analysis_results["model_summary"]}

    # Merge results
    combined_results = {"results": {}}

    for model_key, result_data in formatted_results["results"].items():
        if model_key in total_txt_files:
            # Put 'txt_files' first
            combined_results["results"][model_key] = {
                "txt_files": total_txt_files[model_key]["txt_files"],
                **result_data
            }
        else:
            combined_results["results"][model_key] = result_data

    if mode == 'model':
        # Add 'type' field to the results
        combined_results["results"] = add_type_to_results(models_data, combined_results["results"])

    results = {"statistics": analysis_results["statistics"],
        "results": combined_results["results"] }

    # Save analysis results to JSON file
    with open(output_file, 'w', encoding='utf-8') as file:
        json.dump(results, file, indent=4)

    print(f"Analysis results saved to {output_file}")

    # ---------------------------------------------------------------------------------------------
    # calculate pass@k
    with open(output_file, 'r') as file:
        results = json.load(file)

    # Extracting num_samples and num_correct
    if mode == "model":
        n = 129
        num_samples = [10 for _ in range(n)]
    else:
        n = 127
        num_samples = [5 for _ in range(n)]
    num_correct1 = [model["check_not_empty_simu_true"] for model in results["results"].values()] # The correct number of samples for each question
    # check_not_empty_simu_true & check_function_correct

    num_correct = num_correct1[:n] + [0] * (n - len(num_correct1))
 
    scenario = 5 # 8 for model, 5 for instance

    # Call the function to compute pass@k
    pass_at_1_results = estimate_pass_at_k(num_samples, num_correct, 1)
    pass_at_k_results = estimate_pass_at_k(num_samples, num_correct, scenario)
    avg_pass_at_1 = np.mean(pass_at_1_results)
    avg_pass_at_k = np.mean(pass_at_k_results)

    # Output the result
    print("num_samples:", num_samples)
    print("num_correct:", num_correct)
    print("Pass@1 result:\n", pass_at_1_results)
    print("Average Pass@1:", avg_pass_at_1)
    print(f"Pass@{scenario} result:\n", pass_at_k_results)
    print(f"Average Pass@{scenario}:", avg_pass_at_k)

if __name__ == "__main__":
    main()