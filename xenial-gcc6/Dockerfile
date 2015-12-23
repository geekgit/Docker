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
RUN add-apt-repository -y ppa:ubuntu-toolchain-r/test
RUN apt-get update -y 2>/root/update-error-2.txt; exit 0
RUN apt-get install -y wget gcc-6
RUN apt-get install -y g++-6
ADD set-gcc6 /usr/bin/set-gcc6
RUN chmod +x /usr/bin/set-gcc6
RUN set-gcc6
RUN adduser --disabled-password --gecos '' user
USER user
WORKDIR /home/user
ENTRYPOINT ["/bin/bash"]
