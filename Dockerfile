# Use an official Python runtime as a parent image
FROM python:2.7-slim

ARG PORT
ENV PORT ${PORT:-8080}

# Define environment variable
ARG NAME
ENV NAME ${NAME:-World}

# Set the working directory to /app
WORKDIR /app

ADD install-reqs.sh requirements.txt /app/

# Install any needed packages specified in requirements.txt
# RUN pip install --trusted-host pypi.python.org -r requirements.txt
RUN bash -c "/app/install-reqs.sh"

# Make port available to the world outside this container
EXPOSE ${PORT}

# Run app.py when the container launches
CMD ["python", "app.py"]

# Copy the current directory contents into the container at /app
ADD . /app
