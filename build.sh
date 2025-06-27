#!/usr/bin/env bash
set -e

python -m pip install --upgrade pip setuptools wheel
python -m pip install -r requirements.txt --no-cache-dir

# ✅ Step 3: Optional validation
python - <<'PYCODE'
import pandas, numpy, tensorflow
print("Pandas:", pandas.__version__, "Numpy:", numpy.__version__, "TensorFlow:", tensorflow.__version__)
PYCODE

# 🚀 Step 4: Run your app
exec gunicorn app:app
