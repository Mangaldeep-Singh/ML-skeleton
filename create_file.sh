#!/bin/bash

# Get the path where script actually resides when it is called from other loc
SCRIPT_DIR="$(dirname "$(realpath "${BASH_SOURCE[0]}")")"
# Define the associative array for folders and files
declare -A folder_structure

# Add folder names and their corresponding file names with extensions

folder_structure["notebooks"]="notebook1.ipynb notebook2.ipynb"
folder_structure["src/data"]="load_data.py preprocess.py"
folder_structure["src/features"]="build_features.py"
folder_structure["src/models"]="train_model.py evaluate_model.py"
folder_structure["src/visualization"]="visualize.py"
folder_structure["src/utils"]="helper_functions.py"
folder_structure["BASE_DIR"]="main.py Readme.md util.ms"  #creates files at base/root location

# Define a mapping for file extensions and corresponding scripts
declare -A extension_scripts
extension_scripts[".py"]="create_py.sh"
extension_scripts[".md"]="cr_readme.sh"
extension_scripts[".ipynb"]="create_notebook.sh"
extension_scripts[".ms"]="util_files.sh"
# Function to create folders and files (debug version)
create_structure() {
    local base_dir="$1"

    for folder in "${!folder_structure[@]}"; do
        # Echo the folder creation
         if [ "$folder" == "BASE_DIR" ]; then
            target_dir="$base_dir"
        else
            target_dir="$base_dir/$folder"
        fi
        echo ""
        echo "Would create folder: $target_dir"

        # Create the folder (debug output)
        #echo "mkdir -p $target_dir"
        mkdir -p "$target_dir"

        # Create files within the folder
        for file in ${folder_structure[$folder]}; do
            full_path="$target_dir/$file"

            # Echo the file creation
            echo "Would create file: $(basename "$full_path")"

            # Extract file extension
            extension=".${file##*.}"
            script="${extension_scripts[$extension]}"

            # Echo script call
            if [ -n "$script" ]; then
                echo "Would call script: ./$script \"$full_path\""
                "$SCRIPT_DIR/$script" "$full_path"
            else
                echo "No script found for file extension: $extension"
            fi
        done
    done
}

# Main script logic
main() {
    # Check if a base directory was provided
    if [ -z "$1" ]; then
        echo "Usage: $0 <base_directory>"
        exit 1
    fi

    local base_dir="$1"
    echo "script : $0"
    echo $base_dir
    echo ""
    # Call the function to create the folder structure and files
    create_structure "$base_dir"
}

# Run the main function
main "$@"

