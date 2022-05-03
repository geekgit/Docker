FROM ubuntu:20.04
MAINTAINER geekgit
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get upgrade -y && apt-get install -y software-properties-common
RUN apt-get install -y build-essential unzip wget gnupg git
RUN apt-get install -y autoconf automake build-essential
RUN apt-get install -y rsync patch bash tar
RUN apt-get install -y sudo
RUN adduser --disabled-password --gecos '' build
USER build
WORKDIR /home/build
RUN git clone https://github.com/geekgit/qemu-3dfx
WORKDIR /home/build/qemu-3dfx
RUN wget  --secure-protocol=TLSv1_2 --https-only "https://download.qemu.org/qemu-6.2.0.tar.xz"
RUN tar xf qemu-6.2.0.tar.xz
WORKDIR /home/build/qemu-3dfx/qemu-6.2.0
RUN rsync -r ../qemu-0/hw/3dfx ./hw/
RUN rsync -r ../qemu-1/hw/mesa ./hw/
RUN patch -p0 -i ../00-qemu620-mesa-glide.patch
RUN bash /home/build/qemu-3dfx/scripts/sign_commit
RUN mkdir /home/build/qemu-3dfx/build
WORKDIR /home/build/qemu-3dfx/build
#install deps (1)
USER root
WORKDIR /root
RUN apt-get install -y ninja-build
RUN apt-get install -y pkg-config
RUN apt-get install -y libglib2.0-dev
RUN apt-get install -y libfdt-dev
RUN apt-get install -y libpixman-1-dev
RUN apt-get install -y zlib1g-dev
RUN apt-get install -y bzip2
#install deps (2)
RUN apt-get install -y git-email
RUN apt-get install -y libaio-dev
RUN apt-get install -y libbluetooth-dev
RUN apt-get install -y libbrlapi-dev
RUN apt-get install -y libcap-ng-dev
RUN apt-get install -y libcurl4-gnutls-dev
RUN apt-get install -y libgtk-3-dev
RUN apt-get install -y libibverbs-dev
RUN apt-get install -y libjpeg8-dev
RUN apt-get install -y libncurses5-dev
RUN apt-get install -y libnuma-dev
RUN apt-get install -y librbd-dev
RUN apt-get install -y librdmacm-dev
RUN apt-get install -y libsasl2-dev
RUN apt-get install -y libsdl2-dev
RUN apt-get install -y libseccomp-dev
RUN apt-get install -y libsnappy-dev
RUN apt-get install -y libssh-dev
RUN apt-get install -y libvde-dev
RUN apt-get install -y libvdeplug-dev
RUN apt-get install -y libvte-2.91-dev
RUN apt-get install -y libxen-dev
RUN apt-get install -y liblzo2-dev
RUN apt-get install -y valgrind
RUN apt-get install -y xfslibs-dev
RUN apt-get install -y libnfs-dev
#return to build
USER build
WORKDIR /home/build/qemu-3dfx/build
RUN /home/build/qemu-3dfx/qemu-6.2.0/configure && make
WORKDIR /home/build
USER build
ENTRYPOINT ["/bin/bash"]
