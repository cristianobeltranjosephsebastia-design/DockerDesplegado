FROM python:3.8-slim-buster

WORKDIR /home/myapp

RUN apt-get update && apt-get upgrade -y && rm -rf /var/lib/apt/lists/*
RUN python -m pip install --upgrade --no-cache-dir pip setuptools

COPY requirements.txt .
RUN python -m pip install --upgrade --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 5050

CMD ["python3", "sample_app.py"]