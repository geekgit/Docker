FROM ubuntu:22.04
MAINTAINER geekgit
RUN apt-get update && apt-get upgrade -y && apt-get install -y software-properties-common
RUN apt-get install -y autoconf automake bison build-essential flex gcc git gnupg libpng-dev make pkg-config python3 python3-pip sudo unzip wget yasm
RUN pip3 install pypng
# user
RUN adduser --disabled-password --gecos '' build
USER build
WORKDIR /home/build
RUN git clone https://github.com/geekgit/rgbds
WORKDIR /home/build/rgbds
RUN git submodule init
RUN git submodule update
USER root
RUN make install
USER build
WORKDIR /home/build
ENTRYPOINT ["/bin/bash"]
