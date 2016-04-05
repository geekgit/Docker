FROM ubuntu:16.04
MAINTAINER geekgit
RUN apt-get update && apt-get upgrade -y && apt-get install -y software-properties-common
RUN apt-get install -y build-essential libpcre3 libpcre3-dev libssl-dev wget gnupg
RUN apt-get install -y unzip
RUN adduser --disabled-password --gecos '' build
USER build
WORKDIR /home/build
RUN gpg -q --keyserver pgp.mit.edu --recv-keys A1C052F8
RUN wget http://nginx.org/download/nginx-1.9.13.tar.gz
RUN wget http://nginx.org/download/nginx-1.9.13.tar.gz.asc
RUN gpg --verify nginx-1.9.13.tar.gz.asc nginx-1.9.13.tar.gz 2>/home/build/gpg-verify.log
RUN wget https://github.com/arut/nginx-rtmp-module/archive/master.zip -O rtmp.zip
RUN tar -zxvf nginx-1.9.13.tar.gz
RUN unzip rtmp.zip
WORKDIR /home/build/nginx-1.9.13
RUN  ./configure --with-http_ssl_module --add-module=../nginx-rtmp-module-master --prefix=/opt/nginx-opt-ubuntu 2>&1 1>/home/build/configure.log
RUN make -j8
USER root
RUN make install
#build
WORKDIR /root
RUN mkdir nginx-opt-ubuntu
WORKDIR /root/nginx-opt-ubuntu
RUN mkdir DEBIAN
WORKDIR /root/nginx-opt-ubuntu/DEBIAN
ADD control control
WORKDIR /root/nginx-opt-ubuntu/
RUN mkdir opt
WORKDIR /root/nginx-opt-ubuntu/opt
RUN mv /opt/nginx-opt-ubuntu .
WORKDIR /root
RUN dpkg --build nginx-opt-ubuntu
ENTRYPOINT ["/bin/bash"]
