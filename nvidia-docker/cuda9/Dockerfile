FROM nvidia/cuda:9.0-base
MAINTAINER geekgit
RUN apt-get update && apt-get upgrade -y && apt-get install -y software-properties-common
RUN apt-get install -y build-essential unzip wget gnupg git sudo
RUN apt-get install -y mesa-utils
# geekgit linux_scripts_meta install
WORKDIR /root
RUN git clone https://github.com/geekgit/linux_scripts_meta
WORKDIR /root/linux_scripts_meta
RUN ./download-container-xenial.sh
RUN adduser --disabled-password --gecos '' cuda
USER cuda
WORKDIR /home/cuda
ENTRYPOINT ["/bin/bash"]
