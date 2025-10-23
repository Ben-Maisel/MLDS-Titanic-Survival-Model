# MLDS-Titanic-Survival-Model
An easy to run model that predicts the survival rate of each titanic passenger (REQUIRES DOCKER)


TO RUN:

POWERSHELL:
from the repo root
1. docker build -t titanic-notebook -f .\src\python_version\Dockerfile .

2. mkdir -Force .\output_folder; docker run --rm `
  -v ${PWD}\src\data:/app/data `
  -v ${PWD}\output_folder:/app/output_folder `
  titanic-notebook

MAC OS / LINUX:
from the repo root
1. docker build -t titanic-notebook -f ./src/python_version/Dockerfile .

2. mkdir -p output_folder && docker run --rm \
  -v "$(pwd)/src/data:/app/data" \
  -v "$(pwd)/output_folder:/app/output_folder" \
  titanic-notebook


