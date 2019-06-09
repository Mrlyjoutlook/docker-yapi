FROM ubuntu:16.04

MAINTAINER Mr. Lian "mr.lyj@outlook.com"

# add user group, user and make user home dir
RUN groupadd --gid 1000 yapi && \
  useradd --uid 1000 --gid yapi --shell /bin/bash --create-home yapi

# set pwd to easy-mock home dir
WORKDIR /home/yapi

# install dependencies
RUN apt-get update && \
  apt-get install --no-install-recommends -y \
  build-essential \
  python \
  wget \
  jq \
  git \
  apt-transport-https \
  ca-certificates

# install nodejs
RUN wget http://cdn.npm.taobao.org/dist/node/v10.16.0/node-v10.16.0-linux-x64.tar.gz && \
  tar -xzvf node-v10.16.0-linux-x64.tar.gz && \
  ln -s /home/yapi/node-v10.16.0-linux-x64/bin/node /usr/local/bin/node && \
  ln -s /home/yapi/node-v10.16.0-linux-x64/bin/npm /usr/local/bin/npm

# download yapi source code
USER yapi

RUN mkdir yapi && \
  wget https://github.com/YMFE/yapi/archive/v1.7.0.tar.gz && \
  tar -xzvf v1.7.0.tar.gz -C yapi --strip-components 1

WORKDIR /home/yapi/yapi

COPY start.sh ./
COPY wait-for-it.sh ./

RUN jq '.db.servername = "mongodb"' config_example.json > tmp.json && \
  mv tmp.json config_example.json

RUN cp ./config_example.json ../config.json

RUN npm install --production --unsafe-perm=true --allow-root --registry https://registry.npm.taobao.org
