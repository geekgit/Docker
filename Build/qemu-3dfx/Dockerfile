FROM ubuntu:20.04
MAINTAINER geekgit
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get upgrade -y && apt-get install -y software-properties-common
RUN apt-get install -y build-essential unzip wget gnupg git autoconf automake build-essential rsync patch bash tar sudo ninja-build pkg-config libglib2.0-dev libfdt-dev libpixman-1-dev zlib1g-dev bzip2 git-email libaio-dev libbluetooth-dev libbrlapi-dev libcap-ng-dev libcurl4-gnutls-dev libgtk-3-dev libibverbs-dev libjpeg8-dev libncurses5-dev libnuma-dev librbd-dev librdmacm-dev libsasl2-dev libsdl2-dev libseccomp-dev libsnappy-dev libssh-dev libvde-dev libvdeplug-dev libvte-2.91-dev libxen-dev liblzo2-dev valgrind xfslibs-dev libnfs-dev libiscsi-dev
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
RUN /home/build/qemu-3dfx/qemu-6.2.0/configure --target-list=i386-softmmu
RUN make -j$(nproc --all)
WORKDIR /home/build
USER build
RUN tar cvzf qemu-3dfx.tar.gz qemu-3dfx/
ENTRYPOINT ["/bin/bash"]
