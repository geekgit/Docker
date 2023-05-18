FROM ubuntu:22.04
MAINTAINER geekgit
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get upgrade -y && apt-get install -y software-properties-common
RUN apt-get install -y build-essential unzip wget gnupg git mercurial meld autoconf automake build-essential ninja-build cmake sudo autotools-dev cdbs debhelper dh-autoreconf dpkg-dev gettext libev-dev libpcre3-dev libudns-dev pkg-config fakeroot devscripts
RUN adduser --disabled-password --gecos '' build
USER build
WORKDIR /home/build
RUN git clone https://github.com/dlundquist/sniproxy
WORKDIR /home/build/sniproxy
RUN ./autogen.sh
RUN dpkg-buildpackage
ENTRYPOINT ["/bin/bash"]
