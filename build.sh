#!/usr/bin/env bash

# Disable pip build isolation (must be first if needed)
export PIP_NO_BUILD_ISOLATION=1

# 1. Print Python version (for debug)
python -V

# 2. Upgrade pip, setuptools, wheel
python -m pip install --upgrade pip setuptools wheel

# 3. Install requirements
pip install -r requirements.txt --no-cache-dir

# 4. Verify critical imports (optional debug)
python -c "import pandas, numpy, tensorflow; print('Critical imports successful')"

# 5. Start the Flask app using gunicorn
exec gunicorn app:app
