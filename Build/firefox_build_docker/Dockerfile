FROM fedora:23
MAINTAINER geekgit
RUN dnf update -y
RUN dnf install -y --best --allowerasing @development-tools
RUN dnf groupinstall -y --best --allowerasing "C Development Tools and Libraries"
RUN dnf groupinstall -y --best --allowerasing "GNOME Software Development"
RUN dnf install -y --best --allowerasing alien alsa-lib-devel atk-devel autoconf213 bzip2 cairo-devel ccache cmake dbus-devel dbus-glib-devel dpkg fedora-packager fontconfig-devel freetype-devel gcc gcc-c++ GConf2-devel gdk-pixbuf2-devel git glib2-devel glibc-devel glibc-static glib-devel gstreamer-plugins-bad-free-devel gstreamer-plugins-base-devel gtk2-devel gtk+-devel gtk+extra-devel harfbuzz-devel libdrm-devel libstdc++-devel libstdc++-static libX11-devel libXau-devel libxcb-devel libXcomposite-devel libXdamage-devel libXext-devel libXfixes-devel libxml2-devel libXrender-devel libXt-devel libXxf86vm-devel mesa-libEGL-devel mesa-libGL-devel pango-devel pulseaudio-libs-devel rpmrebuild tar wget wireless-tools-devel yasm yasm-devel zlib-devel zlibrary
WORKDIR /root
RUN wget https://kojipkgs.fedoraproject.org//packages/mercurial/3.5.1/1.fc23/x86_64/mercurial-3.5.1-1.fc23.x86_64.rpm -O mercurial.rpm
RUN dnf install -y mercurial.rpm
RUN useradd build
USER build
WORKDIR /home/build
RUN hg clone --verbose --debug --time https://hg.mozilla.org/mozilla-central
WORKDIR /home/build/mozilla-central
ENV SHELL /bin/bash
RUN time ./mach build
ENTRYPOINT ["/bin/bash"]
