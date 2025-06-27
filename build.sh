#!/usr/bin/env bash
# Exit on error
set -o errexit

# Modify this line if needed
pip install -r requirements.txt

# Apply migrations if using Flask-Migrate
flask db upgrade

# Run the application
gunicorn app:app