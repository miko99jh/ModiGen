# Description: The comprehensive result after calculating feedback
import json

def read_json(file_path):
    with open(file_path, 'r', encoding='utf-8') as f:
        return json.load(f)

def write_json(data, file_path):
    with open(file_path, 'w', encoding='utf-8') as f:
        json.dump(data, f, ensure_ascii=False, indent=4)

def combine_json_values(json1, json2):
    combined = {
        "statistics": {
            "total_txt_files": json1["statistics"]["total_txt_files"],
            "total_models": json1["statistics"]["check_not_empty_simu_true"] + json2["statistics"]["total_models"],
            "load_state_false": json2["statistics"]["load_state_false"],
            "load_state_true": json1["statistics"]["check_not_empty_simu_true"] + json2["statistics"]["total_models"] - json2["statistics"]["load_state_false"],
            "load_state_true_check_empty": json2["statistics"]["load_state_true_check_empty"],
            "load_state_true_check_not_empty": json1["statistics"]["check_not_empty_simu_true"] + json2["statistics"]["total_models"] - json2["statistics"]["load_state_false"] - json2["statistics"]["load_state_true_check_empty"],
            "check_not_empty_simu_false": json2["statistics"]["check_not_empty_simu_false"],
            "check_not_empty_simu_true": json1["statistics"]["check_not_empty_simu_true"] + json2["statistics"]["check_not_empty_simu_true"],
        },
        "results": {}
        }
    
    for model in json1["results"]:
        if model in json2["results"]:
            combined["results"][model] = {
                "txt_files": json1["results"][model]["txt_files"],
                "model_files": json1["results"][model]["check_not_empty_simu_true"] + json2["results"][model]["model_files"],
                "load_state_false": json2["results"][model]["load_state_false"],
                "load_state_true": json1["results"][model]["check_not_empty_simu_true"] + json2["results"][model]["model_files"] - json2["results"][model]["load_state_false"],
                "load_state_true_check_empty": json2["results"][model]["load_state_true_check_empty"],
                "load_state_true_check_not_empty": json1["results"][model]["check_not_empty_simu_true"] + json2["results"][model]["model_files"] - json2["results"][model]["load_state_false"] - json2["results"][model]["load_state_true_check_empty"],
                "check_not_empty_simu_false": json2["results"][model]["check_not_empty_simu_false"],
                "check_not_empty_simu_true": json1["results"][model]["check_not_empty_simu_true"] + json2["results"][model]["check_not_empty_simu_true"],
                # "type": json1["results"][model]["type"],
                "check_function_correct": json1["results"][model]["check_function_correct"] + json2["results"][model]["check_function_correct"]
            }
        else:
            combined["results"][model] = json1["results"][model]

    return combined

mode = "instance"

file1_path = f'/xxx/generation_example/result_{mode}/GPT4o/GPT4o/results_analysis_{mode}.json'
file2_path = f'/xxx/generation_example/result_{mode}/GPT4o/feedback-GPT4o/results_analysis_{mode}.json'
output_path = f'/xxx/generation_example/result_{mode}/GPT4o/feedback-GPT4o/results_analysis_{mode}_plus.json'

json1 = read_json(file1_path)
json2 = read_json(file2_path)

combined_json = combine_json_values(json1, json2)

write_json(combined_json, output_path)

print(f'Combined JSON has been saved to {output_path}')
