#!/bin/bash

# Check if at least three parameters are provided
if [ "$#" -lt 3 ]; then
    echo "Usage: $0 <path_to_create> <type_of_directory> <dir1> [<dir2> ... <dirN>]"
    exit 1
fi

# Extract the base path and type of directory
base_path="$1"
dir_type="$2"

# Check if the base path exists
if [ ! -d "$base_path" ]; then
    mkdir -p "$base_path"
fi

# Shift the parameters to process directory names
shift 2

# Create each directory in the specified path
for dir_name in "$@"; do
    full_path="$base_path/$dir_name"
    
    if [ ! -d "$full_path" ]; then
        mkdir "$full_path"
        if [ $? -ne 0 ]; then
            echo "Failed to create directory: $dir_name"
            exit 1
        fi
    fi
    
done

# Print the base path if it's a master directory
if [ "$dir_type" == "master" ]; then
    echo "$full_path"
fi

