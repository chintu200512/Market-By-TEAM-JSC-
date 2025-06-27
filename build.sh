#!/bin/bash
set -e  # Exit immediately if any command fails

# 1. CRITICAL: First ensure Python environment is functional
python -c "import sys; print(f'Python {sys.version}')"

# 2. Install core build tools with explicit versions
python -m pip install --upgrade pip==23.3.1
python -m pip install --force-reinstall setuptools==68.2.2 wheel==0.41.3

# 3. Verify base tools
python -m pip check
python -c "import setuptools; print(f'Setuptools {setuptools.__version__} verified')"

# 4. Install known problematic packages first
pip install \
    pandas==2.0.3 \
    numpy==1.24.3 \
    tensorflow-cpu==2.13.0 \ 
    protobuf==3.20.3 \
    --no-cache-dir

# 5. Install remaining requirements
pip install -r requirements.txt --no-cache-dir

# 6. Final verification
python -c "import pandas, numpy, tensorflow; print('Critical imports successful')"

# 7. Start the application
exec gunicorn app:app