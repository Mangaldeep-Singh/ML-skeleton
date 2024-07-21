#!/bin/bash


create_notebook() {
# Extract parameters
dir_name="$1"
file_name="$2"
echo "file name : $file_name"
# Specify the notebook file name
notebook_file="${dir_name}"

# Create the notebook file
touch "$notebook_file"

# Specify the Markdown content to be added
markdown_content="##### Purpose: ${file_name}\n##### Version: \n##### Creation date: $(date)\n##### Modified date: $(date)\n##### Author: Mangaldeep Singh"

# Specify the Code content to be added
code_content="print('This is a code cell added via a shell script.')"

# Create a temporary file with the Markdown and Code content
echo '{
  "cell_type": "markdown",
  "metadata": {},
  "source": ["'"$markdown_content"'"]
}' > temp_markdown_cell.json

echo '{
  "cell_type": "code",
  "metadata": {},
  "source": ["'"$code_content"'"]
}' > temp_code_cell.json

# Use Python to create the notebook with the new cells
python -c "
import json

notebook_file = '$notebook_file'
temp_markdown_file = 'temp_markdown_cell.json'
temp_code_file = 'temp_code_cell.json'

# Initialize a new notebook
notebook = {'cells': [], 'metadata': {}, 'nbformat': 4, 'nbformat_minor': 5}

# Load the new Markdown cell
with open(temp_markdown_file, 'r') as f:
    new_markdown_cell = json.load(f)

# Load the new Code cell
with open(temp_code_file, 'r') as f:
    new_code_cell = json.load(f)

# Add the new cells to the notebook
notebook['cells'] += [new_markdown_cell, new_code_cell]

# Save the notebook
with open(notebook_file, 'w') as f:
    json.dump(notebook, f, indent=2)
"

# Clean up the temporary files
rm temp_markdown_cell.json temp_code_cell.json

echo "Markdown and Code cells added to '$notebook_file' successfully."

# Optional: Start Jupyter Notebook if needed (remove if not required)
# jupyter notebook --no-browser &
# Wait for the notebook server to start (adjust the sleep duration if needed)
# sleep 3

# Check if file creation was successful
if [ $? -eq 0 ]; then
    echo "Notebook file created: $notebook_file"
    exit 0
else
    echo "Failed to create notebook file."
    exit 2
fi
}


# Main function to handle file creation logic

    #echo "Number of arguments: $#"
    #echo "Arguments: $@"

    if [ "$#" -eq 1 ]; then
        # Single argument passed
        file_path="$1"
        echo "Single argument detected:" #$file_path"

        if [[ "$file_path" == *.ipynb ]]; then
            # Create the Python file with the template
            create_notebook "$file_path" "$(basename "$file_path" .ipynb)"
        else
            echo "Error: Single argument must have a .ipynb extension."
            exit 1
        fi

    elif [ "$#" -eq 2 ]; then
        # Two arguments passed (directory and file name)
        dir_name="$1"
        file_name="$2"
        echo "Directory: $dir_name"
        echo "File name: $file_name"

        # Ensure file_name has .py extension
        if [[ "$file_name" != *.ipynb ]]; then
            file_name="${file_name}.ipynb"
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
        create_notebook "$file_path" "$file_name"
    else
        echo "Usage: $0 <file_path_with_py_extension> or $0 <directory_name> <file_name_without_extension>"
        #exit 1
    fi


