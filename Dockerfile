FROM python:3.11-alpine

RUN apk update && apk upgrade --no-cache libcrypto3 libssl3

WORKDIR /app

RUN pip install --no-cache-dir --upgrade pip setuptools

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

CMD ["python", "sample_app.py"]