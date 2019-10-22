FROM node:lts-alpine

# Tell which port expose (this does nothing)
EXPOSE 3000

# Set working directory
WORKDIR /opt/app

# Copy only this for cache
COPY package.json package-lock.json ./

# Install dependencies
RUN npm install --production --no-optional --ignore-scripts --no-shrinkwrap

# Copy everything else
COPY . ./

# Start app
CMD [ "node", "./bin/www.js" ]
