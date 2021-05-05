FROM python:3.8-slim-buster

COPY requirements.txt /requirements.txt
RUN apt-get update -qq && \
    apt-get install -q -y --no-install-recommends gettext && \
    pip install --upgrade pip && \
    pip install -r requirements.txt
RUN groupadd -r python && \
    useradd -r -g python python && \
    mkdir -p /home/python && \
    chown -R python:python /home/python
USER python
WORKDIR /home/python
