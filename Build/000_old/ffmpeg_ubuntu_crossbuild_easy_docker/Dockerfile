FROM ubuntu:16.04
MAINTAINER geekgit
RUN apt-get update && apt-get upgrade -y && apt-get install -y software-properties-common
RUN apt-get install -y build-essential unzip wget gnupg git
RUN apt-get install -y autoconf automake build-essential libass-dev libfreetype6-dev libsdl1.2-dev libtheora-dev libtool libva-dev libvdpau-dev libvorbis-dev libxcb1-dev libxcb-shm0-dev libxcb-xfixes0-dev pkg-config texinfo zlib1g-dev
RUN apt-get install -y yasm libx264-dev cmake mercurial libmp3lame-dev libopus-dev libvpx-dev
RUN apt-get install -y sudo
RUN apt-get install -y gcc-mingw-w64-i686 g++-mingw-w64-i686 yasm make automake autoconf git pkg-config libtool-bin
# Under construction
# geekgit linux_scripts_meta install
WORKDIR /root
RUN git clone https://github.com/geekgit/linux_scripts_meta
WORKDIR /root/linux_scripts_meta
RUN ./download-all.sh
WORKDIR /root
RUN adduser --disabled-password --gecos '' build
USER build
WORKDIR /home/build
RUN git clone https://github.com/rdp/ffmpeg-windows-build-helpers
WORKDIR /home/build/ffmpeg-windows-build-helpers
RUN ./quick_cross_compile_ffmpeg_fdk_aac_and_x264_using_packaged_mingw64.sh
ENTRYPOINT ["/bin/bash"]
