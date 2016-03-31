FROM fedora:rawhide
MAINTAINER geekgit
RUN dnf update -y
RUN dnf groupinstall -y --best --allowerasing "C Development Tools and Libraries" "GNOME Software Development"
RUN dnf install -y --best --allowerasing pcre-devel pcre openssl-devel openssl git gnupg wget unzip dpkg
RUN useradd build
USER build
WORKDIR /home/build
RUN gpg -q --keyserver pgp.mit.edu --recv-keys A1C052F8
ENV NginxVersion nginx-1.9.13
RUN wget http://nginx.org/download/$NginxVersion.tar.gz \
&& wget http://nginx.org/download/$NginxVersion.tar.gz.asc \
&& gpg --verify $NginxVersion.tar.gz.asc $NginxVersion.tar.gz &> /home/build/gpg-verify.log
RUN tar -zxvf $NginxVersion.tar.gz
RUN wget --secure-protocol=TLSv1_2 --https-only https://github.com/arut/nginx-rtmp-module/archive/master.zip -O rtmp.zip && unzip rtmp.zip
WORKDIR /home/build/$NginxVersion
RUN ./configure --with-http_ssl_module --add-module=../nginx-rtmp-module-master --prefix=/opt/nginx-opt &> /home/build/configure.log
RUN make -j8
USER root
RUN make install
WORKDIR /root
RUN mkdir nginx-opt
WORKDIR /root/nginx-opt
RUN mkdir DEBIAN
WORKDIR /root/nginx-opt/DEBIAN
ADD control control
WORKDIR /root/nginx-opt/
RUN mkdir opt
WORKDIR /root/nginx-opt/opt
RUN mv /opt/nginx-opt .
WORKDIR /root
RUN dpkg --build nginx-opt
ENTRYPOINT ["/bin/bash"]
