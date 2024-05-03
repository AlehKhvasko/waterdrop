FROM python:3.10-alpine

ENV PYTHONUNBUFFERED 1
ENV PYTHONDONTWRITEBYTECODE 1
ENV PIP_DISABLE_PIP_VERSION_CHECK=on

COPY . ./code
WORKDIR /code
EXPOSE 8000

COPY poetry.lock pyproject.toml /code/
RUN python -m venv /py && \
    /py/bin/pip install --upgrade pip && \
    /py/bin/pip install poetry && \
    /py/bin/poetry install

ENV PATH="/py/bin:$PATH"
