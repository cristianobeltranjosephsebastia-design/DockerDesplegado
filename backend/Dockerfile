FROM python
WORKDIR /home/myapp
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
RUN apt-get update && apt-get upgrade -y && rm -rf /var/lib/apt/lists/*
RUN pip install --upgrade --no-cache-dir pip setuptools
RUN pip install -r requirements.txt 
COPY . .
EXPOSE 5050
CMD ["python3", "sample_app.py"]