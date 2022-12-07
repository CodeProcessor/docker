FROM python:3.9-slim-buster

# Create virtual environment
RUN python3 -m venv /opt/venv
ENV PATH="/opt/venv/bin:${PATH}"

COPY requirements.txt /tmp
RUN pip3 install -r /tmp/requirements.txt

COPY app /app
WORKDIR /app

ENV PYTHONPATH=/app

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "5000"]
