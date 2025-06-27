#!/usr/bin/env bash

# 1. Upgrade pip, setuptools, wheel
python -m pip install --upgrade pip setuptools wheel

# 2. Install from requirements
pip install -r requirements.txt --no-cache-dir

# 3. Verify imports
python -c "import pandas, numpy, tensorflow; print('Critical imports successful')"

# 4. Run gunicorn
exec gunicorn app:app
