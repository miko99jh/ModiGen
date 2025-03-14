import os
import shutil
from OMPython import OMCSessionZMQ
import re
from tqdm import tqdm

allowed_restrictions = {'class', 'block', 'model'}

# Function to check a model and store the result in a dictionary
def check_model(file_path, simu_dir, all_check_results, omc):
    # Extract the file name and model name from the file path
    file_name = os.path.splitext(os.path.basename(file_path))[0]
    model_number = re.search(r'model_(\d+)', file_name).group(1)
    # Load the .mo file
    load = omc.sendExpression(f'loadFile("{file_path}")')
    is_simulation = False
    error_msg = ""
    if load:
        load_state = True
        class_names = omc.sendExpression("getClassNames()")
        model_name = class_names[0] # TypeError: class_names is None
        # Check the model
        check_result = omc.sendExpression(f"checkModel({model_name})")
        restriction = omc.sendExpression(f'getClassRestriction({model_name})')
        
        if check_result:
            # Create a directory for simulation results
            simulation_dir = os.path.join(simu_dir, file_name)
            os.makedirs(simulation_dir, exist_ok=True)
            omc.sendExpression(f"simulate({model_name})")
            # Move the simulation results to the target directory
            for file in os.listdir("."):
                if file.startswith(model_name):
                    shutil.move(file, simulation_dir)
            simulation = len(os.listdir(simulation_dir))
            if simulation > 0:
                is_simulation = True
            else:
                error_msg = omc.sendExpression("getErrorString()")
        elif check_result and (restriction not in allowed_restrictions):
            is_simulation = f"Type {restriction} don't need simulation."
        elif not check_result:
            error_msg = omc.sendExpression("getErrorString()")
        omc.sendExpression(f'deleteClass({model_name})')
    else:
        error_msg = omc.sendExpression("getErrorString()")
        load_state = False
        class_names = {}
        model_name = ""
        check_result = ""

    # Store the check result in a dictionary
    check_result_dict = {
        "file_name": file_name,
        "model_name": model_name,
        "load_state": load_state,
        "check_result": check_result,
        "is_simulation": is_simulation,
        "error_msg": error_msg
    }

    # Append the check result to the appropriate model number list in the dictionary
    model_key = f"model_{model_number}"
    if model_key in all_check_results:
        all_check_results[model_key].append(check_result_dict)
    else:
        all_check_results[model_key] = [check_result_dict]
    return omc

# Function to load libraries and check models for a specific version
def process_version_model(version, mo_files_dir, simu_dir, all_check_results,lib_files, lib_files_dir, omc):
    # Iterate over all .mo files in the directory with a progress bar
    for mo_file in tqdm(os.listdir(mo_files_dir), desc=f"Checking models for version {version}"):
        version = omc.sendExpression("getVersion()")
        if version is None:
            omc = OMCSessionZMQ()
            load_libraries(lib_files, lib_files_dir, version, omc)
        if mo_file.endswith('.mo'):
            mo_file_path = os.path.join(mo_files_dir, mo_file)
            omc = check_model(mo_file_path, simu_dir, all_check_results, omc)
    
    # Sort each model number list by file name
    for model_key in all_check_results:
        all_check_results[model_key].sort(key=lambda x: int(re.search(r'model_\d+_response_(\d+)', x["file_name"]).group(1)))
    
    # Sort the dictionary by model number
    sorted_check_results = {k: v for k, v in sorted(all_check_results.items(), key=lambda item: int(item[0].split('_')[1]))}

    model_results = {
    model_name: [
        item for item in items if item['file_name'].startswith('model')
    ]
    for model_name, items in sorted_check_results.items()}

    return model_results

def load_libraries(lib_files, lib_files_dir, version, omc):
    load1 = omc.sendExpression(f'loadFile("D:/Program/OpenModelica1.18.1-64bit/lib/omlibrary/Modelica {version}/package.mo")')
    for i in lib_files:
        lib_file_name = os.path.join(lib_files_dir, i)
        load_lib = omc.sendExpression(f'loadFile("{lib_file_name}")')
        last_folder = os.path.basename(os.path.dirname(lib_file_name))
        print(f"loading {last_folder} ... {load_lib}")

def initialize_omc():
    try:
        omc = OMCSessionZMQ()
        version = omc.sendExpression("getVersion()")
        print(f"OMC initialized successfully. Version: {version}")
        return omc
    except Exception as e:
        print("Failed to initialize OMC. Retrying...")
        return None
    
# # Initialize the OMC session
# omc = OMCSessionZMQ()
# allowed_restrictions = {'class', 'block', 'model'}
# # Load the libraries that are dependent (including the tested components)
# lib_files_dir = r"E:/Research_Work2/modelica generation/library-OM"
# lib_files_json = r"E:/Research_Work2/modelica generation/model_generation/libraries.json"

# with open(lib_files_json, 'r') as file:
#     lib_files_data = json.load(file)

# n = 15
# # Directory containing the .mo files
# mo_files_base_dir = f"E:/Research_Work2/modelica generation/model_generation/result_model/starcoder2/feedback-15B-Grag/model-15b"
# simu_base_dir = f"E:/Research_Work2/modelica generation/model_generation/result_model/starcoder2/feedback-15B-Grag/simulation"
# results_dir = f"E:/Research_Work2/modelica generation/model_generation/result_model/starcoder2/feedback-15B-Grag"
# os.makedirs(results_dir, exist_ok=True)

# # Dictionary to store all check results categorized by model number
# all_check_results = {}

# # Process each version separately
# for version, lib_files in lib_files_data.items():
#     mo_files_dir = os.path.join(mo_files_base_dir, f"model-{version}")
#     simu_dir = os.path.join(simu_base_dir, f"simulation-{version}")
#     os.makedirs(simu_dir, exist_ok=True)
#     # Load libraries
#     load_libraries(lib_files, lib_files_dir, version)    
#     model_results = process_version_model(version, mo_files_dir, simu_dir, all_check_results, lib_files, lib_files_dir)
#     clear = omc.sendExpression("clear()")

# # Define the output JSON file path
# output_file = os.path.join(results_dir, f"all_check_results_by_model.json")

# # Write all check results to the output JSON file
# with open(output_file, 'w') as file:
#     json.dump(model_results, file, indent=4)

# print(f"All check results are saved.")