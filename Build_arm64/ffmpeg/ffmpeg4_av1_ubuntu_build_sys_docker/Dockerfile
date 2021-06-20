FROM ubuntu:20.04
MAINTAINER geekgit
RUN apt-get update && apt-get upgrade -y && apt-get install -y software-properties-common
RUN apt-get install -y build-essential unzip wget gnupg git
RUN apt-get install -y autoconf automake build-essential libass-dev libfreetype6-dev libsdl1.2-dev libtheora-dev libtool libva-dev libvdpau-dev libvorbis-dev libxcb1-dev libxcb-shm0-dev libxcb-xfixes0-dev pkg-config texinfo zlib1g-dev
RUN apt-get install -y yasm libx264-dev cmake mercurial libmp3lame-dev libopus-dev libvpx-dev
RUN apt-get install -y sudo
# Under construction
# geekgit linux_scripts_meta install
#WORKDIR /root
#RUN git clone https://github.com/geekgit/linux_scripts_meta
#WORKDIR /root/linux_scripts_meta
#RUN ./download-container.sh
WORKDIR /root
# x265 & fdk
#RUN apt-get install -y libx265-dev libfdk-aac-dev

#RUN apt-get -y install dkms
#RUN adduser --disabled-password --gecos '' build
#USER build
#WORKDIR /home/build
# ffmpeg key
#USER build
#RUN gpg --keyserver hkps://keyserver.ubuntu.com:443 --recv-keys 0xD67658D8
#ENV digitVersion 4.2.2
#ENV ffmpegVersion ffmpeg-$digitVersion
#RUN wget --secure-protocol=TLSv1_2 --https-only https://ffmpeg.org/releases/$ffmpegVersion.tar.gz -O $ffmpegVersion.tar.gz
#RUN wget --secure-protocol=TLSv1_2 --https-only https://ffmpeg.org/releases/$ffmpegVersion.tar.gz.asc -O $ffmpegVersion.tar.gz.asc
#RUN gpg --verify $ffmpegVersion.tar.gz.asc $ffmpegVersion.tar.gz 2> /home/build/gpg-check-log.txt
#RUN tar zvxf $ffmpegVersion.tar.gz
# headers
#RUN git clone https://git.videolan.org/git/ffmpeg/nv-codec-headers
#WORKDIR /home/build/nv-codec-headers
#RUN make -j$(nproc --all)
#USER root
#RUN make install
#USER build
#WORKDIR /home/build/$ffmpegVersion
#USER root
#RUN add-apt-repository -y ppa:mc3man/mpv-tests && apt-get update && apt-get upgrade -y
#RUN apt-get install -y libdav1d-dev
#USER build
#RUN ./configure --prefix=/opt/$ffmpegVersion-av1-opt --pkg-config-flags="--static" --libdir=/usr/local/lib --enable-static --disable-shared \
#--enable-gpl --enable-nonfree --enable-libx264 --enable-libfdk-aac \
#--enable-libmp3lame --enable-libass --enable-libfreetype \
#--enable-runtime-cpudetect --enable-libdav1d 1>/home/build/configure-log.txt
#RUN cat /home/build/gpg-check-log.txt
#RUN cat /home/build/configure-log.txt
#RUN make -j$(nproc --all)
#RUN file ffmpeg 1> /home/build/ffmpeg-file-log.txt
#RUN cat /home/build/ffmpeg-file-log.txt
#USER root
#RUN make install
# build deb
#WORKDIR /root
#ADD control /root/control
#RUN mkdir /root/opt
#RUN mv /opt/$ffmpegVersion-av1-opt /root/opt/
#RUN geekgit-devel-create-deb /root/opt /root/control
#RUN chown build:build /root/ffmpeg$digitVersion-av1-opt.deb
#RUN chmod a+rw-x /root/ffmpeg$digitVersion-av1-opt.deb
#RUN cp /root/ffmpeg$digitVersion-av1-opt.deb /home/build
#USER build
#WORKDIR /home/build
ENTRYPOINT ["/bin/bash"]
