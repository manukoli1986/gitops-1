# Use an official Python runtime as the base image
FROM python:3.9-slim

# Set the working directory in the container to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
ADD . /app

# Install Flask
RUN pip install flask

# Define the code that you want to run
RUN echo 'from flask import Flask, jsonify\nimport socket\nimport datetime\n\napp = Flask(__name__)\n\n@app.route("/")\ndef hello():\n    return jsonify({\n        "message": "Hello, World!",\n        "current_time": str(datetime.datetime.now()),\n        "hostname": socket.gethostname()\n    })\n\nif __name__ == "__main__":\n    app.run(debug=True, host="0.0.0.0")' > app.py

# Make port 80 available to the world outside this container
EXPOSE 80

# Run app.py when the container launches
CMD ["python", "app.py"]
