FROM ubuntu:18.04
MAINTAINER geekgit
RUN apt-get update && apt-get upgrade -y && apt-get install -y software-properties-common
RUN apt-get install -y build-essential sudo unzip wget curl git mesa-utils fonts-takao-mincho fonts-takao-gothic fonts-takao fonts-arphic-ukai fonts-arphic-uming fonts-ipafont-mincho fonts-ipafont-gothic fonts-unfonts-core
WORKDIR /root
# geekgit linux_scripts_meta install
WORKDIR /root
RUN git clone https://github.com/geekgit/linux_scripts_meta
WORKDIR /root/linux_scripts_meta
RUN ./download-container.sh
RUN adduser --disabled-password --gecos '' messenger
USER messenger
WORKDIR /home/messenger
ENV USER messenger
RUN geekgit-install-messenger
ENTRYPOINT ["/bin/bash"]
