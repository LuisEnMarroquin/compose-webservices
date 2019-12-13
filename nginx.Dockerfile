FROM nginx:latest

# Set working directory
WORKDIR /etc/nginx/conf.d

# Copy settings
COPY default.conf ./
