FROM fedora:23
MAINTAINER geekgit
#Update system
RUN dnf update -y
#Dev tools
RUN dnf install -y @development-tools
#Build deps
RUN dnf install -y --best --allowerasing alien bzip2 dpkg fedora-packager git glib2-devel rpmrebuild tar wget zlib-devel zlibrary
RUN dnf install -y --best --allowerasing bzip2-devel gcc-c++ glusterfs-devel gnutls-devel gperftools-libs gtk3-devel jemalloc-devel lcov libattr-devel libcap-devel libfdt-devel libgcrypt-devel libiscsi-devel libnfs-devel librbd1-devel libseccomp-devel libssh2-devel libtasn1-devel libtpms-devel libusb-devel lzo-devel mesa-libd3d-devel mesa-libEGL-devel mesa-libgbm-devel mesa-libGL-devel mesa-libGLES-devel mesa-libGLU-devel mesa-libGLw-devel mesa-libOpenCL-devel mesa-libOSMesa-devel mesa-libwayland-egl-devel mesa-libxatracker-devel nettle-devel numactl-devel pixman-devel qca-pkcs11 SDL2-devel SDL-devel shcov snappy-devel spice-protocol spice-server-devel tpm-tools-devel usbredir-devel vte-devel xen-devel
#User for build
RUN useradd build
USER build
WORKDIR /home/build
#try~
RUN git clone git://git.qemu.org/qemu.git
WORKDIR /home/build/qemu
RUN ./configure --prefix=/opt/qemu-git/
RUN make -j$(nproc --all)
USER root
RUN make install
WORKDIR /opt/
RUN mkdir /root/qemu-git/ && mkdir /root/qemu-git/opt/
RUN mv qemu-git /root/qemu-git/opt/
WORKDIR /root/qemu-git
RUN mkdir DEBIAN
WORKDIR /root/qemu-git/DEBIAN
ADD control control
WORKDIR /root
RUN dpkg-deb --build qemu-git/
ENTRYPOINT ["/bin/bash"]
