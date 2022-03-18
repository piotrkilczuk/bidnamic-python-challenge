FROM python:latest

ENV TERM xterm-256color
ENV LANG en_GB.UTF-8
ENV LANGUAGE en_GB:en
ENV LC_ALL en_GB.UTF-8
ENV PYTHONPATH /code/src
ENV PYTHONUNBUFFERED 1
ENV PYTHONDONTWRITEBYTECODE 1

RUN \
    apt-get update --yes && \
    apt-get install --yes --no-install-recommends git groff less locales \
    postgresql-client-13 && \
    echo 'en_GB.UTF-8 UTF-8' > /etc/locale.gen && \
    locale-gen

WORKDIR /code
ADD ./requirements.txt .
RUN pip install -r requirements.txt

RUN useradd --create-home shift
USER shift

CMD gunicorn -w 1 bidnamic.wsgi:application -b 0.0.0.0:8000
