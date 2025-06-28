#!/bin/bash
set -e

# Install system dependencies
export DEBIAN_FRONTEND=noninteractive
apt-get update
apt-get install -y python3-dev libpq-dev

# Install Python packages
python -m pip install --upgrade pip
pip install -r requirements.txt

# Database setup
flask db upgrade || echo "Migrations skipped"

# Start app
exec gunicorn --bind 0.0.0.0:$PORT --workers 4 --timeout 120 app:app