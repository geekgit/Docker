FROM fedora:22
MAINTAINER geekgit
#Update system
RUN dnf update -y
#Dev tools
RUN dnf install -y @development-tools
#Build deps
RUN dnf install -y --best --allowerasing alsa-lib-devel.i686 bison bzip2 cups-devel.i686 dbus-devel.i686 flex fontconfig-devel.i686 freetype-devel freetype-devel.i686 gettext-devel glibc-devel.i686 gnutls-devel.i686 gstreamer-devel.i686 gstreamer-plugins-base-devel gstreamer-plugins-base-devel.i686 lcms2-devel.i686 libdbusmenu-devel.i686 libgcc.i686 libgphoto2-devel.i686 libjpeg-turbo-devel libjpeg-turbo-devel.i686 libksane-devel.i686 libpcap-devel.i686 libpng-devel.i686 libstdc++.i686 libtiff-devel.i686 libv4l-devel.i686 libX11-devel.i686 libXcursor-devel libXcursor-devel.i686 libX*.i686 libxml2-devel.i686 libxslt-devel.i686 mesa-libGL-devel.i686 mesa-libGLU-devel mesa-libGLU-devel.i686 mesa-libOpenCL-devel.i686 mesa-libOSMesa-devel.i686 ncurses-devel.i686 nss-softokn-freebl.i686 openal-soft-devel.i686 opencl-headers.noarch opencl-utils-devel.i686 openldap-devel.i686 prelink pulseaudio-libs-devel pulseaudio-libs-devel.i686 samba-winbind sane-backends-devel.i686 tar wget zlib-devel.i686
#User for build
RUN useradd build
USER build
WORKDIR /home/build
#try~
RUN wget http://mirrors.ibiblio.org/wine/source/1.7/wine-1.7.50.tar.bz2
RUN tar -xjf wine-1.7.50.tar.bz2
RUN ./wine-1.7.50/configure --without-freetype
ENTRYPOINT ["/bin/bash"]

