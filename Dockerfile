FROM python:3

# Create work directory
RUN mkdir -p /opt/app/

# Set work directory
WORKDIR /opt/app/

# Copy only dependencies file for cache
# COPY dependencies.txt /opt/app/

# Install dependencies
# RUN pip install --no-cache-dir -r dependencies.txt

# Copy Files
# COPY . /opt/app/

# Keep container running
CMD tail -f /dev/null

# Run app
# CMD [ "python", "./index.py" ]
