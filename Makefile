.PHONY: install
install:
	poetry install;

.PHONY: migrate
migrate:
	poetry run python manage.py makemigrations
	poetry run python manage.py migrate

.PHONY: install-pre-commit
install-pre-commit:
	poetry run pre-commit uninstall; poetry run pre-commit install

.PHONY: runserver
runserver:
	poetry run python manage.py runserver 0.0.0.0:8000

.PHONY: test
test:
	poetry run pytest

.PHONY: lint
lint:
	poetry run pre-commit run --all-files

.PHONY: update
update: install migrate install-pre-commit;
