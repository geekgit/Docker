FROM ubuntu:15.10
MAINTAINER geekgit
RUN dpkg --add-architecture i386 \
&& apt-get update \
&& apt-get upgrade -y \
&& apt-get install -y software-properties-common
RUN apt-get install -y nginx
RUN apt-get install -y libssl1.0.0:i386 libssl1.0.0:amd64
RUN apt-get install -y links lynx 
WORKDIR /root
ADD nginx-opt-ubuntu.deb nginx-opt-ubuntu.deb
#RUN cat /opt/nginx-opt-ubuntu/conf/nginx.conf
RUN dpkg -i --force-overwrite nginx-opt-ubuntu.deb
#config
#/opt/nginx-opt-ubuntu/conf/nginx.conf
ADD rtmp.conf rtmp.conf
RUN cat rtmp.conf >> /opt/nginx-opt-ubuntu/conf/nginx.conf
RUN ln -sf /opt/nginx-opt-ubuntu/conf/nginx.conf /etc/nginx/nginx.conf
ADD nginx-start.sh /sbin/nginx-start
RUN chmod a+rx-w /sbin/nginx-start
#RUN adduser --disabled-password --gecos '' user
#USER user
#WORKDIR /home/user
ENTRYPOINT ["/bin/bash"]
