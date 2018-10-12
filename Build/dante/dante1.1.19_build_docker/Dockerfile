FROM ubuntu:14.04
MAINTAINER geekgit
RUN apt-get update && apt-get upgrade -y && apt-get install -y software-properties-common
RUN apt-get install -y build-essential git libwrap0 libwrap0-dev sudo wget
RUN adduser --disabled-password --gecos '' build
USER build
WORKDIR /home/build
ENV DanteVer 1.1.19
RUN wget --https-only https://www.inet.no/dante/files/dante-$DanteVer.tar.gz
RUN tar -xvf dante-$DanteVer.tar.gz
WORKDIR /home/build/dante-$DanteVer
RUN ./configure --prefix=/opt/dante-server$DanteVer-opt/
RUN make -j$(nproc --all)
USER root
RUN make install
WORKDIR /root
RUN mkdir dante-server$DanteVer-opt
WORKDIR /root/dante-server$DanteVer-opt
RUN mkdir opt
WORKDIR /root/dante-server$DanteVer-opt/opt
RUN mv /opt/dante-server$DanteVer-opt .
WORKDIR /root/dante-server$DanteVer-opt
RUN mkdir DEBIAN
WORKDIR /root/dante-server$DanteVer-opt/DEBIAN
ADD control control
WORKDIR /root
RUN dpkg-deb --build dante-server$DanteVer-opt
RUN cp dante-server$DanteVer-opt.deb /home/build/dante-server$DanteVer-opt.deb
RUN chown build:build /home/build/dante-server$DanteVer-opt.deb
RUN chmod a+rw-x /home/build/dante-server$DanteVer-opt.deb
USER build
WORKDIR /home/build
ENTRYPOINT ["/bin/bash"]
