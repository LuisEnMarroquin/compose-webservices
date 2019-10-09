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

# permissions
RUN sudo chown -R coder /home/coder

# install Yarn
RUN sudo apt-get update && sudo apt-get install yarn -y

# npm global installs
RUN sudo npm i -g nodemon standard yo gulp @microsoft/generator-sharepoint

# list npm globals
RUN sudo npm list -g --depth 0

# software versions
RUN node -v
RUN npm -v
RUN yarn -v
RUN python --version
RUN python3 --version
RUN gcc --version
RUN g++ --version

# watch large workspace VSCode
# RUN cat /proc/sys/fs/inotify/max_user_watches
# RUN sudo echo 'fs.inotify.max_user_watches=524288' >> /etc/sysctl.conf
# RUN sudo sysctl -p
RUN cat /proc/sys/fs/inotify/max_user_watches

# free disk space
RUN df -h

# used space by code-server files
RUN du -sh .

# check OS info
RUN cat /etc/os-release
