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
    根据 reference_data 的最后一列，在 validated_data 的非第一列中找到最接近的一列。
    
    Args:
        reference_data (ndarray): 参考数据 (N, M)，仅使用最后一列作为参考。
        validated_data (ndarray): 验证数据 (N, L)，从第二列开始比较。
    
    Returns:
        closest_row (ndarray): 与 reference_data 的最后一列最接近的 validated_data 的一列。
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
    按照 reference_data 的时间点，从 validated_data 中提取最接近的时间点数据。
    
    参数：
    - reference_data: numpy 数组，参考数据，第一列是时间。
    - validated_data: numpy 数组，验证数据，第一行是时间。

    返回：
    - reference_data: 调整后的参考数据。
    - aligned_validated_data: 按照 reference_data 时间点对齐的验证数据。
    """
    # Get reference time points and verification time points
    data1_time = data_1[:, 0]  # 参考数据的时间列
    data2_time = data_2[:, 0]  # 验证数据的时间列

    aligned_validated_data = []

    for ref_t in data1_time:
        # 找到与 ref_t 最接近的 validated_time 索引
        closest_index = np.argmin(np.abs(data2_time - ref_t))
        
        # 提取该时间点对应的 validated_data 列
        aligned_validated_data.append(data_2[closest_index, :])  # 取相应时间点的数据部分

    aligned_validated_data = np.array(aligned_validated_data)  # 转置为行对齐格式

    return data_1, aligned_validated_data

# The interpolation function adjusts the data to the target length
def interpolate_to_length(data, target_length):
    x_original = np.linspace(0, 1, len(data))  # 原始数据的点
    x_target = np.linspace(0, 1, target_length)  # 目标点
    interpolated_data = np.interp(x_target, x_original, data)
    return interpolated_data

# Load the output data of the reference model
def load_csv_data(csv_path):
    """
    加载CSV文件中的数据，假定时间列和输出值存储在文件中。
    返回包含时间列和数据列的numpy数组。
    """
    try:
        data = pd.read_csv(csv_path)
        return data.values  # 返回为numpy数组
    except Exception as e:
        print(f"加载 CSV 数据时出错: {e}")
        return None

# Load the MAT file data of the model to be verified
def load_mat_data(mat_path):
    """
    加载MAT文件并提取data_2变量中的数值数据。
    返回包含时间列和数据列的numpy数组。
    """
    try:
        mat_data = sio.loadmat(mat_path)
        if "data_2" in mat_data:
            return mat_data["data_2"]
        else:
            raise KeyError("MAT 文件中未找到 'data_2' 变量。")
    except Exception as e:
        print(f"加载 MAT 数据时出错: {e}")
        return None

# Calculated mean square Error (MSE)
def calculate_mse(data1, data2):
    """
    计算两个数据序列的均方误差。
    """
    mse = np.mean((data1 - data2) ** 2)
    return mse

# 更新 JSON 文件
def update_json_results(json_path, model_key, passed_count):
    try:
        # 加载现有的 JSON 数据
        with open(json_path, "r") as file:
            results_data = json.load(file)

        # 检查 model_n 是否存在
        if model_key not in results_data["results"]:
            raise KeyError(f"{model_key} 不存在于 JSON 文件中。")

        # 更新或添加 check_function_correct 字段
        results_data["results"][model_key]["check_function_correct"] = passed_count

        # 写回 JSON 文件
        with open(json_path, "w") as file:
            json.dump(results_data, file, indent=4)

        print(f"已成功更新 {json_path}: {model_key} -> check_function_correct = {passed_count}")

    except Exception as e:
        print(f"更新 JSON 文件时出错: {e}")

# 主函数
if __name__ == "__main__":
    choice = "codellama/feedback-34B-sft"
    results_json_path = f"E:/Research_Work2/modelica generation/model_generation/result_instance/{choice}/results_analysis_instance.json"
    # 定义文件路径
    for n in range(1, 128):
        passed_count = 0
        failed_count = 0
        print(f"\n\033[32minstance_{n}\033[0m")
        reference_csv_dir = "E:/Research_Work2/modelica generation/model_generation/instance_prompts/reference_instance"
        mat_file_dir = f"E:/Research_Work2/modelica generation/model_generation/result_instance/{choice}/simulation"

        # 匹配文件名的正则表达式
        pattern = re.compile(f"{n}_Test_.*\\.csv")
        # pattern = re.compile(f"{n}_.*\\.csv")
        matching_files = [f for f in os.listdir(reference_csv_dir) if pattern.match(f)]

        if matching_files == []:
            reference_data = None
            print("\033[33m加载参考数据文件失败，无法继续验证。\033[0m")
            model_key = f"instance_{n}"
            update_json_results(results_json_path, model_key, passed_count)
            continue
        
        # 加载参考模型数据
        reference_csv_path = os.path.join(reference_csv_dir, matching_files[0])  # 参考模型的CSV文件路径    
        reference_data = load_csv_data(reference_csv_path)

        # 匹配以 model_{n} 为开头的文件夹
        folder_pattern = re.compile(f"instance_{n}_")
        mat_files = []
        for root, dirs, files in os.walk(mat_file_dir):
            if folder_pattern.match(os.path.basename(root)):
                mat_files += [os.path.join(root, file) for file in files if file.endswith(".mat")]

        if not mat_files:
            print("\033[33m该模型没有生成仿真成功的用例，无法继续验证。\033[0m")
            model_key = f"instance_{n}"
            update_json_results(results_json_path, model_key, passed_count)
        else:
            for mat_file_path in mat_files:
                validated_data = load_mat_data(mat_file_path)
                id_path = os.path.normpath(mat_file_path).split(os.sep)[-2]

                if validated_data is None:
                    print(f"\033[91m加载 MAT 文件 {mat_file_path} 失败，无法继续验证。\033[0m")
                    failed_count += 1
                    continue
                if validated_data.size == 0:
                    print(f"\033[35mMAT 文件 {mat_file_path} 无有效验证结果，无法继续验证。\033[0m")
                    failed_count += 1
                    continue
                validated_data = validated_data.T

                try:
                    # 调整数据行列长度一致
                    ref_rows, ref_cols = reference_data.shape
                    val_rows, val_cols = validated_data.shape
                    # if ref_rows < val_cols:
                    #     reference_output = interpolate_to_length(reference_output, val_cols)
                    # elif ref_rows > val_cols:
                    #     validated_data = np.array([interpolate_to_length(row, ref_rows) for row in validated_data])
                    if ref_rows < val_rows:
                        reference_data, validated_data = adjust_length(reference_data, validated_data)
                        print(f"\033[36m{id_path}:ref_rows < val_rows\033[0m")
                    if ref_rows > val_rows:
                        validated_data, reference_data = adjust_length(validated_data, reference_data)
                        print(f"\033[36m{id_path}:ref_rows > val_rows\033[0m")

                    # 匹配最近值
                    matched_validated_data = find_closest_values(reference_data, validated_data)

                    # 计算MSE
                    mse = calculate_mse(reference_data[:, -1], matched_validated_data)  # 跳过第一行

                    # 检查 MSE 阈值
                    if mse <= MSE_THRESHOLD:
                        print(f"{id_path} 功能验证通过: MSE = {mse:.6f} (低于阈值 {MSE_THRESHOLD})")
                        passed_count += 1
                    else:
                        print(f"\033[91m{id_path} 功能验证失败: MSE = {mse:.6f} (高于阈值 {MSE_THRESHOLD})\033[0m")
                        failed_count += 1

                except Exception as e:
                    print(f"{id_path} 验证过程中出错: {e}")

            print(f"\n验证通过的模型总数: {passed_count}\n验证未通过的模型总数: {failed_count}")

            # 更新 JSON 文件
            model_key = f"instance_{n}"
            update_json_results(results_json_path, model_key, passed_count)
