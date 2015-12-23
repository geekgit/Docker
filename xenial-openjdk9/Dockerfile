# 23 dec 2015
FROM ubuntu:16.04
MAINTAINER geekgit
ADD custom-resolv.conf /etc/resolv.conf
WORKDIR /etc
RUN ls -l resolv.conf && cat resolv.conf
ADD custom-sources.list /etc/apt/sources.list
WORKDIR /etc/apt
RUN ls -l sources.list && cat sources.list
WORKDIR /
RUN dpkg --add-architecture i386
RUN apt-get update -y 2>/root/update-error.txt; exit 0
RUN cat /root/update-error.txt
RUN apt-get upgrade -y && apt-get install -y software-properties-common
RUN apt-get install -y wget
WORKDIR /root
RUN wget http://archive.ubuntu.com/ubuntu/pool/main/l/llvm-toolchain-3.6/libllvm3.6v5_3.6.2-1_amd64.deb
RUN dpkg -i libllvm3.6v5_3.6.2-1_amd64.deb; exit 0
RUN apt-get install -fy
RUN apt-get install -y openjdk-9-jdk openjdk-9-jdk
RUN adduser --disabled-password --gecos '' user
USER user
WORKDIR /home/user
ENTRYPOINT ["/bin/bash"]
