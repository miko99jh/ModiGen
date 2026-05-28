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
    abs_path = os.path.abspath(file_path).replace('\\', '/')
    load = omc.sendExpression(f'loadFile("{abs_path}")')
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
        # version = omc.sendExpression("getVersion()")
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
    # Load the Modelica Standard Library of your local OpenModelica installation
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