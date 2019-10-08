# image
FROM codercom/code-server

# install curl
RUN sudo apt-get install curl -y

# add Node PPA
RUN curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -

# install Node
RUN sudo apt-get install nodejs -y

# tools to build Node native addons
RUN sudo apt-get install gcc g++ make -y

# add Yarn PPA
RUN curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -

# add Yarn to OS registry
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

# install Yarn
RUN sudo apt-get update && sudo apt-get install yarn -y

# version Node
RUN node -v

# version NPM
RUN npm -v

# version Yarn
RUN yarn -v
