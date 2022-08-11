FROM ubuntu:22.04
MAINTAINER geekgit
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get upgrade -y && apt-get install -y software-properties-common
RUN apt-get install -y build-essential unzip wget gnupg git mercurial meld
RUN apt-get install -y autoconf automake build-essential
RUN apt-get install -y libsdl2-dev libwxbase3.0-dev libwxgtk-media3.0-gtk3-dev libwxgtk-webview3.0-gtk3-dev libwxgtk3.0-gtk3-dev libalut-dev libopenal-dev
RUN apt-get install -y ninja-build cmake
RUN apt-get install -y sudo

RUN adduser --disabled-password --gecos '' build
USER build
WORKDIR /home/build
ENV verB -git
RUN git clone https://github.com/sarah-walker-pcem/pcem/
WORKDIR /home/build/pcem
RUN cmake -G "Ninja" -DCMAKE_BUILD_TYPE=Release .
RUN ninja
WORKDIR /home/build
USER build
ENTRYPOINT ["/bin/bash"]
