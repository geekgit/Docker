FROM fedora:rawhide
MAINTAINER geekgit
RUN dnf update -y
RUN dnf groupinstall -y --best --allowerasing "C Development Tools and Libraries" "GNOME Software Development"
RUN dnf install -y --best --allowerasing libusb-devel cmake autoconf autoconf-archive automake file dpkg
RUN useradd build
USER build
WORKDIR /home/build
RUN git clone https://github.com/mutability/rtl-sdr
WORKDIR /home/build/rtl-sdr
RUN autoreconf -i
RUN ./configure --prefix=/opt/rtlsdr-mod --enable-driver-detach
RUN make -j$(nproc --all)
USER root
RUN make install
WORKDIR /root
RUN mkdir rtlsdr-mod
WORKDIR /root/rtlsdr-mod
RUN mkdir DEBIAN
WORKDIR /root/rtlsdr-mod/DEBIAN
ADD control control
WORKDIR /root/rtlsdr-mod
RUN mkdir opt
WORKDIR /root/rtlsdr-mod/opt
RUN mv /opt/rtlsdr-mod .
WORKDIR /root
RUN dpkg --build rtlsdr-mod
ENTRYPOINT ["/bin/bash"]
