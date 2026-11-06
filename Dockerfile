# To write a Dockerfile we first start like this FROM baseImage --> see it as from something get this do this 
# We use python:3.10-slim because it only uses 122MB instead of 1.13GB, slim has less things then default
FROM python:3.10-slim

# Set the working directory inside the container
# Day 2 We changed the Workdir to only /app
WORKDIR /app

# copy where this Dockerfile is located to the other location which is the workdir
# Copy the project files into the container
COPY . .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Expose port to make the application accessible
EXPOSE 8000

# Define the command to run the app
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]