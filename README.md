# Django Docker Template 
:fire: A template to quickly start developing with Django and Docker :fire:

## Getting Started :zap:
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

Use the Dockerfile by running

```
docker build -t django-docker .
docker run -p 8000:8000 --name django-project django-docker
```

Then visit your website at `localhost:8000` in your browser. Happy Devving :fireworks:!

## Setup

This repository uses the [poetry](https://python-poetry.org/)
package manager. It also uses [pre-commit](https://pre-commit.com/) 
to install git-hooks. 
Pre-commit installs [black](https://github.com/psf/black),
[flake8](https://flake8.pycqa.org/en/latest/)
and [isort](https://pycqa.github.io/isort/) to check your code on 
every commit and automatically keep it clean. Install and run pre-commit 
using 

```commandline
pre-commit install
pre-commit run --all-files
```
