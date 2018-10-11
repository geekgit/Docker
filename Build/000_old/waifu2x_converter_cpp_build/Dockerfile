FROM ubuntu:16.04
MAINTAINER geekgit
RUN apt-get update && apt-get upgrade -y && apt-get install -y software-properties-common
RUN apt-get install -y autoconf automake bison build-essential flex gcc git gnupg libpng12-dev make pkg-config python python-setuptools sudo unzip wget yasm
RUN apt-get install -y cmake 
# user
RUN adduser --disabled-password --gecos '' build
USER build
WORKDIR /home/build
RUN git clone https://github.com/khws4v1/waifu2x-converter-cpp
WORKDIR /home/build/waifu2x-converter-cpp
RUN ./build.sh
ENTRYPOINT ["/bin/bash"]
