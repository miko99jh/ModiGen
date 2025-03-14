# Delete files other than .mat files to save disk space
import os

def retain_mat_files(base_dir):
    """
    Recursively traverses directories, retaining only `.mat` files and removing others.
    If a folder becomes empty after deletion, it will also be removed.
    
    :param base_dir: The root directory to start the traversal.
    """
    for root, dirs, files in os.walk(base_dir, topdown=False):  # Traverse from bottom to top
        # Retain only .mat files
        for file in files:
            if not file.endswith('.mat'):
                file_path = os.path.join(root, file)
                try:
                    os.remove(file_path)
                    print(f"Deleted file: {file_path}")
                except Exception as e:
                    print(f"Error deleting file {file_path}: {e}")
        
        # Remove empty directories
        for dir_ in dirs:
            dir_path = os.path.join(root, dir_)
            if not os.listdir(dir_path):  # Check if the directory is empty
                try:
                    os.rmdir(dir_path)
                    print(f"Deleted empty folder: {dir_path}")
                except Exception as e:
                    print(f"Error deleting folder {dir_path}: {e}")

# Example usage
if __name__ == "__main__":
    choice = "codellama/13B-sft"
    base_directory = f"/xxx/generation_example/result_model/{choice}/simulation"  # Replace with your directory path
    retain_mat_files(base_directory)
