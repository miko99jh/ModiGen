import numpy as np
import itertools
from typing import Union, List
import json

# Definition the calculation of pass@k
def estimate_pass_at_k(
    num_samples: Union[int, List[int], np.ndarray],
    num_correct: Union[List[int], np.ndarray],
    k: int
) -> np.ndarray:
    """
    Estimates pass@k of each problem and returns them in an array.
    """
 
    def estimator(n: int, c: int, k: int) -> float:
        """
        Calculates 1 - comb(n - c, k) / comb(n, k).
        """
        if n - c < k:
            return 1.0
        return 1.0 - np.prod(1.0 - k / np.arange(n - c + 1, n + 1))
 
    if isinstance(num_samples, int):
        num_samples_it = itertools.repeat(num_samples, len(num_correct))
    else:
        assert len(num_samples) == len(num_correct)
        num_samples_it = iter(num_samples)
 
    return np.array([estimator(int(n), int(c), k) for n, c in zip(num_samples_it, num_correct)])

input_file = f"result/GPT4o/results_analysis_model.json"

with open(input_file, 'r') as file:
    results = json.load(file)

# Extracting num_samples and num_correct
num_samples = [10 for _ in range(126)]
num_samples1 = [model["txt_files"] for model in results["results"].values()] # The total number of samples per question
num_correct1 = [model["check_function_correct"] for model in results["results"].values()] # The correct number of samples for each question

num_correct = num_correct1[:126] + [0] * (126 - len(num_correct1))

# Call the function to compute pass@k
pass_at_1_results = estimate_pass_at_k(num_samples, num_correct, 1)
avg_pass_at_1 = np.mean(pass_at_1_results)

pass_at_10_results = estimate_pass_at_k(num_samples, num_correct, 10)
avg_pass_at_10 = np.mean(pass_at_10_results)
# Output the result
print("num_samples:", num_samples)
print("num_correct:", num_correct)
# print(f"Pass@{1} result:\n", pass_at_1_results)
print(f"Average Pass@{1}:", avg_pass_at_1)
print(f"Average Pass@{10}:", avg_pass_at_10)