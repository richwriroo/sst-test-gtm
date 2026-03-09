# Use the official lightweight Python image.
# For Cloud Run, a slim image is recommended for smaller size and better security.
FROM python:3.12-slim

# Expose the port Cloud Run will use. Cloud Run provides the PORT as an environment variable.
EXPOSE 8080

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file and install dependencies to leverage Docker cache layers.
COPY requirements.txt ./
RUN pip install -r requirements.txt --no-cache-dir

# Copy the rest of the application code to the container
COPY . .

# Command to run the application, listening on 0.0.0.0 and using the PORT env variable.
# Use gunicorn or another production-ready server for web apps.
# Replace 'main:app' with your application's entry point (e.g., 'your_app_file:your_flask_app_instance')
CMD ["gunicorn", "--bind", "0.0.0.0:8080", "main:app"]
