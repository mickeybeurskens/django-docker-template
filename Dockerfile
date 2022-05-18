FROM python:3.8 as python-django

# Create non-sudo user
RUN useradd -ms /bin/bash worker
ENV PATH="/home/worker/.local/bin:${PATH}"
COPY /pyproject.toml /app/
RUN chown -R worker /app
USER worker

# Install poetry
RUN pip install poetry
RUN poetry config virtualenvs.create false

# Install crowdcent-api dependencies
WORKDIR /app
RUN poetry install
COPY / /app

# Run
WORKDIR /app
RUN python manage.py makemigrations
RUN python manage.py migrate
EXPOSE 8000
CMD python manage.py runserver 0.0.0.0:8000