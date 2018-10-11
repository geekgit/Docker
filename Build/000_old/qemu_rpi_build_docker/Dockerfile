FROM fedora:23
MAINTAINER geekgit
#Update system
RUN dnf update -y
#Dev tools
RUN dnf install -y @development-tools
#Build deps
RUN dnf install -y --best --allowerasing alien bzip2 dpkg fedora-packager git glib2-devel rpmrebuild tar wget zlib-devel zlibrary
RUN dnf install -y pixman-devel libfdt-devel ncurses-devel
#User for build
RUN useradd build
USER build
WORKDIR /home/build
# try
RUN mkdir pi
WORKDIR /home/build/pi
RUN git clone -b rpi https://github.com/Torlus/qemu
WORKDIR /home/build/pi/qemu
RUN ./configure --prefix=/opt/qemu-rpi-git --target-list=arm-softmmu,arm-linux-user,armeb-linux-user --extra-cflags=-Wno-error
RUN make -j$(nproc --all)
USER root
RUN make install
WORKDIR /root
RUN mkdir qemu-rpi
WORKDIR /root/qemu-rpi
RUN mkdir opt
WORKDIR /root/qemu-rpi/opt
RUN mv /opt/qemu-rpi-git .
WORKDIR /root/qemu-rpi
RUN mkdir DEBIAN
WORKDIR /root/qemu-rpi/DEBIAN
ADD control control
WORKDIR /root
RUN dpkg-deb --build qemu-rpi/
ENTRYPOINT ["/bin/bash"]
