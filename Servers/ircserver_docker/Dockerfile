FROM ubuntu:16.04
MAINTAINER geekgit
RUN dpkg --add-architecture i386 \
&& apt-get update \
&& apt-get upgrade -y \
&& apt-get install -y software-properties-common
RUN add-apt-repository universe
RUN add-apt-repository multiverse
RUN apt-get upgrade -y && apt-get install -y nano git bash sudo wget tar
RUN apt-get install -y irssi weechat pork
RUN apt-get install -y net-tools
WORKDIR /root
RUN git clone https://github.com/geekgit/linux_scripts_meta
WORKDIR /root/linux_scripts_meta
RUN ./download-all.sh
# PPA
RUN add-apt-repository -y ppa:chronos-tachyon/unrealircd
RUN geekgit-tweak-custom-ppa ppa:chronos-tachyon/trusty/unrealircd
RUN apt-get update
# install
RUN apt-get install -y unrealircd
# .deb
WORKDIR /tmp
RUN apt-get download unrealircd
RUN mv unrealircd_4.0.2-4_amd64.deb /root
WORKDIR /root
RUN cat /etc/unrealircd/unrealircd.conf
ADD unrealircd.conf /etc/unrealircd/unrealircd.conf
RUN cat /etc/unrealircd/unrealircd.conf
ENTRYPOINT ["/bin/bash"]
