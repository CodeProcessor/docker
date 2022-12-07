# Download the base image
FROM python:3.9-slim-buster
MAINTAINER "dulanjayasuriya@gmail.com"

# Create virtual environment
RUN python3 -m venv /opt/venv
ENV PATH="/opt/venv/bin:${PATH}"

# Installing dependancies
COPY requirements.txt /tmp
RUN pip3 install -r /tmp/requirements.txt

# Copying source code
COPY app /app
WORKDIR /app

# Setting environment variables
ENV PYTHONPATH=/app

# Running the app
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "5000"]
