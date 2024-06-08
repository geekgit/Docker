FROM ubuntu:24.04
MAINTAINER geekgit
RUN apt-get update && apt-get upgrade -y && apt-get install -y software-properties-common
RUN apt-get install -y build-essential ccache cmake git gperf htop libreadline-dev libssl-dev openssl p7zip-full sudo tar unzip wget zlib1g-dev curl
RUN adduser --disabled-password --gecos '' build
USER build
WORKDIR /home/build
RUN git clone https://github.com/tdlib/td
WORKDIR /home/build/td
RUN mkdir build
WORKDIR /home/build/td/build
RUN cmake -DCMAKE_BUILD_TYPE=Release ..
RUN cmake --build . -- -j 4
WORKDIR /home/build
ENTRYPOINT ["/bin/bash"]
