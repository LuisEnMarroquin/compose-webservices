FROM python:3-alpine

# Create work directory
# RUN mkdir -p /opt/app/

# Set work directory
WORKDIR /opt/app/

# Set env variables
ENV FLASK_APP app.py
ENV FLASK_RUN_HOST 0.0.0.0

# Add alpine dependencies
RUN apk add --no-cache gcc musl-dev linux-headers

# Copy only dependencies file for cache
COPY python/requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy Files
COPY python/. .

# Run app
CMD ["flask", "run"]
# RUN python ./index.py

# Keep container running
# CMD tail -f /dev/null
