FROM ubuntu:16.04
MAINTAINER geekgit
RUN apt-get update && apt-get upgrade -y && apt-get install -y software-properties-common
RUN apt-get install -y build-essential libpcre3 libpcre3-dev libssl-dev wget gnupg
RUN apt-get install -y unzip
RUN adduser --disabled-password --gecos '' build
USER build
WORKDIR /home/build
RUN gpg -q --keyserver pgp.mit.edu --recv-keys A1C052F8
ENV NginxVersion 1.10.1
ENV NginxName nginx-$NginxVersion
RUN wget http://nginx.org/download/$NginxName.tar.gz
RUN wget http://nginx.org/download/$NginxName.tar.gz.asc
RUN gpg --verify $NginxName.tar.gz.asc $NginxName.tar.gz 2>/home/build/gpg-verify.log
RUN wget https://github.com/arut/nginx-rtmp-module/archive/master.zip -O rtmp.zip
RUN tar -zxvf $NginxName.tar.gz
RUN unzip rtmp.zip
WORKDIR /home/build/$NginxName
RUN  ./configure --with-http_ssl_module --add-module=../nginx-rtmp-module-master --prefix=/opt/nginx-opt-ubuntu 2>&1 1>/home/build/configure.log
RUN make -j$(nproc --all)
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
