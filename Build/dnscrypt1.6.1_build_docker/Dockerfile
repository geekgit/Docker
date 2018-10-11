FROM fedora:28
MAINTAINER geekgit
RUN dnf update -y
RUN dnf groupinstall -y --best --allowerasing "Development Tools"
RUN dnf groupinstall -y --best --allowerasing "C Development Tools and Libraries"
RUN dnf install -y --best --allowerasing alien bzip2 dpkg fedora-packager git rpmrebuild tar wget libsodium-devel gnupg
RUN useradd build
USER build
WORKDIR /home/build
ENV DnsCryptVer 1.6.1
ENV DnsCryptVerLaunchpad $DnsCryptVer-1
ENV DnsCryptDir dnscrypt-proxy-$DnsCryptVer
ENV DnsCryptArchive dnscrypt-proxy_$DnsCryptVer.orig
ENV PrefixName dnscrypt-opt
RUN wget --secure-protocol=TLSv1_2 --https-only https://launchpad.net/ubuntu/+archive/primary/+sourcefiles/dnscrypt-proxy/$DnsCryptVerLaunchpad/$DnsCryptArchive.tar.gz -O $DnsCryptArchive.tar.gz
RUN echo "$DnsCryptArchive.tar.gz" > /home/build/log.txt
RUN echo "Hash:" >> /home/build/log.txt
RUN echo "md5: $(md5sum $DnsCryptArchive.tar.gz | awk {'print $1'})" >> /home/build/log.txt
RUN echo "sha1: $(sha1sum $DnsCryptArchive.tar.gz | awk {'print $1'})" >> /home/build/log.txt
RUN echo "sha256: $(sha256sum $DnsCryptArchive.tar.gz | awk {'print $1'})" >> /home/build/log.txt
RUN echo "sha512: $(sha512sum $DnsCryptArchive.tar.gz | awk {'print $1'})" >> /home/build/log.txt
RUN tar -xvf $DnsCryptArchive.tar.gz
WORKDIR /home/build/$DnsCryptDir
RUN echo "===============" >> /home/build/log.txt
RUN echo "configure:" >> /home/build/log.txt
RUN ./configure --prefix=/opt/$PrefixName &>> /home/build/log.txt
RUN echo "===============" >> /home/build/log.txt
RUN echo "make:" >> /home/build/log.txt
RUN make -j$(nproc --all) &>> /home/build/log.txt
USER root
RUN make install
WORKDIR /root
RUN mkdir $PrefixName
WORKDIR /root/$PrefixName
RUN mkdir opt
WORKDIR /root/$PrefixName/opt
RUN mv /opt/$PrefixName $PrefixName
WORKDIR /root/$PrefixName
RUN mkdir bin
WORKDIR /root/$PrefixName/bin
ADD dnscrypt-start dnscrypt-start
RUN chmod a+rx-w dnscrypt-start
WORKDIR /root/$PrefixName
RUN mkdir lib
WORKDIR /root/$PrefixName/lib
RUN mkdir systemd
WORKDIR /root/$PrefixName/lib/systemd
RUN mkdir system
WORKDIR /root/$PrefixName/lib/systemd/system
ADD dnscrypt.service dnscrypt.service
WORKDIR /root/$PrefixName
RUN mkdir DEBIAN
WORKDIR /root/$PrefixName/DEBIAN
ADD control control
ADD postinst postinst
RUN chmod 0555 postinst
WORKDIR /root
RUN dpkg --build $PrefixName
RUN echo "===============" >> /home/build/log.txt
RUN echo "$PrefixName.deb" >> /home/build/log.txt
RUN echo "md5: $(md5sum $PrefixName.deb | awk {'print $1'})" >> /home/build/log.txt
RUN echo "sha1: $(sha1sum $PrefixName.deb | awk {'print $1'})" >> /home/build/log.txt
RUN echo "sha256: $(sha256sum $PrefixName.deb | awk {'print $1'})" >> /home/build/log.txt
RUN echo "sha512: $(sha512sum $PrefixName.deb | awk {'print $1'})" >> /home/build/log.txt
USER build
WORKDIR /home/build
ENTRYPOINT ["/bin/bash"]
