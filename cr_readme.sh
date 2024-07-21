#!/bin/bash

# Function to create a README file with template content
create_readme_with_template() {
    local readme_file="$1"

    # Populate README.md with the template
    {
        echo '# Machine Learning Project'
        echo ''
        echo '## Contents of this file'
        echo ''
        echo '- Introduction'
        echo '- Project Structure'
        echo '- Requirements'
        echo '- Installation'
        echo '- Data'
        echo '- Usage'
        echo '- Configuration'
        echo '- Training'
        echo '- Evaluation'
        echo '- Results'
        echo '- Troubleshooting'
        echo '- References'
        echo '- Maintainers'
        echo ''
        echo '## Introduction'
        echo ''
        echo 'This project aims to... [Add project goals and brief overview]'
        echo ''
        echo '## Project Structure'
        echo ''
        echo '```'
        echo 'project-name/		   	# Root directory'
        echo '├── data/			   	# Directory to store data files'
        echo '│   ├── raw/                 	# Raw data'
        echo '│   ├── processed/           	# Processed data'
        echo '│   ├── external/            	# External data'
        echo '│'
        echo '├── notebooks/               	# Directory to store Jupyter notebooks'
        echo '├── src/			   	# Directory to store source code'
        echo '│   ├── data/                	# Data loading and preprocessing'
        echo '|      |── load_data.py'
        echo '|      |── preprocess.py'
        echo '│   ├── features/            	# Feature engineering'
        echo '|      |── build_features.py'
        echo '│   ├── models/              	# Model training and evaluation'
        echo '|      |── train_model.py'
        echo '|      |── evaluate_model.py'
        echo '│   ├── visualization/       	# Visualizations'
        echo '|      |── visualize.py'
        echo '│   ├── utils/               	# Utility functions/ helper functions'
        echo '|      |── helper_functins.py'
        echo '│'
        echo '├── tests/			# Directory to store test scripts'
        echo '│'
        echo '├── README.md			# Readme file to describe project'
        echo '├── .gitignore			# Git ignore file to exclude unnecessary files'
        echo '├── main.py			# main script to run the project'
        echo '└── requirements.txt		# file list to store project dependencies'
        echo '```'
        echo ''
        echo '## Requirements'
        echo ''
        echo 'To install all the required packages, run:'
        echo ''
        echo '```bash'
        echo 'pip install -r requirements.txt'
        echo '```'
        echo ''
        echo '**Note**: Ensure you have Python 3.7 or higher installed.'
        echo ''
        echo '## Installation'
        echo ''
        echo 'Clone the repository and install the necessary dependencies:'
        echo ''
        echo '```bash'
        echo 'git clone https://github.com/yourusername/your-repo-name.git'
        echo 'cd your-repo-name'
        echo 'pip install -r requirements.txt'
        echo '```'
        echo ''
        echo '### Set Gin as default admin theme'
        echo ''
        echo 'Instructions to set up Gin as the default admin theme.'
        echo ''
        echo '## Data'
        echo ''
        echo '1. Place raw data files in the `data/raw` directory.'
        echo '2. Use the scripts in `src/data` for data loading and preprocessing.'
        echo ''
        echo '## Usage'
        echo ''
        echo 'Run the main script to start the project:'
        echo ''
        echo '```bash'
        echo 'python src/main.py'
        echo '```'
        echo ''
        echo '## Configuration'
        echo ''
        echo 'Configuration settings can be found and modified in the `config.yaml` file.'
        echo ''
        echo '## Training'
        echo ''
        echo 'To train the model, run:'
        echo ''
        echo '```bash'
        echo 'python src/models/train_model.py'
        echo '```'
        echo ''
        echo '## Evaluation'
        echo ''
        echo 'To evaluate the model, run:'
        echo ''
        echo '```bash'
        echo 'python src/models/evaluate_model.py'
        echo '```'
        echo ''
        echo '## Results'
        echo ''
        echo 'Results will be saved in the `results` directory. Add details about how results are presented, e.g., metrics, plots, etc.'
        echo ''
        echo '## Troubleshooting'
        echo ''
        echo 'Common issues and their solutions:'
        echo ''
        echo '- Issue: Description of the issue'
        echo '  ```'
        echo '  Solution: Steps to resolve the issue'
        echo '  ```'
        echo ''
        echo '## References'
        echo ''
        echo 'List of references and resources used in the project.'
        echo ''
        echo '## Maintainers'
        echo ''
        echo 'Current maintainers:'
        echo ''
        echo '- Mangaldeep Singh ([@Mangaldeep-Singh](https://github.com/Mangaldeep-Singh))'
    } > "$readme_file"

    # Check if the file was created successfully
    if [ $? -eq 0 ]; then
        echo "README file created at: $readme_file"
    else
        echo "Failed to create README file."
        return 1
    fi
}

# Main function to handle README file creation logic
create_readme() {
    # Check if the required number of parameters is provided
    if [ $# -ne 1 ]; then
        echo "Usage: $0 <directory_name>"
        exit 1
    fi

    local base_path="$1"

    # Create the README.md file
    local readme_file="${base_path}"
    touch "$readme_file"

    # Check if the file was created successfully
    if [ $? -ne 0 ]; then
        echo "Failed to create README file: $readme_file"
        exit 1
    fi

    # Populate README.md with the template
    create_readme_with_template "$readme_file"
}

# Run the function with provided arguments if the script is executed directly
create_readme "$@"

