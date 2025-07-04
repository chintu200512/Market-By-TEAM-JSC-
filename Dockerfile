FROM python:3.8.10
WORKDIR /app
COPY . .
RUN pip install -r requirements.txt
CMD gunicorn app:app --bind 0.0.0.0:$PORT