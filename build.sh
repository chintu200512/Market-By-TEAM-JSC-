#!/usr/bin/env bash
set -e

# Upgrade pip, setuptools, and wheel FIRST
python -m pip install --upgrade pip setuptools wheel

# Install required packages explicitly before full requirements
pip install pandas==2.0.3 numpy==1.24.3 tensorflow-cpu==2.13.0 protobuf==3.20.3 --no-cache-dir

# Install all remaining dependencies
pip install -r requirements.txt --no-cache-dir

# Final import check
python -c "import pandas, numpy, tensorflow; print('Imports OK')"

# Start server
exec gunicorn app:app
