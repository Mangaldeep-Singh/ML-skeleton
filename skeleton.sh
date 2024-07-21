#!bin/bash
#Purpose: To create python script templates
#Version: 0.1
#Creation date: Thu July 20 10:20:35 IST 2023
#Modified date:
#Author: Mangaldeep Singh
## START ##

# Get the path where script actually resides when it is called from other loc
SCRIPT_DIR="$(dirname "$(realpath "${BASH_SOURCE[0]}")")"
#echo "$SCRIPT_DIR"
CREATE_DIR_SCRIPT="$SCRIPT_DIR/create_dir.sh"
CREATE_FILE_SCRIPT="$SCRIPT_DIR/create_file.sh"

# Function to call the directory creation script and capture the master directory path
create_dir_levels() {
    local base_path="$1"
    local type="$2"
    shift 2
    local dirs=("$@")

    # Call the create_dirs_with_type.sh script and capture the output
    local output
    output=$(bash "$CREATE_DIR_SCRIPT" "$base_path" "$type" "${dirs[@]}")

    # If type is master, get the last line of the output
    if [ "$type" == "master" ]; then
        local master_dir
        master_dir=$(echo "$output" | tail -n 1)
        
        # Check if the master directory was created successfully
        if [ -z "$master_dir" ]; then
            echo "Failed to create the master directory."
            exit 1
        fi
        
        echo "$master_dir"
    else
        # For other types, just print the output
        echo "$output"
    fi
}



# Define the base path for the master directory
base_path=`pwd` #storing project main working directory
echo "Enter the name of project that you want to create"
read -r project
# Call the directory creation script for the master directory and capture the output 
master_dir=$(create_dir_levels "$base_path" master "$project")

echo "Master directory created : $master_dir"


# Define the sub-directory level 1 structure under 'data'
data_path="$master_dir/"
create_dir_levels "$data_path" sub "data" "notebooks" "src" "tests"

# Define the sub-directory level 2 structure under 'data'
data_path="$master_dir/data"
create_dir_levels "$data_path" sub "raw" "processed" "external"

# Define the sub-directory level 2 structure under 'src'
data_path="$master_dir/src"
create_dir_levels "$data_path" sub "data" "features" "models" "visualization" "utils"

echo "Folder structure has been created."

# Create files at master location

bash $CREATE_FILE_SCRIPT "$master_dir"




