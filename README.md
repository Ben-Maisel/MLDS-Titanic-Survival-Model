# MLDS-Titanic-Survival-Model

INTRODUCTION:

This repo contains a logistic regression model that predicts whether passengers aboard the Titanic survived or not.

The point of this project is not the model itself, rather to demonstrate my ability to create a workflow that is maintainable, easily shareable, and consistent across machines. I achieve this by using Git for version and environment management (Main, Develop, Test branches), and Docker for consistency across systems.


PREREQUISITES:

In order to run this project, you must first have Docker installed and setup on your machine. I recommend installing Docker Desktop from here (https://www.docker.com/products/docker-desktop/). Run the installer and follow the setup instructions.

You must also have Git installed and setup on your machine. I recommend following this guide (https://github.com/git-guides/install-git)


STEPS TO RUN THIS PROJECT:

1. Clone the Repo:

clone this repo to your local machine. The easiest way to do this is to open your terminal, navigate to the directory you want to download this project and paste the following:

  git clone https://github.com/Ben-Maisel/MLDS-Titanic-Survival-Model.git

once you clone the repo, you will have a file structure on your local machine that looks like this:

MLDS-Titanic-Survival-Model/
├─ src/
│  ├─ R_version/
│  │  ├─ .Dockerignore
│  │  ├─ Dockerfile
│  │  ├─ install.R
│  │  └─ main.rmd
│  └─ python_version/
│     ├─ Dockerfile
│     ├─ main.ipynb
│     └─ requirements.txt
├─ .gitignore
├─ CODEOWNERS
└─ README.md

2. Download the Data:

create a new folder inside of src called data















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




docker build --build-arg SNAPSHOT_DATE=2025-10-01 -t titanic-rmd -f .\src\R_version\Dockerfile .

mkdir -Force .\output_folder
docker run --rm `
  -v ${PWD}\src\data:/app/data `
  -v ${PWD}\output_folder:/app/output_folder `
  titanic-rmd

