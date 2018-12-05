FROM ubuntu:18.04
MAINTAINER geekgit
RUN apt-get update && apt-get upgrade -y && apt-get install -y software-properties-common
RUN apt-get update
RUN apt-get install -y build-essential unzip wget gnupg git mercurial meld
RUN apt-get install -y autoconf automake build-essential
RUN apt-get install -y sudo
# Under construction
# geekgit linux_scripts_meta install
WORKDIR /root
RUN git clone https://github.com/geekgit/linux_scripts_meta
WORKDIR /root/linux_scripts_meta
RUN ./download-container.sh
WORKDIR /root
RUN adduser --disabled-password --gecos '' build
USER build
WORKDIR /home/build
ENTRYPOINT ["/bin/bash"]
