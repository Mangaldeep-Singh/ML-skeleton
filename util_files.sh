#!/bin/bash

create_gitignore() {
    local base_path="$1"
    local gitignore_file="${base_path}/.gitignore"
    local requirement_file="${base_path}/requirements.txt"
    touch "$gitignore_file"
    touch "$requirement_file"
    # Populate .gitignore with the template
    echo '# .gitignore for a Machine Learning project

# Byte-compiled / optimized / DLL files
__pycache__/
*.py[cod]
*$py.class

# Distribution / packaging
.Python
build/
develop-eggs/
dist/
downloads/
eggs/
.eggs/
lib/
lib64/
parts/
sdist/
var/
wheels/
*.egg-info/
.installed.cfg
*.egg

# PyInstaller
#  Usually these files are written by a python script from a template
#  before PyInstaller builds the exe, so as to inject date/other infos into it.
*.manifest
*.spec

# Installer logs
pip-log.txt
pip-delete-this-directory.txt

# Unit test / coverage reports
htmlcov/
.tox/
.nox/
.coverage
.coverage.*
.cache
nosetests.xml
coverage.xml
*.cover
.hypothesis/
.pytest_cache/

# Translations
*.mo
*.pot

# Django stuff:
*.log
local_settings.py
db.sqlite3
db.sqlite3-journal

# Flask stuff:
instance/
.webassets-cache

# Scrapy stuff:
.scrapy

# Sphinx documentation
docs/_build/

# PyBuilder
target/

# Jupyter Notebook
.ipynb_checkpoints

# IPython
profile_default/
ipython_config.py

# pyenv
#   For a library or package, you might want to ignore these files since the code is
#   intended to run in multiple environments; otherwise, check them in:
# .python-version

# pipenv
#   According to pypa/pipenv#598, it is recommended to include Pipfile.lock in version control.
#   However, in case of collaboration, if having platform-specific dependencies or
#   using the specific pipenv --python <version> option, it may be better to ignore it.
# Pipfile.lock

# PEP 582; used by e.g. github.com/David-OConnor/pyflow
__pypackages__/

# Celery stuff
celerybeat-schedule
celerybeat.pid

# SageMath parsed files
*.sage.py

# Environments
.env
.venv
env/
venv/
ENV/
env.bak/
venv.bak/

# Spyder project settings
.spyderproject
.spyderworkspace

# Rope project settings
.ropeproject

# mkdocs documentation
/site

# mypy
.mypy_cache/
.dmypy.json
dmypy.json

# Pyre type checker
.pyre/

# Pyright type checker
.pyright/

# pytype static type analyzer
.pytype/

# Cython debug symbols
cython_debug/

# Data files
*.csv
*.h5
*.hdf5
*.npy
*.npz
*.parquet
*.xls
*.xlsx

# Model files
*.joblib
*.model
*.pkl
*.pickle
*.pb

# TensorFlow / Keras
checkpoint
saved_model/
*.pbtxt
*.tflite
*.lite
*.tfl
*.keras

# Weights and biases
wandb/
wandb-media/
*.h5

# Config files
config/
*.yaml
*.yml

# Logs
logs/
*.log
' > "$gitignore_file"

    # Check if the file was created successfully
    if [ $? -eq 0 ]; then
        echo ".gitignore file created at: $gitignore_file"
    else
        echo "Failed to create .gitignore file."
        exit 1
    fi
}

# Main script logic
main() {
    local base_dir="$1"
    if [ -z "$base_dir" ]; then
        base_dir="."
    fi
    file=$( echo ${base_dir##*/} )   
    path=$( echo ${base_dir%/*} )

    create_gitignore "$path"
}

# Run the main function
main "$@"

