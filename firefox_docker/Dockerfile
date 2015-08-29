FROM ubuntu:15.04
MAINTAINER geekgit
RUN dpkg --add-architecture i386
RUN apt-get update -y && apt-get upgrade -y && apt-get install -y software-properties-common firefox wget unzip
RUN apt-get purge -y ubufox xul-ext-ubufox 
RUN adduser --disabled-password --gecos '' user
USER user
WORKDIR /home/user
ENTRYPOINT /usr/bin/firefox
