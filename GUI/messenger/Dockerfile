FROM ubuntu:18.04
MAINTAINER geekgit
RUN apt-get update && apt-get upgrade -y && apt-get install -y software-properties-common
RUN apt-get install -y build-essential sudo unzip wget curl git mesa-utils fonts-takao-mincho fonts-takao-gothic fonts-takao fonts-arphic-ukai fonts-arphic-uming fonts-ipafont-mincho fonts-ipafont-gothic fonts-unfonts-core
RUN apt-get install -y desktop-file-utils
RUN apt-get install -y fontconfig fontconfig-config libfontconfig1
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
ENV FONTCONFIG_PATH=/etc/fonts
RUN geekgit-install-messenger
ENTRYPOINT ["/bin/bash"]
