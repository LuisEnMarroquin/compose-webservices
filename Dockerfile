FROM node:alpine

# Create directory
RUN mkdir -p /opt/app

# Copy Files
COPY . /opt/app

# Set dir as working dir
WORKDIR /opt/app
