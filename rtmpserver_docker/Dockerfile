FROM ubuntu:15.10
MAINTAINER geekgit
RUN dpkg --add-architecture i386 \
&& apt-get update \
&& apt-get upgrade -y \
&& apt-get install -y software-properties-common
RUN apt-get install -y nginx
RUN apt-get install -y libssl1.0.0:i386 libssl1.0.0:amd64 
WORKDIR /root
ADD nginx-opt-ubuntu.deb nginx-opt-ubuntu.deb
RUN dpkg -i --force-overwrite nginx-opt-ubuntu.deb
RUN adduser --disabled-password --gecos '' user
USER user
WORKDIR /home/user
ENTRYPOINT ["/bin/bash"]
