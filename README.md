# Django Docker Template 
A template to quickly start developing with Django and Docker.

## Getting Started
Run the following commands to get started
```bash
# Install the project using poetry
pip install poetry
poetry install

# Then set up a new django project in the source folder
django-admin startproject my_django_project .

# Create a database with
python manage.py migrate

# Now run locally
python manage.py runserver
```

Using the Dockerfile requires you to open `Dockerfile` and 
edit `DJANGO_PROJECT_DIR` to point to your django project. Then
build and run the Dockerfile

```
docker build -t django-docker .
docker run -p 8000:8000 --name django django-docker
```

## Setup

This repository uses the [poetry](https://python-poetry.org/)
package manager. It also uses [pre-commit](https://pre-commit.com/) 
to install git-hooks. 
Pre-commit installs [black](https://github.com/psf/black),
[flake8](https://flake8.pycqa.org/en/latest/)
and [isort](https://pycqa.github.io/isort/) to check you code on 
every commit and automatically keep it clean. Install and run pre-commit 
using 

```commandline
pre-commit install
pre-commit run --all-files
```
