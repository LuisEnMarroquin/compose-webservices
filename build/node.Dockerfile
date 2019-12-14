FROM node:lts-alpine

# Tell which port expose
EXPOSE 3000

# Set working directory
WORKDIR /opt/app

# Copy only this for cache
COPY node/package.json node/package-lock.json ./

# Install dependencies
RUN npm install --production --no-optional --ignore-scripts --no-shrinkwrap

# Copy everything else
COPY node/. ./

# Start app
CMD [ "node", "./server.js" ]
