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

# give user access to system folders
RUN USER=$(whoami)
RUN echo $USER
RUN sudo chown -R $USER /usr/bin
RUN sudo chown -R $USER /usr/lib/node_modules

# npm global instalations
RUN npm i -g nodemon standard

# list npm globals
RUN npm list -g --depth 0

# software versions
RUN node -v
RUN npm -v
RUN yarn -v
RUN python --version
RUN python3 --version
RUN gcc --version
RUN g++ --version

# check OS info
RUN cat /etc/os-release
