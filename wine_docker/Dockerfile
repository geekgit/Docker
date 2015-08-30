FROM ubuntu:15.04
MAINTAINER geekgit
RUN dpkg --add-architecture i386
RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install -y software-properties-common 
RUN add-apt-repository -y ppa:ubuntu-wine/ppa
RUN apt-get update -y
RUN apt-get install -y wine1.7 winetricks xvfb 
RUN adduser --disabled-password --gecos '' user
USER user
WORKDIR /home/user
ENTRYPOINT ["/usr/bin/wine"]

