FROM python
WORKDIR /home/myapp
COPY requirements.txt .
RUN apt-get update && apt-get upgrade -y && rm -rf /var/lib/apt/lists/*
RUN pip install -r requirements.txt 
COPY . .
EXPOSE 5050
CMD ["python3", "sample_app.py"]