FROM python:3.10-alpine

# ENV PYTHONDONTWRITEBYTECODE 1
# ENV PYTHONUNBUFFERED 1

# RUN mkdir /code
# WORKDIR /code
# RUN pip install --upgrade pip
# COPY requirements.txt /code/

# RUN pip install -r requirements.txt
# COPY . /code/
ENV PYTHONUNBUFFERED 1
ENV PYTHONDONTWRITEBYTECODE 1
ENV PIP_DISABLE_PIP_VERSION_CHECK=on

RUN pip install poetry

WORKDIR /code

COPY poetry.lock pyproject.toml /code/
RUN poetry install --no-interaction

COPY . ./code

EXPOSE 8000

# CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
CMD ["poetry", "run", "python", "manage.py", "runserver", "0.0.0.0:8000"]
