FROM ubuntu:16.04
MAINTAINER geekgit
RUN apt-get update && apt-get upgrade -y && apt-get install -y software-properties-common
RUN apt-get install -y build-essential unzip wget gnupg git
RUN apt-get install -y autoconf automake build-essential libass-dev libfreetype6-dev libsdl1.2-dev libtheora-dev libtool libva-dev libvdpau-dev libvorbis-dev libxcb1-dev libxcb-shm0-dev libxcb-xfixes0-dev pkg-config texinfo zlib1g-dev
RUN apt-get install -y yasm libx264-dev cmake mercurial libmp3lame-dev libopus-dev libvpx-dev
RUN apt-get install -y sudo
# Under construction
# geekgit linux_scripts_meta install
WORKDIR /root
RUN git clone https://github.com/geekgit/linux_scripts_meta
WORKDIR /root/linux_scripts_meta
RUN ./download-all.sh
WORKDIR /root
RUN add-apt-repository multiverse
# mpv/ffmpeg ppa
RUN geekgit-install-ppa-mpv-xenial
# x265 & fdk
RUN apt-get install -y libx265-dev libfdk-aac-dev
# nv stuff
RUN apt-get -y install dkms
# cuda.run from nv dev site
ENV CudaUrl http://developer.download.nvidia.com/compute/cuda/7.5/Prod/local_installers/cuda_7.5.18_linux.run
RUN wget $CudaUrl -O cuda.run
RUN chmod +x cuda.run
RUN ./cuda.run --silent --override --toolkit --samples --no-opengl-libs --verbose
ENV NvencUrl http://developer.download.nvidia.com/assets/cuda/files/nvidia_video_sdk_6.0.1.zip
RUN wget http://developer.download.nvidia.com/assets/cuda/files/nvidia_video_sdk_6.0.1.zip -O nv-enc-sdk.zip
RUN unzip nv-enc-sdk.zip
RUN find . -type f -name "nv*.h" -exec cp {} /usr/include \;
RUN find . -type f -name "Nv*.h" -exec cp {} /usr/include \;
RUN adduser --disabled-password --gecos '' build
USER build
WORKDIR /home/build
# ffmpeg key
RUN gpg --keyserver x-hkp://pool.sks-keyservers.net --recv-keys 0xD67658D8
ENV ffmpegVersion ffmpeg-3.0.2
RUN wget --secure-protocol=TLSv1_2 --https-only https://ffmpeg.org/releases/$ffmpegVersion.tar.gz -O $ffmpegVersion.tar.gz
RUN wget --secure-protocol=TLSv1_2 --https-only https://ffmpeg.org/releases/$ffmpegVersion.tar.gz.asc -O $ffmpegVersion.tar.gz.asc
RUN gpg --verify $ffmpegVersion.tar.gz.asc $ffmpegVersion.tar.gz 2> /home/build/gpg-check-log.txt
RUN tar zvxf $ffmpegVersion.tar.gz
WORKDIR /home/build/$ffmpegVersion
RUN ./configure --prefix=/opt/$ffmpegVersion-opt --enable-gpl --enable-nonfree --enable-libx264 --enable-libx265 --enable-libfdk-aac \
--enable-libmp3lame --enable-libass --enable-libfreetype --enable-nvenc 1> /home/build/configure-log.txt
RUN cat /home/build/gpg-check-log.txt
RUN cat /home/build/configure-log.txt
RUN make -j8
RUN file ffmpeg 1> /home/build/ffmpeg-file-log.txt
RUN cat /home/build/ffmpeg-file-log.txt
USER root
RUN make install
# build deb
WORKDIR /root
ADD control /root/control
RUN mkdir /root/opt
RUN mv /opt/$ffmpegVersion-opt /root/opt/
RUN geekgit-devel-create-deb /root/opt /root/control
RUN chmod a+rx-w /root/ffmpeg-opt.deb
RUN cp /root/ffmpeg-opt.deb /home/build
USER build
WORKDIR /home/build
ENTRYPOINT ["/bin/bash"]
