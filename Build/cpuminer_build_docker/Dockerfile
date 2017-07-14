FROM fedora:23
MAINTAINER geekgit
RUN dnf update -y
RUN dnf install -y --best --allowerasing @development-tools
RUN dnf groupinstall -y --best --allowerasing "C Development Tools and Libraries"
RUN dnf groupinstall -y --best --allowerasing "GNOME Software Development"
RUN dnf install -y --best --allowerasing git gcc make curl-devel libcurl-devel pkgconfig yasm autoconf autoconf-archive automake ncurses-devel
RUN dnf install -y --best --allowerasing dpkg fedora-packager rpmrebuild
RUN useradd build
USER build
WORKDIR /home/build
RUN git clone https://github.com/pooler/cpuminer
WORKDIR /home/build/cpuminer
RUN ./autogen.sh
RUN ./configure CFLAGS="-O3" prefix=/opt/cpuminer-git
RUN make -j8
USER root
RUN make install
WORKDIR /root
RUN mkdir cpuminer-git
WORKDIR /root/cpuminer-git
RUN mkdir opt
WORKDIR /root/cpuminer-git/opt
RUN mv /opt/cpuminer-git .
WORKDIR /root/cpuminer-git
RUN mkdir DEBIAN
WORKDIR /root/cpuminer-git/DEBIAN
ADD control control
WORKDIR /root
RUN dpkg-deb --build cpuminer-git
ENTRYPOINT ["/bin/bash"]
