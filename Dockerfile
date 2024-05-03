FROM python:3.10-alpine

ENV PYTHONUNBUFFERED 1
ENV PYTHONDONTWRITEBYTECODE 1
ENV PIP_DISABLE_PIP_VERSION_CHECK=on


COPY . ./code
COPY poetry.lock pyproject.toml /code/
WORKDIR /code
EXPOSE 8000

RUN python -m  venv ./ &&\
    pip install --upgrade pip && \
    pip install poetry && \
    poetry install --no-dev --no-interaction &&\
    poetry update &&\
    apk add --update --no-cache postgresql-client && \
    apk add --update --no-cache --virtual .tmp-deps \
        build-base postgresql-dev musl-dev 
        




