FROM ubuntu:16.04
MAINTAINER geekgit
RUN apt-get update && apt-get upgrade -y && apt-get install -y software-properties-common
RUN apt-get install -y autoconf automake bison build-essential flex gcc git gnupg libpng12-dev make pkg-config python python-setuptools sudo unzip wget yasm
RUN easy_install pypng
# user
RUN adduser --disabled-password --gecos '' build
USER build
WORKDIR /home/build
ENV rgbds_commit 8f553e8
ENV RedPlusPlus_commit 3b6928a
RUN git clone https://github.com/bentley/rgbds
WORKDIR /home/build/rgbds
RUN git submodule init
RUN git submodule update
USER root
RUN make install
USER build
WORKDIR /home/build
RUN git clone --recursive https://github.com/TheFakeMateo/RedPlusPlus
WORKDIR /home/build/RedPlusPlus
RUN git submodule init
RUN git submodule update
RUN make
WORKDIR /home/build
ENTRYPOINT ["/bin/bash"]
