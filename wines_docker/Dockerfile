FROM ubuntu:15.04
MAINTAINER geekgit
RUN dpkg --add-architecture i386
RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install -y software-properties-common
#wine-staging PPA 
RUN add-apt-repository ppa:pipelight/stable
RUN apt-get update -y
#install russian, english and japanese language
RUN apt-get install language-pack-en language-pack-en-base language-pack-ru language-pack-ru-base language-pack-ja language-pack-ja-base manpages
ADD locale /etc/default/locale
#fonts, codecs, x stuff, wine~
RUN apt-get install -y fonts-takao-gothic fonts-takao-mincho ubuntu-restricted-extras ubuntustudio-font-meta xvfb
RUN apt-get install --install-recommends -y wine-staging wine-staging-compat winetricks
#create user
RUN adduser --disabled-password --gecos '' user
USER user
WORKDIR /home/user
#RUN winetricks sandbox
#ENTRYPOINT ["/usr/bin/wine"]
ENTRYPOINT ["/bin/bash"]

