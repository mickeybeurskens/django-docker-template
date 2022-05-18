FROM python:3.8 as python-django

ENV DJANGO_PROJECT_DIR='my_django_project'

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
EXPOSE 8000
WORKDIR /app/my_django_project
CMD python manage.py makemigrations && \
    python manage.py migrate && \
    python manage.py runserver