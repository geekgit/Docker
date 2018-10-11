FROM fedora:23
MAINTAINER geekgit
RUN dnf install -y --nogpgcheck http://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm http://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
RUN dnf update -y
RUN dnf install -y @development-tools
RUN dnf install -y git wget tar gzip bzip2
#Build deps
RUN dnf install -y autoconf autoconf-archive dh-autoreconf file fontconfig fontconfig-devel freetype freetype-devel fribidi fribidi-devel perl-Math-BigInt perl-Math-BigRat pkgconfig yasm
#user
RUN useradd build
USER build
WORKDIR /home/build
#build
RUN git clone https://github.com/mpv-player/mpv-build.git
WORKDIR /home/build/mpv-build
RUN git clone https://github.com/FFmpeg/FFmpeg.git ffmpeg
RUN git clone http://anongit.freedesktop.org/git/fribidi/fribidi.git fribidi
RUN git clone https://github.com/libass/libass.git libass
RUN git clone https://github.com/mpv-player/mpv.git mpv
RUN ./rebuild -j$(nproc --all)
ENTRYPOINT ["/bin/bash"]
