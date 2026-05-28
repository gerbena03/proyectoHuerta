FROM python:3.9-slim
WORKDIR /app
RUN pip install mysql-connector-python psutil
COPY *.py .
CMD ["python", "main.py"]
