FROM python:3.8-slim-buster

COPY requirements.txt /requirements.txt
RUN apt-get update -q && \
    apt-get install -y --no-install-recommends gettext libpq-dev librdkafka-dev python3-dev gcc curl && \
    pip install --upgrade pip && \
    pip install -r requirements.txt && \
     rm -rf /var/lib/apt/lists/*
RUN groupadd -r python && \
    useradd -r -g python python && \
    mkdir -p /home/python && \
    chown -R python:python /home/python
USER python
WORKDIR /home/python
