FROM debian:7
MAINTAINER geekgit
RUN dpkg --add-architecture i386
RUN apt-get upgrade -y && apt-get update && apt-get install -y software-properties-common
RUN apt-get install -y wget
RUN adduser --disabled-password --gecos '' user
USER user
WORKDIR /home/user
ENTRYPOINT ["/bin/bash"]
