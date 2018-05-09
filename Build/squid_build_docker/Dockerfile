FROM ubuntu:16.04
MAINTAINER geekgit
#
WORKDIR /root
ADD sources.list sources.list
RUN cat sources.list > /etc/apt/sources.list
#
RUN apt-get update && apt-get upgrade -y && apt-get install -y software-properties-common
RUN apt-get install -y build-essential git sudo wget devscripts dpkg-dev libssl-dev openssl libcppunit-dev libsasl2-dev cdbs ccze libfile-readbackwards-perl libcap2 libcap-dev libcap2-dev libnetfilter-conntrack-dev autopoint comerr-dev dh-apparmor dh-autoreconf icu-devtools krb5-multidev libdb-dev libdb5.3-dev libecap3 libecap3-dev libexpat1-dev libgmp-dev libgmpxx4ldbl libgnutls-dev libgnutls-openssl27 libgnutls28-dev libgnutlsxx28 libgssrpc4 libicu-dev libidn11-dev libkadm5clnt-mit9 libkadm5srv-mit9 libkdb5-8 libkrb5-dev libldap2-dev libltdl-dev libltdl7 libp11-kit-dev libpam0g-dev libtasn1-6-dev libtool libxml2-dev nettle-dev
WORKDIR /root
RUN git clone https://github.com/geekgit/linux_scripts_meta
WORKDIR /root/linux_scripts_meta
RUN ./download-all.sh
WORKDIR /root
RUN adduser --disabled-password --gecos '' build
USER build
WORKDIR /home/build
RUN apt-get source squid3=3.5.12
ADD rules rules
RUN cat rules > /home/build/squid3-3.5.12/debian/rules
RUN echo "" > squid-opt.deb
RUN cat /etc/apt/sources.list > sources.list
WORKDIR /home/build/squid3-3.5.12
RUN dpkg-buildpackage -d
WORKDIR /home/build
RUN rm squid-opt.deb
RUN tar -czvf squid.tar.gz *.deb
ENTRYPOINT ["/bin/bash"]
