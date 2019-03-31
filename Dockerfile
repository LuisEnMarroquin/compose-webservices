FROM node:10.15.1

EXPOSE 3000

RUN npm i npm@latest -g

RUN mkdir /opt/app && chown node:node /opt/app
WORKDIR /opt/app

USER node

COPY package.json package-lock.json* ./

RUN npm install --no-optional && npm cache clean --force

COPY . .

CMD [ "node", "./bin/www" ]