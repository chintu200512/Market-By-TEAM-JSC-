
#!/bin/bash
set -e  # Exit on error

# Upgrade pip/setuptools first
python -m pip install --upgrade pip setuptools wheel

# Install requirements (no cache)
pip install -r requirements.txt --no-cache-dir

# Start the app
gunicorn app:app#!/bin/bash
# Force clean installs
python -m pip install --upgrade pip setuptools wheel
pip install pandas==2.0.3 numpy==1.24.3 --no-cache-dir
pip install -r requirements.txt --no-cache-dir
gunicorn app:app