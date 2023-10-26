# Use an official Python runtime as the base image
FROM python:3.9-slim

# Set the working directory in the container to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
ADD . /app

# Define the code that you want to run
RUN echo 'import socket\nimport datetime\n\nprint("Hello, World!")\nprint("The current time is:", datetime.datetime.now())\nprint("The hostname is:", socket.gethostname())' > app.py

# Make port 80 available to the world outside this container
EXPOSE 80

# Run app.py when the container launches
CMD ["python", "app.py"]
