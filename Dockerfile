FROM python:3.8-slim-buster

COPY requirements.txt /requirements.txt
RUN apt-get update -qq && \
    apt-get install -q -y --no-install-recommends gettext libpq-dev gcc && \
    pip install --upgrade pip && \
    pip install -r requirements.txt && \
    apt-get --purge remove gcc && rm -rf /var/lib/apt/lists/*
RUN groupadd -r python && \
    useradd -r -g python python && \
    mkdir -p /home/python && \
    chown -R python:python /home/python
USER python
WORKDIR /home/python
