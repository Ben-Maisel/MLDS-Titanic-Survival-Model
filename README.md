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
│  ├─ data/
│  │  └─ .gitkeep
│  │
│  ├─ R_version/
│  │  ├─ .Dockerignore
│  │  ├─ Dockerfile
│  │  ├─ install.R
│  │  └─ main.rmd
│  │
│  └─ python_version/
│     ├─ Dockerfile
│     ├─ main.ipynb
│     └─ requirements.txt
│
├─ .gitignore
├─ CODEOWNERS
└─ README.md


2. Download the Data:

visit this link (https://www.kaggle.com/competitions/titanic/Data) and download the data. You will need to make a kaggle account if you do not have one. To find the data, scroll down the page, there will be a button that says "Download All" on the right side of the page. Click this button and the data will download as a .zip file on your machine. Extract the data from the .zip file for a tutorial on how to do this, follow this guide (https://www.wikihow.com/Unzip-a-File). There will be 3 files titled "train.csv", "test.csv", "gender_submission.csv" move these 3 files into the src/data folder. 

**IT IS VERY IMPORTANT THAT YOU DO NOT RENAME ANY OF THE FILES OR FOLDERS IN THE PROJECT DIRECTORY. THE BUILD AND RUN PROCESSES WILL NOT WORK IF EVERYTHING IS NOT NAMED EXACTLY.** 

If you did this correctly, you will have a file structure that looks like this:

MLDS-Titanic-Survival-Model/
├─ src/
│  ├─ data/
│  │  ├─ train.csv
│  │  ├─ test.csv
│  │  ├─ gender_submission.csv
│  │  └─ .gitkeep
│  │
│  ├─ R_version/
│  │  ├─ .Dockerignore
│  │  ├─ Dockerfile
│  │  ├─ install.R
│  │  └─ main.rmd
│  │
│  └─ python_version/
│     ├─ Dockerfile
│     ├─ main.ipynb
│     └─ requirements.txt
│
├─ .gitignore
├─ CODEOWNERS
└─ README.md


3. Build the Docker Image

You must start by building the Docker Image. Make sure that your working directory is the project root. If you are unsure, you can tell by making sure your terminal line heading looks something like this: 

  /.../MLDS-Titanic-Survival-Model>

Choose which language you would like to run the model (R or Python). The model is identical in both languages, however both are included here. The build command may take a few minutes to run the first time for each version, this is normal.

3.1 R version

if you wish to run the R version of the model, paste the following command:

  docker build --build-arg SNAPSHOT_DATE=2025-10-01 -t titanic-rmd -f ./src/R_version/Dockerfile .

3.2 Python version

if you wish to run the Python version of the model, paste the following command:

  docker build -t titanic-notebook -f ./src/python_version/Dockerfile .


4. Run the Docker Container

Now that the image is built, you must give the command to actually run the container and get the output. **MAKE SURE YOU RUN THE COMMAND THAT CORRESPONDS TO YOUR BUILD VERSION.**

4.1 R version

paste this command:

  mkdir -p output_folder
  docker run --rm \
    -v "$PWD/src/data:/app/data" \
    -v "$PWD/output_folder:/app/output_folder" \
    titanic-rmd


4.2 Python version

paste this command:

  mkdir -p output_folder
  docker run --rm \
    -v "$PWD/src/data:/app/data" \
    -v "$PWD/output_folder:/app/output_folder" \
    titanic-notebook


5. Observe Results

Once the container runs, a new folder will be created in the directory root called `output_folder`. Inside this folder will be a file called predictions_python.csv or predictions_R.csv depending on which version you ran. This file contains the predictions for whether or not each passenger in the test set survived.