# Component model functional validation script, used after the __main__ function to compute pass_f@k.
import os
import re
import json
import numpy as np
import pandas as pd
import scipy.io as sio

# Set tolerance range (MSE upper limit)
MSE_THRESHOLD = 1e-3
 
# Data matching: Find the most recent value
def find_closest_values(reference_data, validated_data):
    """
    Find the closest column in validated_data to the last column of reference_data.
    
    Args:
        reference_data (ndarray): Reference data (N, M), using only the last column as a reference.
        validated_data (ndarray): Validation data (N, L), comparing from the second column onward.
    
    Returns:
        closest_row (ndarray): The column in validated_data closest to the last column of reference_data.
    """
    # Extract the last column of reference_data
    reference_column = reference_data[:, -1]
    # Skip the first column of validated_data
    validated_columns = validated_data[:, 1:]

    # Initializes the minimum distance and corresponding columns
    min_distance = float('inf')
    closest_column = None

    # Iterate over each column of validated_columns, calculating the distance to the reference_column
    for col_idx in range(validated_columns.shape[1]):
        candidate_column = validated_columns[:, col_idx]
        distance = np.linalg.norm(candidate_column - reference_column)
        
        # Updates the columns with the smallest distance and closest proximity
        if distance < min_distance:
            min_distance = distance
            closest_column = candidate_column

    return closest_column

# Adjust column length consistently
def adjust_length(data_1, data_2):
    """
    Extract the closest time point data from validated_data based on reference_data time points.
    
    Args:
    - reference_data: numpy array, reference data, with the first column as time.
    - validated_data: numpy array, validation data, with the first row as time.

    Returns:
    - reference_data: Adjusted reference data.
    - aligned_validated_data: Validation data aligned according to reference_data time points.
    """
    # Get reference time points and verification time points
    data1_time = data_1[:, 0]  # Time column of reference data
    data2_time = data_2[:, 0]  # Time column of validation data

    aligned_validated_data = []

    for ref_t in data1_time:
        # Find the closest validated_time index to ref_t
        closest_index = np.argmin(np.abs(data2_time - ref_t))
        
        # Extract the corresponding validated_data column at this time point
        aligned_validated_data.append(data_2[closest_index, :])  # Retrieve data at the corresponding time point

    aligned_validated_data = np.array(aligned_validated_data)  # Convert to row-aligned format

    return data_1, aligned_validated_data

# The interpolation function adjusts the data to the target length
def interpolate_to_length(data, target_length):
    x_original = np.linspace(0, 1, len(data))  # Original data points
    x_target = np.linspace(0, 1, target_length)  # Target points
    interpolated_data = np.interp(x_target, x_original, data)
    return interpolated_data

# Load the output data of the reference model
def load_csv_data(csv_path):
    """
    Load data from a CSV file, assuming time column and output values are stored in the file.
    Returns a numpy array containing the time column and data columns.
    """
    try:
        data = pd.read_csv(csv_path)
        return data.values  # Return as numpy array
    except Exception as e:
        print(f"Error loading CSV data: {e}")
        return None

# Load the MAT file data of the model to be verified
def load_mat_data(mat_path):
    """
    Load a MAT file and extract numerical data from the data_2 variable.
    Returns a numpy array containing the time column and data columns.
    """
    try:
        mat_data = sio.loadmat(mat_path)
        if "data_2" in mat_data:
            return mat_data["data_2"]
        else:
            raise KeyError("Variable 'data_2' not found in MAT file.")
    except Exception as e:
        print(f"Error loading MAT data: {e}")
        return None

# Calculated mean square Error (MSE)
def calculate_mse(data1, data2):
    """
    Compute the mean square error between two data sequences.
    """
    mse = np.mean((data1 - data2) ** 2)
    return mse

# Update JSON file
def update_json_results(json_path, model_key, passed_count):
    try:
        # Load existing JSON data
        with open(json_path, "r") as file:
            results_data = json.load(file)

        # Check if model_n exists
        if model_key not in results_data["results"]:
            raise KeyError(f"{model_key} does not exist in JSON file.")

        # Update or add check_function_correct field
        results_data["results"][model_key]["check_function_correct"] = passed_count

        # Write back to JSON file
        with open(json_path, "w") as file:
            json.dump(results_data, file, indent=4)

        print(f"Successfully updated {json_path}: {model_key} -> check_function_correct = {passed_count}")

    except Exception as e:
        print(f"Error updating JSON file: {e}")

# Main function
def main():
    choice = "starcoder2/feedback-15B-Grag"
    results_json_path = f"E:/Research_Work2/modelica generation/model_generation/result_model/{choice}/results_analysis_model.json"
    # Define file paths
    for n in range(1, 130):
        passed_count = 0
        failed_count = 0
        print(f"\n\033[32mmodel_{n}\033[0m")
        reference_csv_dir = "E:/Research_Work2/modelica generation/model_generation/model_prompts/reference_model"
        mat_file_dir = f"E:/Research_Work2/modelica generation/model_generation/result_model/{choice}/simulation"

        # Match filenames using regex pattern
        # pattern = re.compile(f"{n}_Test_.*\\.csv")
        pattern = re.compile(f"{n}_.*\\.csv")
        matching_files = [f for f in os.listdir(reference_csv_dir) if pattern.match(f)]

        if matching_files == []:
            reference_data = None
            print("\033[33mFailed to load reference data file, verification cannot continue.\033[0m")
            model_key = f"model_{n}"
            update_json_results(results_json_path, model_key, passed_count)
            continue
        
        # Load reference model data
        reference_csv_path = os.path.join(reference_csv_dir, matching_files[0])  # Reference model CSV file path    
        reference_data = load_csv_data(reference_csv_path)

        # Match folders starting with model_{n}
        folder_pattern = re.compile(f"model_{n}_")
        mat_files = []
        for root, dirs, files in os.walk(mat_file_dir):
            if folder_pattern.match(os.path.basename(root)):
                mat_files += [os.path.join(root, file) for file in files if file.endswith(".mat")]

        if not mat_files:
            print("\033[33mNo successful simulation cases were generated for this model, verification cannot continue.\033[0m")
            model_key = f"model_{n}"
            update_json_results(results_json_path, model_key, passed_count)
        else:
            for mat_file_path in mat_files:
                validated_data = load_mat_data(mat_file_path)
                id_path = os.path.normpath(mat_file_path).split(os.sep)[-2]

                if validated_data is None:
                    print(f"\033[91mFailed to load MAT file {mat_file_path}, verification cannot continue.\033[0m")
                    failed_count += 1
                    continue
                if validated_data.size == 0:
                    print(f"\033[35mMAT file {mat_file_path} contains no valid validation results, verification cannot continue.\033[0m")
                    failed_count += 1
                    continue
                validated_data = validated_data.T

                try:
                    # Adjust data row and column length consistency
                    ref_rows, ref_cols = reference_data.shape
                    val_rows, val_cols = validated_data.shape
                    if ref_rows < val_rows:
                        reference_data, validated_data = adjust_length(reference_data, validated_data)
                        print(f"\033[36m{id_path}: ref_rows < val_rows\033[0m")
                    if ref_rows > val_rows:
                        validated_data, reference_data = adjust_length(validated_data, reference_data)
                        print(f"\033[36m{id_path}: ref_rows > val_rows\033[0m")

                    # Match closest values
                    matched_validated_data = find_closest_values(reference_data, validated_data)

                    # Compute MSE
                    mse = calculate_mse(reference_data[:, -1], matched_validated_data)

                    # Check MSE threshold
                    if mse <= MSE_THRESHOLD:
                        print(f"{id_path} Function verification passed: MSE = {mse:.6f} (below threshold {MSE_THRESHOLD})")
                        passed_count += 1
                    else:
                        print(f"\033[91m{id_path} Function verification failed: MSE = {mse:.6f} (above threshold {MSE_THRESHOLD})\033[0m")
                        failed_count += 1

                except Exception as e:
                    print(f"{id_path} Error occurred during verification: {e}")

            print(f"\nTotal number of models passed: {passed_count}\nTotal number of models failed: {failed_count}")

            # Update JSON file
            model_key = f"model_{n}"
            update_json_results(results_json_path, model_key, passed_count)
        
if __name__ == "__main__":
    main()
