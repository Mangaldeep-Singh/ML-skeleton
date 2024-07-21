# Machine Learning Project

## Contents of this file

- Introduction
- Project Structure
- Requirements
- Installation
- Best practices

## Introduction

This project follows a software engineering approach to create a machine learning project skeleton structure, focusing on modularity, maintainability, and scalability. Unlike traditional notebook-based approaches, this structure organizes the code and data in a way that supports effective development and collaboration.

## Project Structure

The project is organized as follows:

```
project-name/		   	        # Root directory
├── data/			   	        # Directory to store data files
│   ├── raw/                 	# Raw data
│   ├── processed/           	# Processed data
│   ├── external/            	# External data
│
├── notebooks/               	# Directory to store Jupyter notebooks
├── src/			   	            # Directory to store source code
│   ├── data/                	# Data loading and preprocessing
|      |── load_data.py
|      |── preprocess.py
│   ├── features/            	# Feature engineering
|      |── build_features.py
│   ├── models/              	# Model training and evaluation
|      |── train_model.py
|      |── evaluate_model.py
│   ├── visualization/       	# Visualizations
|      |── visualize.py
│   ├── utils/               	# Utility functions/ helper functions
|      |── helper_functins.py
│
├── tests/			# Directory to store test scripts
│
├── README.md			# Readme file to describe project
├── .gitignore			# Git ignore file to exclude unnecessary files
├── main.py			# main script to run the project
└── requirements.txt		# file list to store project dependencies
```

## Why this approach 
```
Noraml approach of jump-starting an ML project on a Jupyter causes :
❌ It discourages code reusability.
❌ It is difficult to do version control properly.
❌ Variables are cached globally, leading to data leakage.
```

## Project Setup

## Requirements

- Termainal

- If using on Windows, install Gitbash

## Installation

Clone the repository and install the necessary dependencies:

```bash
git clone https://github.com/Mangaldeep-Singh/ML-skeleton.git
cd ML-skeleton
```

## Usage

Run the main script to start the project:

```bash
bash skeleton.sh

or

. skeleton.sh
```
## Best Practices

- **Code Quality:** Follow coding standards and use linters.
- **Version Control:** Regularly commit and push changes to the repository.
- **Modularity:** Keep code modular to enhance readability and maintainability.
- **Documentation:** Maintain comprehensive documentation for ease of understanding and collaboration.

By following this structured approach, the project ensures efficient development, maintainability, and scalability, making it easier to manage and collaborate on machine learning tasks.
