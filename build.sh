#!/bin/bash
set -e

# Clean Python cache
find . -type d -name "__pycache__" -exec rm -r {} +

# Install dependencies
python -m pip install --upgrade pip
pip install -r requirements.txt --no-cache-dir

# Apply database migrations (if needed)
flask db upgrade

# Start the app
exec gunicorn --bind 0.0.0.0:$PORT --workers 4 app:app