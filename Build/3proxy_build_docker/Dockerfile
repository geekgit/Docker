FROM ubuntu:16.04
MAINTAINER geekgit
RUN apt-get update && apt-get upgrade -y && apt-get install -y software-properties-common
RUN apt-get install -y build-essential git sudo wget
WORKDIR /root
RUN git clone https://github.com/geekgit/linux_scripts_meta
WORKDIR /root/linux_scripts_meta
RUN ./download-all.sh
RUN adduser --disabled-password --gecos '' build
USER build
WORKDIR /home/build
RUN git clone https://github.com/z3APA3A/3proxy
WORKDIR /home/build/3proxy
RUN make -j$(nproc --all) -f Makefile.Linux
USER root
WORKDIR /root
RUN mkdir 3proxy-opt
WORKDIR /root/3proxy-opt
RUN mkdir opt
WORKDIR /root/3proxy-opt/opt
RUN mkdir bin
WORKDIR /root/3proxy-opt/opt/bin
RUN cp /home/build/3proxy/src/3proxy .
RUN chown root:root 3proxy
RUN chmod a+rx-w 3proxy
WORKDIR /root/3proxy-opt
RUN mkdir DEBIAN
WORKDIR /root/3proxy-opt/DEBIAN
ADD control control
WORKDIR /root
RUN dpkg-deb --build 3proxy-opt
RUN cp 3proxy-opt.deb /home/build/3proxy-opt.deb
RUN chown build:build /home/build/3proxy-opt.deb
RUN chmod a+rw-x /home/build/3proxy-opt.deb
USER build
WORKDIR /home/build
ENTRYPOINT ["/bin/bash"]
