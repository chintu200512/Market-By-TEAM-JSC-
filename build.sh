#!/bin/bash
set -e

# Install system dependencies first
sudo apt-get update -qq
sudo apt-get install -y libenchant1c2a python3-dev

# Then install Python packages
pip install --upgrade pip
pip install -r requirements.txt

# Start the app
exec gunicorn --bind 0.0.0.0:$PORT app:app