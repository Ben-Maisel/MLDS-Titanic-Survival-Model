FROM python:3.11-slim

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    PIP_NO_CACHE_DIR=1

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY src/python_version/requirements.txt /app/requirements.txt

RUN python -m pip install --upgrade pip \
 && pip install -r requirements.txt \
 && pip install papermill ipykernel nbclient

COPY src/python_version/main.ipynb /app/main.ipynb

ENV OUTPUT_DIR=/app/output_folder
RUN mkdir -p "$OUTPUT_DIR"

ENV DATA_DIR=/app/data

CMD ["bash","-lc","papermill --log-output --no-progress-bar /app/main.ipynb /app/main.executed.ipynb -p output_dir \"$OUTPUT_DIR\" -p data_dir \"$DATA_DIR\" && ls -l \"$OUTPUT_DIR\""]
