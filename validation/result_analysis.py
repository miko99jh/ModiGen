# Function to analyze the results after validation

def analyze_relationship(data, total_files):
    results = {
        "statistics": {
        "total_txt_files": 0,
        "total_models": 0,
        "load_state_false": 0,
        "load_state_true": 0,
        "load_state_true_check_empty": 0,
        "load_state_true_check_not_empty": 0,
        "check_not_empty_simu_false": 0,
        "check_not_empty_simu_true": 0
    },
        "model_summary": {}
    }
    # Go through each model
    for model_key, entries in data.items():
        model_summary = {
            "model_files": 0,
            "load_state_false": 0,
            "load_state_true": 0,
            "load_state_true_check_empty": 0,
            "load_state_true_check_not_empty": 0,
            "check_not_empty_simu_false": 0,
            "check_not_empty_simu_true": 0
        }

        results_lengths = len(entries)
        for entry in entries:
            results["statistics"]["total_models"] += 1
            model_summary["model_files"] = results_lengths
            load_state = entry.get("load_state", False)
            check_result = entry.get("check_result", "")
            is_simulation = entry.get("is_simulation", False)
            check_empty = not bool(check_result.strip())

            if load_state:
                model_summary["load_state_true"] += 1
                results["statistics"]["load_state_true"] += 1
                if check_empty:
                    model_summary["load_state_true_check_empty"] += 1
                    results["statistics"]["load_state_true_check_empty"] += 1
                else:
                    model_summary["load_state_true_check_not_empty"] += 1
                    results["statistics"]["load_state_true_check_not_empty"] += 1
                    if is_simulation:
                        model_summary["check_not_empty_simu_true"] += 1
                        results["statistics"]["check_not_empty_simu_true"] += 1
                    else:
                        model_summary["check_not_empty_simu_false"] += 1
                        results["statistics"]["check_not_empty_simu_false"] += 1
            else:
                model_summary["load_state_false"] += 1
                results["statistics"]["load_state_false"] += 1

        results["model_summary"][model_key] = model_summary

    results["statistics"]["total_txt_files"] = total_files

    return results

# Function to add type to the results from models JSON
def add_type_to_results(models_data, results_data):
    # Create a mapping from model id to type
    model_type_map = {str(model['id']): model['type'] for model in models_data}

    # Add 'type' to each model result in the 'results' data
    for model_key, result in results_data.items():
        model_id = model_key.split('_')[1]  # Assuming the format is "mode_{id}"
        if model_id in model_type_map:
            result['type'] = model_type_map[model_id]
    return results_data