FROM python:3.8-slim

# Install system dependencies
RUN apt-get update && apt-get install -y \
    libpq-dev \
    python3-dev \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY . .

# Install Python packages
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# Set environment variables
ENV FLASK_APP=app.py
ENV FLASK_ENV=production

# Run migrations and start app
CMD flask db upgrade && gunicorn --bind 0.0.0.0:$PORT --workers 4 --timeout 120 app:app