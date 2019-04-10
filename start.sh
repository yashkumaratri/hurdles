#! /bin/bash
nohup python3 src/models/predict_classifier_api.py  &
nohup python3 main.py &
