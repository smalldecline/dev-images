FROM devenv:base

ADD node-v16.14.2-linux-x64.tar.xz /usr/local
ENV PATH=$PATH:/usr/local/node-v16.14.2-linux-x64/bin

RUN npm config set registry https://registry.npm.taobao.org
RUN npm install -g yarn
RUN yarn config set registry https://registry.npm.taobao.org/
RUN yarn global add typescript