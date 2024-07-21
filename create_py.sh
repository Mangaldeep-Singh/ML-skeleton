#!/bin/bash

# Function to create the Python file with template content
create_py_file_with_template() {
    local file_path="$1"
    local file_name="$2"

    echo "Creating file with path: $(echo ${file_path%/*}) and name: $file_name"

    # Create the Python file with the template content
    touch "$file_path"

    {
        echo "# Purpose: $file_name"
        echo "# Version:"
        echo "# Creation date: $(date)"
        echo "# Modified date: $(date)"
        echo "# Author: Mangaldeep Singh"
        echo "## START ##"
        echo ""
        echo "# TODO Section"
        echo ""
        echo "if __name__ == \"__main__\":"
        echo "    pass"
        echo ""
        echo ""
        echo "## STOP ##"
    } > "$file_path"

    # Check if the file was created successfully
    path_n=$(echo ${file_path%/*})
    if [ $? -eq 0 ]; then
        echo "Python file created at: $(echo ${path_n##*/})"
    else
        echo "Failed to create Python file."
        exit 1
    fi
}

# Main function to handle file creation logic

    #echo "Number of arguments: $#"
    #echo "Arguments: $@"

    if [ "$#" -eq 1 ]; then
        # Single argument passed
        file_path="$1"
        echo "Single argument detected:" #$file_path"

        if [[ "$file_path" == *.py ]]; then
            # Create the Python file with the template
            create_py_file_with_template "$file_path" "$(basename "$file_path" .py)"
        else
            echo "Error: Single argument must have a .py extension."
            exit 1
        fi

    elif [ "$#" -eq 2 ]; then
        # Two arguments passed (directory and file name)
        dir_name="$1"
        file_name="$2"
        echo "Directory: $dir_name"
        echo "File name: $file_name"

        # Ensure file_name has .py extension
        if [[ "$file_name" != *.py ]]; then
            file_name="${file_name}.py"
        fi

        # Construct the full path
        file_path="${dir_name}/${file_name}"
        echo "Full path: $file_path"

        # Create the directory if it doesn't exist
        mkdir -p "$dir_name"

        # Check if the directory was created successfully
        if [ $? -ne 0 ]; then
            echo "Failed to create directory: $dir_name"
            exit 1
        fi

        # Create the Python file with the template
        create_py_file_with_template "$file_path" "$file_name"
    else
        echo "Usage: $0 <file_path_with_py_extension> or $0 <directory_name> <file_name_without_extension>"
        #exit 1
    fi


