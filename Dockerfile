FROM python:slim-stretch

COPY requirements.txt /requirements.txt
RUN apt-get update -qq && \
    apt-get install -q -y --no-install-recommends gettext && \
    pip install --upgrade pip && \
    pip install -r requirements.txt
USER python
