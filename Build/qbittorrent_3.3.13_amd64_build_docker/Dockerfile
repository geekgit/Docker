FROM ubuntu:16.04
MAINTAINER geekgit
RUN apt-get update && apt-get upgrade -y && apt-get install -y software-properties-common
RUN apt-get install -y autoconf automake bison build-essential flex gcc geoip-database git gnupg libboost-chrono-dev libboost-dev libboost-random-dev libboost-system-dev libgeoip-dev libssl-dev libtool make pkg-config pv python python-setuptools qtbase5-dev qttools5-dev-tools sudo unzip wget
WORKDIR /root
RUN git clone https://github.com/geekgit/linux_scripts_meta
WORKDIR /root/linux_scripts_meta
RUN ./download-all.sh
# user
RUN adduser --disabled-password --gecos '' build
USER build
WORKDIR /home/build
RUN git clone https://github.com/arvidn/libtorrent.git
WORKDIR /home/build/libtorrent
RUN git checkout RC_1_0
RUN ./autotool.sh
RUN ./configure --disable-debug --enable-encryption --prefix=/usr --with-libgeoip=system
RUN make clean
RUN make -j$(nproc --all)
USER root
RUN make install
USER build
WORKDIR /home/build
ENV qbKey 0x6E4A2D025B7CC9A2
RUN gpg --keyserver pgp.mit.edu --recv-keys "${qbKey}"
ENV qbVersion 3.3.13
RUN wget --secure-protocol=TLSv1_2 --https-only "https://sourceforge.net/projects/qbittorrent/files/qbittorrent/qbittorrent-${qbVersion}/qbittorrent-${qbVersion}.tar.gz"
RUN wget --secure-protocol=TLSv1_2 --https-only "https://sourceforge.net/projects/qbittorrent/files/qbittorrent/qbittorrent-${qbVersion}/qbittorrent-${qbVersion}.tar.gz.asc"
RUN gpg --verify "qbittorrent-${qbVersion}.tar.gz.asc" "qbittorrent-${qbVersion}.tar.gz"
RUN mkdir qbittorrent
RUN tar -xvf "qbittorrent-${qbVersion}.tar.gz" -C /home/build/qbittorrent
WORKDIR /home/build/qbittorrent/qbittorrent-${qbVersion}
RUN ./configure --prefix=/opt/qbittorrent-${qbVersion}-opt
RUN make -j$(nproc --all)
USER root
RUN make install
WORKDIR /root
ADD control control
RUN mkdir /root/opt
RUN mv /opt/qbittorrent-${qbVersion}-opt /root/opt
RUN geekgit-devel-create-deb /root/opt /root/control
RUN chmod a+rwx qbittorrent-${qbVersion}-opt.deb
RUN chown build:build qbittorrent-${qbVersion}-opt.deb
RUN cp qbittorrent-${qbVersion}-opt.deb /home/build
USER build
WORKDIR /home/build
RUN geekgit-md5-calculate qbittorrent-${qbVersion}-opt.deb
ENTRYPOINT ["/bin/bash"]
