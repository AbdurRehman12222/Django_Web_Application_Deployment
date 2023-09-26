# Use an official Python 2 runtime as a parent image
FROM python:2

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Create and set the working directory in the container
WORKDIR /app

# Copy the Django project files into the container
COPY .  .


# Install Django and project dependencies
RUN pip install "django>=1.11,<1.12"
RUN pip install -r requirements.txt  # Install requirements from the parent directory

# Install npm and bower (npm is already available in the Python 2 image)
RUN apt-get update && apt-get install -y npm
RUN npm install -g bower

# Change directory to the Django project folder
WORKDIR /app/django-hackathon-starter/hackathon_starter
COPY bower.json .bowerrc /app/django-hackathon-starter/hackathon_starter/

# Run bower install to install JavaScript dependencies
RUN bower install --allow-root
# Run Django migrations
COPY . /app/django-hackathon-starter/

RUN python manage.py makemigrations
RUN python manage.py migrate

# Expose the port that the Django application will run on
EXPOSE 8084

# Start the Django development server
CMD ["python", "manage.py", "runserver", "0.0.0.0:8084"]
