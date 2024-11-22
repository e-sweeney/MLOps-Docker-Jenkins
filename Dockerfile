FROM jupyter/scipy-notebook

RUN pip install joblib


USER root
Run usermod -aG docker root
RUN apt-get update && apt-get install -y jq
WORKDIR /opt/jp
RUN mkdir model raw_data processed_data results


ENV RAW_DATA_DIR=/opt/jp/raw_data
ENV PROCESSED_DATA_DIR=/opt/jp/processed_data
ENV MODEL_DIR=/opt/jp/model
ENV RESULTS_DIR=/opt/jp/results
ENV RAW_DATA_FILE=heart.csv


COPY heart.csv ./raw_data/heart.csv
COPY preprocessing.py ./preprocessing.py
COPY train.py ./train.py
COPY test.py ./test.py
