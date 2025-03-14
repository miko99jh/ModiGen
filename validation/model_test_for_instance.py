import os
import shutil
import pandas as pd
from OMPython import OMCSessionZMQ
import re
from tqdm import tqdm

# Function to load simulation durations from CSV
def load_simulation_durations(csv_path):
    durations_df = pd.read_csv(csv_path, encoding='latin1')
    # Convert to a dictionary: {model_number: duration}
    return dict(zip(durations_df['model_number'], durations_df['simulation_duration']))

# Function to check a model and store the result in a dictionary
def check_model(file_path, simu_dir, all_check_results, simulation_durations, omc):
    file_name = os.path.splitext(os.path.basename(file_path))[0]
    model_number = int(re.search(r'instance_(\d+)', file_name).group(1))

    # Load the .mo file
    load = omc.sendExpression(f'loadFile("{file_path}")')
    is_simulation = False
    error_msg = ""
    if load:
        load_state = True
        class_names = omc.sendExpression("getClassNames()")
        model_name = class_names[0]
        check_result = omc.sendExpression(f"checkModel({model_name})")
        if check_result:
            # Retrieve simulation duration for this model
            simulation_duration = simulation_durations.get(f'instance_{model_number}', 1.0)  # Default to 1.0 if not found
            # Create a directory for simulation results
            simulation_dir = os.path.join(simu_dir, file_name)
            os.makedirs(simulation_dir, exist_ok=True)
            omc.sendExpression(f"simulate({model_name}, stopTime={simulation_duration})")
            for file in os.listdir("."):
                if file.startswith(model_name):
                    shutil.move(file, simulation_dir)
            simulation = len(os.listdir(simulation_dir))
            if simulation > 0:
                is_simulation = True
            else:
                error_msg = omc.sendExpression("getErrorString()")
        else:
            error_msg = omc.sendExpression("getErrorString()")
        omc.sendExpression(f'deleteClass({model_name})')
    else:
        error_msg = omc.sendExpression("getErrorString()")
        load_state = False
        class_names = {}
        model_name = ""
        check_result = ""

    check_result_dict = {
        "file_name": file_name,
        "model_name": model_name,
        "load_state": load_state,
        "check_result": check_result,
        "is_simulation": is_simulation,
        "error_msg": error_msg
    }

    model_key = f"instance_{model_number}"
    if model_key in all_check_results:
        all_check_results[model_key].append(check_result_dict)
    else:
        all_check_results[model_key] = [check_result_dict]
    return omc

# Function to load libraries and check models for a specific version
def process_version_instance(version, mo_files_dir, simu_dir, all_check_results, simulation_durations, lib_files, lib_files_dir, omc):
    for mo_file in tqdm(os.listdir(mo_files_dir), desc=f"Checking models for version {version}"):
        version = omc.sendExpression("getVersion()")
        if version is None:
            omc = OMCSessionZMQ()
            load_libraries1(lib_files, lib_files_dir, version, omc)
        if mo_file.endswith('.mo'):
            mo_file_path = os.path.join(mo_files_dir, mo_file)
            check_model(mo_file_path, simu_dir, all_check_results, simulation_durations, omc)

    for model_key in all_check_results:
        all_check_results[model_key].sort(key=lambda x: int(re.search(r'instance_\d+_response_(\d+)', x["file_name"]).group(1)))
    sorted_check_results = {k: v for k, v in sorted(all_check_results.items(), key=lambda item: int(item[0].split('_')[1]))}
    return sorted_check_results

def load_libraries1(lib_files, lib_files_dir, version, omc):
    load1 = omc.sendExpression(f'loadFile("D:/Program/OpenModelica1.18.1-64bit/lib/omlibrary/Modelica {version}/package.mo")')
    for i in lib_files:
        lib_file_name = os.path.join(lib_files_dir, i)
        load_lib = omc.sendExpression(f'loadFile("{lib_file_name}")')
        last_folder = os.path.basename(os.path.dirname(lib_file_name))
        print(f"loading {last_folder} ... {load_lib}")
        
# Load libraries
# lib_files_dir = r"E:/Research_Work2/modelica generation/library-OM"
# lib_files_json = r"E:/Research_Work2/modelica generation/model_generation/libraries.json"

# with open(lib_files_json, 'r') as file:
#     lib_files_data = json.load(file)

# # Load simulation durations from CSV
# simulation_durations_csv = r"E:/Research_Work2/modelica generation/model_generation/instance_prompts/reference_instance/simulation_durations.csv"
# simulation_durations = load_simulation_durations(simulation_durations_csv)

# # Directories
# mo_files_base_dir = f"E:/Research_Work2/modelica generation/model_generation/result_instance/codellama/feedback-34B-sft/model-34b"
# simu_base_dir = f"E:/Research_Work2/modelica generation/model_generation/result_instance/codellama/feedback-34B-sft/simulation"
# results_dir = f"E:/Research_Work2/modelica generation/model_generation/result_instance/codellama/feedback-34B-sft"
# os.makedirs(results_dir, exist_ok=True)

# all_check_results = {}

# # Process each version
# for version, lib_files in lib_files_data.items():
#     mo_files_dir = os.path.join(mo_files_base_dir, f"model-{version}")
#     simu_dir = os.path.join(simu_base_dir, f"simulation-{version}")
#     os.makedirs(simu_dir, exist_ok=True)
#     load1 = omc.sendExpression(f'loadFile("D:/Program/OpenModelica1.18.1-64bit/lib/omlibrary/Modelica {version}/package.mo")')
#     for i in lib_files:
#         lib_file_name = os.path.join(lib_files_dir, i)
#         load_lib = omc.sendExpression(f'loadFile("{lib_file_name}")')
#         last_folder = os.path.basename(os.path.dirname(lib_file_name))
#         print("loading", last_folder, "...", load_lib)
#     model_results = process_version_instance(version, mo_files_dir, simu_dir, all_check_results, simulation_durations)
#     clear = omc.sendExpression("clear()")

# output_file = os.path.join(results_dir, f"all_check_results_by_instance.json")

# with open(output_file, 'w') as file:
#     json.dump(model_results, file, indent=4)

# print(f"All check results are saved.")
