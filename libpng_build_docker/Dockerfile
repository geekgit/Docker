FROM fedora:23
MAINTAINER geekgit
RUN dnf install -y --nogpgcheck http://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm http://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
RUN dnf update -y
RUN dnf install -y @development-tools
RUN dnf install -y git wget tar gzip bzip2
#Build deps
#User for build
RUN useradd build
USER build
WORKDIR /home/build
#try~
RUN wget http://heanet.dl.sourceforge.net/project/libpng/libpng16/1.6.20/libpng-1.6.20.tar.gz
RUN tar -vxzf libpng-1.6.20.tar.gz
RUN ls -l
WORKDIR /home/build/libpng-1.6.20
RUN ls -l
RUN chmod +x configure
USER root
RUN dnf install -y make gcc gcc-c++ automake autoconf
RUN dnf install -y file
RUN dnf install -y zlib zlib-devel
RUN dnf install -y dpkg
USER build
RUN ./configure --prefix=/opt/libpng-1.6.20
RUN make -j8
USER root
RUN make install
RUN ls -l /opt/libpng-1.6.20
WORKDIR /root
RUN mkdir libpng-1.6.20
WORKDIR /root/libpng-1.6.20
RUN mkdir opt
WORKDIR /root/libpng-1.6.20/opt
RUN cp -R /opt/libpng-1.6.20 libpng-1.6.20
WORKDIR /root/libpng-1.6.20
RUN mkdir DEBIAN
WORKDIR /root/libpng-1.6.20/DEBIAN
ADD control control
WORKDIR /root
RUN dpkg-deb --build libpng-1.6.20
ENTRYPOINT ["/bin/bash"]

