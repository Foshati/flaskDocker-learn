# Use an official Python runtime as a parent image
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install any needed packages specified in requirements.txt (--no-cache-dir)
RUN pip install --no-cache-dir -r requirements.txt

# Make port 5000 available to the world outside this container
EXPOSE 5000

# Define environment variable
ENV Flask_APP=app/main.py

# Run the Flask application when the container launches
CMD ["gunicorn", "--bind", "0.0.0.0:5000", "app:app"]
