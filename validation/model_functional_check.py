import os
import re
import json
import numpy as np
import pandas as pd
import scipy.io as sio

# Set tolerance range (MSE upper limit)
MSE_THRESHOLD = 1e-3

# Data matching: Find the most similar signal column
def find_closest_values(reference_data, validated_data):
    """
    Finds the column in validated_data (excluding the first column) that is closest 
    to the last column of reference_data.
    
    Args:
        reference_data (ndarray): Reference data (N, M), using the last column as ground truth.
        validated_data (ndarray): Simulation data (N, L), comparing from the second column onwards.
    
    Returns:
        closest_column (ndarray): The column from validated_data most similar to the reference.
    """
    # Extract the last column of reference_data as the target signal
    reference_column = reference_data[:, -1]
    # Skip the first column (usually time) of validated_data
    validated_columns = validated_data[:, 1:]

    # Initialize minimum distance and corresponding column
    min_distance = float('inf')
    closest_column = None

    # Iterate over each candidate column to find the minimum Euclidean distance
    for col_idx in range(validated_columns.shape[1]):
        candidate_column = validated_columns[:, col_idx]
        distance = np.linalg.norm(candidate_column - reference_column)
        
        # Update if a smaller distance is found
        if distance < min_distance:
            min_distance = distance
            closest_column = candidate_column

    return closest_column

# Align data length based on time points
def adjust_length(data_1, data_2):
    """
    Extracts the closest time point data from validated_data based on the 
    time points in reference_data.
    
    Args:
        data_1: Numpy array, reference data where the first column is time.
        data_2: Numpy array, validation data where the first column is time.

    Returns:
        data_1: The original reference data.
        aligned_validated_data: Validation data aligned to reference time points.
    """
    # Get time columns
    data1_time = data_1[:, 0]  # Reference time column
    data2_time = data_2[:, 0]  # Validation time column

    aligned_validated_data = []

    for ref_t in data1_time:
        # Find the index of the validated_time closest to ref_t
        closest_index = np.argmin(np.abs(data2_time - ref_t))
        
        # Extract the corresponding data row
        aligned_validated_data.append(data_2[closest_index, :])

    aligned_validated_data = np.array(aligned_validated_data)

    return data_1, aligned_validated_data

# Linear interpolation to adjust data to target length
def interpolate_to_length(data, target_length):
    x_original = np.linspace(0, 1, len(data))  # Original points
    x_target = np.linspace(0, 1, target_length)  # Target points
    interpolated_data = np.interp(x_target, x_original, data)
    return interpolated_data

# Load CSV data (Reference Model)
def load_csv_data(csv_path):
    """
    Loads data from a CSV file, assuming time and output values are present.
    Returns a numpy array.
    """
    try:
        data = pd.read_csv(csv_path)
        return data.values
    except Exception as e:
        print(f"Error loading CSV data: {e}")
        return None

# Load MAT data (Simulation Result)
def load_mat_data(mat_path):
    """
    Loads a MAT file and extracts numerical data from the 'data_2' variable.
    Returns a numpy array.
    """
    try:
        mat_data = sio.loadmat(mat_path)
        if "data_2" in mat_data:
            return mat_data["data_2"]
        else:
            raise KeyError("'data_2' variable not found in MAT file.")
    except Exception as e:
        print(f"Error loading MAT data: {e}")
        return None

# Calculate Mean Squared Error (MSE)
def calculate_mse(data1, data2):
    """
    Calculates the Mean Squared Error between two data sequences.
    """
    mse = np.mean((data1 - data2) ** 2)
    return mse

# Update results in JSON file
def update_json_results(json_path, model_key, passed_count):
    try:
        # Load existing JSON data
        with open(json_path, "r") as file:
            results_data = json.load(file)

        # Check if the model key exists
        if model_key not in results_data["results"]:
            raise KeyError(f"{model_key} does not exist in the JSON file.")

        # Update or add the functional correctness field
        results_data["results"][model_key]["check_function_correct"] = passed_count

        # Write back to JSON
        with open(json_path, "w") as file:
            json.dump(results_data, file, indent=4)

        print(f"Successfully updated {json_path}: {model_key} -> check_function_correct = {passed_count}")

    except Exception as e:
        print(f"Error updating JSON file: {e}")