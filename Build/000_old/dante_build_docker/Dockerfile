FROM ubuntu:16.04
MAINTAINER geekgit
RUN apt-get update && apt-get upgrade -y && apt-get install -y software-properties-common
RUN apt-get install -y build-essential git libwrap0 libwrap0-dev sudo wget
WORKDIR /root
RUN git clone https://github.com/geekgit/linux_scripts_meta
WORKDIR /root/linux_scripts_meta
RUN ./download-all.sh
RUN adduser --disabled-password --gecos '' build
USER build
WORKDIR /home/build
RUN wget  --secure-protocol=TLSv1_2 --https-only https://www.inet.no/dante/files/dante-1.4.2.tar.gz
RUN tar -xvf dante-1.4.2.tar.gz
WORKDIR /home/build/dante-1.4.2
RUN ./configure --prefix=/opt/dante-server-opt/
RUN make -j$(nproc --all)
USER root
RUN make install
WORKDIR /root
RUN mkdir dante-server-opt
WORKDIR /root/dante-server-opt
RUN mkdir opt
WORKDIR /root/dante-server-opt/opt
RUN mv /opt/dante-server-opt .
WORKDIR /root/dante-server-opt
RUN mkdir DEBIAN
WORKDIR /root/dante-server-opt/DEBIAN
ADD control control
WORKDIR /root
RUN dpkg-deb --build dante-server-opt
RUN cp dante-server-opt.deb /home/build/dante-server-opt.deb
RUN chown build:build /home/build/dante-server-opt.deb
RUN chmod a+rw-x /home/build/dante-server-opt.deb
USER build
WORKDIR /home/build
ENTRYPOINT ["/bin/bash"]
