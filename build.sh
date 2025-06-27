#!/bin/bash
set -e  # Exit immediately if any command fails

# 1. CRITICAL: Ensure core build tools are up-to-date first
python -m pip install --upgrade pip==23.3.1 setuptools==68.2.2 wheel==0.41.3

# 2. Install problematic packages first with explicit versions
pip install \
    pandas==2.0.3 \
    numpy==1.24.3 \
    tensorflow==2.13.0 \
    --no-cache-dir

# 3. Install remaining requirements
pip install -r requirements.txt --no-cache-dir

# 4. Verify critical installations
python -c "import pandas; print(f'Pandas {pandas.__version__} installed')"
python -c "import setuptools; print(f'Setuptools {setuptools.__version__} installed')"

# 5. Start the application
exec gunicorn app:app