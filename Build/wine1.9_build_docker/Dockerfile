# No 'prelink' package in Fedora 23 -> using Fedora 22
FROM fedora:22
MAINTAINER geekgit
#Update system
RUN dnf update -y
#Dev tools
RUN dnf install -y @development-tools
#Build deps
RUN dnf install -y --best --allowerasing alien alsa-lib-devel.i686 bison bzip2 cups-devel.i686 dbus-devel.i686 dpkg fedora-packager flex fontconfig-devel.i686 freetype-devel freetype-devel.i686 gettext-devel glibc-devel.i686 gnutls-devel.i686 gstreamer-devel.i686 gstreamer-plugins-base-devel gstreamer-plugins-base-devel.i686 lcms2-devel.i686 libdbusmenu-devel.i686 libgcc.i686 libgphoto2-devel.i686 libjpeg-turbo-devel libjpeg-turbo-devel.i686 libksane-devel.i686 libpcap-devel.i686 libpng-devel.i686 libstdc++.i686 libtiff-devel.i686 libv4l-devel.i686 libX11-devel.i686 libXcursor-devel libXcursor-devel.i686 libX*.i686 libxml2-devel.i686 libxslt-devel.i686 mesa-libGL-devel.i686 mesa-libGLU-devel mesa-libGLU-devel.i686 mesa-libOpenCL-devel.i686 mesa-libOSMesa-devel.i686 ncurses-devel.i686 nss-softokn-freebl.i686 openal-soft-devel.i686 opencl-headers.noarch opencl-utils-devel.i686 openldap-devel.i686 prelink pulseaudio-libs-devel pulseaudio-libs-devel.i686 rpmrebuild samba-winbind sane-backends-devel.i686 tar wget zlib-devel.i686
#User for build
RUN useradd build
USER build
WORKDIR /home/build
#try~
ENV PACKAGE wine-1.9.7
ENV URL https://dl.winehq.org/wine/source/1.9/wine-1.9.7.tar.bz2
RUN wget --secure-protocol=TLSv1_2 --https-only $URL
RUN echo "$PACKAGE.tar.bz2 hash (md5, sha1, sha256, sha512)" >> /home/build/hash-log.txt
RUN md5sum $PACKAGE.tar.bz2 >> /home/build/hash-log.txt && sha1sum $PACKAGE.tar.bz2 >> /home/build/hash-log.txt && sha256sum $PACKAGE.tar.bz2 >> /home/build/hash-log.txt && sha512sum $PACKAGE.tar.bz2 >> /home/build/hash-log.txt
RUN tar -xjf $PACKAGE.tar.bz2
WORKDIR /home/build/$PACKAGE
RUN echo "files hash (md5):"
RUN find . -type f -exec md5sum {} + >> /home/build/hash-log.txt
RUN ./configure --prefix=/opt/$PACKAGE &>/home/build/configure-log.txt
RUN make -j8 depend
RUN make -j8
USER root
RUN make install
RUN ls /opt/$PACKAGE
RUN mkdir /root/$PACKAGE-opt/
RUN mkdir /root/$PACKAGE-opt/DEBIAN
ADD control /root/$PACKAGE-opt/DEBIAN/control
RUN mkdir /root/$PACKAGE-opt/opt
RUN mv /opt/$PACKAGE /root/$PACKAGE-opt/opt
RUN chown -R root:root /root/$PACKAGE-opt/
RUN dpkg-deb --build /root/$PACKAGE-opt/
RUN cp /root/$PACKAGE-opt.deb /home/build/
RUN chmod a+rw /home/build/$PACKAGE-opt.deb
RUN rm -rf /root/$PACKAGE-opt/
# wine deb build ok!
WORKDIR /home/build/
RUN alien --to-rpm $PACKAGE-opt.deb
RUN mv *.rpm $PACKAGE-opt-bad.rpm
ADD rpm-fix-wine /usr/local/bin/rpm-fix-wine
RUN chown root /usr/local/bin/rpm-fix-wine && chmod a+x /usr/local/bin/rpm-fix-wine
ENV EDITOR /usr/local/bin/rpm-fix-wine
RUN echo y | rpmrebuild -pe $PACKAGE-opt-bad.rpm
ENV EDITOR /bin/vi
RUN mv /root/rpmbuild/RPMS/i386/wine*.i386.rpm /home/build/$PACKAGE-opt.rpm
RUN chmod a+rw *.rpm *.deb *.spec *-log.txt && chown build *.rpm *.deb *.spec *-log.txt
# wine rpm build ok!
USER build
RUN md5sum $PACKAGE-opt.deb > $PACKAGE-opt.deb.md5 && md5sum $PACKAGE-opt.rpm > $PACKAGE-opt.rpm.md5 && sha512sum $PACKAGE-opt.deb > $PACKAGE-opt.deb.sha512 && sha512sum $PACKAGE-opt.rpm > $PACKAGE-opt.rpm.sha512
RUN mkdir buffer && mv *-log.txt buffer/ && mv *.spec buffer/ && mv *.deb buffer/ && mv *.rpm buffer/ && mv *.md5 buffer/ && mv *.sha512 buffer/ && tar -zcf buffer.tar.gz buffer
ENTRYPOINT ["/bin/bash"]
