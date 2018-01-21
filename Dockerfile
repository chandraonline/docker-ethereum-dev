FROM ubuntu:xenial
LABEL version="1.0" maintainer="Chandra Siva <email@chandraonline.net>"
MAINTAINER chandraonline

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get upgrade -q -y
RUN apt-get dist-upgrade -q -y

# Install base dev stuff

RUN apt-get install -y build-essential
RUN apt-get install -y apt-utils
RUN apt-get install -y sudo
RUN apt-get install -y figlet
RUN apt-get install -y strace
RUN apt-get install -y curl
RUN apt-get install -y git
RUN apt-get install -y tmux
RUN apt-get install -y unzip

# Editors and support for solidity
RUN apt-get install -y vim
WORKDIR /root
RUN curl -o vim-solidity-master.zip https://codeload.github.com/tomlion/vim-solidity/zip/master
RUN unzip vim-solidity-master.zip
RUN rsync -a vim-solidity-master/ .vim/
RUN rm -rf vim-solidity-master
RUN rm -rf vim-solidity-master.zip

# Install node and other essentials

RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -
RUN apt-get install -y nodejs

# Install Truffle and Solidity Compiler

RUN npm install -g truffle
RUN npm install -g solc

# Install Yarn

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install yarn
