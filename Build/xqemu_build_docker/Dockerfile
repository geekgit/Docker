FROM qemu_build_docker
MAINTAINER geekgit
USER root
RUN dnf install -y http://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm http://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
RUN dnf update -y
RUN dnf install -y libGLEW libGLEWmx glew-devel
RUN dnf install -y libtxc_dxtn
USER build
WORKDIR /home/build
RUN git clone https://github.com/espes/xqemu.git
WORKDIR /home/build/xqemu
RUN ./configure --python=python2 --enable-opengl --disable-vnc --disable-user --enable-kvm --disable-xen --audio-drv-list=alsa --target-list=xbox-softmmu --extra-cflags="-march=native" --disable-werror --enable-debug --prefix=/opt/xqemu-git
RUN make -j$(nproc --all)
USER root
RUN make install
RUN mkdir /root/xqemu-git/ && mkdir /root/xqemu-git/opt/
WORKDIR /opt
RUN mv xqemu-git /root/xqemu-git/opt/
WORKDIR /root/xqemu-git
RUN mkdir DEBIAN
WORKDIR /root/xqemu-git/DEBIAN
ADD control control
WORKDIR /root
RUN dpkg-deb --build xqemu-git/
ENTRYPOINT ["/bin/bash"]
