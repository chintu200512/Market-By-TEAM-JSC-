#!/bin/bash
set -e # Exit on error

# Install dependencies
python -m pip install --upgrade pip
pip install -r requirements.txt --no-cache-dir

# Start the app
gunicorn --bind 0.0.0.0:$PORT app:app