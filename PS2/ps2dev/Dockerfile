FROM ubuntu:22.04
MAINTAINER geekgit
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get upgrade -y && apt-get install -y software-properties-common
RUN apt-get install -y autoconf automake bison build-essential clang cmake doxygen flex g++ gcc gettext git libelf-dev libfreetype6-dev libgmp3-dev libmpc-dev libmpfr-dev libncurses5-dev libreadline-dev libsdl1.2-dev libtool libtool-bin libusb-dev patch subversion tcl texinfo unzip wget zlib1g-dev
RUN adduser --disabled-password --gecos '' build
USER build
WORKDIR /home/build
RUN git clone https://github.com/ps2dev/ps2dev
USER root
ENV PS2DEV /usr/local/ps2dev
ENV PS2SDK $PS2DEV/ps2sdk
ENV GSKIT $PS2DEV/gsKit
ENV PATH $PATH:$PS2DEV/bin:$PS2DEV/ee/bin:$PS2DEV/iop/bin:$PS2DEV/dvp/bin:$PS2SDK/bin
RUN mkdir -p $PS2DEV && chown build:build $PS2DEV && chmod a+rwx $PS2DEV
RUN mkdir -p $PS2SDK && chown build:build $PS2SDK && chmod a+rwx $PS2SDK
RUN mkdir -p $GSKIT && chown build:build $GSKIT && chmod a+rwx $GSKIT
USER build
WORKDIR /home/build/ps2dev
RUN ./build-all.sh
WORKDIR /home/build
ENTRYPOINT ["/bin/bash"]
