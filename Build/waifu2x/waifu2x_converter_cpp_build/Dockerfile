FROM ubuntu:16.04
MAINTAINER geekgit
RUN apt-get update && apt-get upgrade -y && apt-get install -y software-properties-common
RUN apt-get install -y autoconf automake bison build-essential flex gcc git gnupg libpng12-dev make pkg-config python python-setuptools sudo unzip wget yasm
RUN apt-get install -y cmake 
# geekgit linux_scripts_meta install
WORKDIR /root
RUN git clone https://github.com/geekgit/linux_scripts_meta
WORKDIR /root/linux_scripts_meta
RUN ./download-container-xenial.sh
# user
RUN adduser --disabled-password --gecos '' build
WORKDIR /home/build
USER build
RUN git clone https://github.com/khws4v1/waifu2x-converter-cpp
WORKDIR /home/build/waifu2x-converter-cpp
RUN ./build.sh
USER root
WORKDIR /root
RUN mkdir -p /root/waifu2x-cpp-opt/usr/local/bin
RUN mkdir -p /root/waifu2x-cpp-opt/opt/waifu2x-cpp-opt/etc/models
RUN mkdir -p /root/waifu2x-cpp-opt/opt/waifu2x-cpp-opt/bin
RUN mkdir -p /root/waifu2x-cpp-opt/DEBIAN
WORKDIR /root/waifu2x-cpp-opt/DEBIAN
ADD control_waifu control
WORKDIR /root/waifu2x-cpp-opt/usr/local/bin
ADD local-waifu local-waifu
RUN chmod a+rx-w local-waifu
RUN chown root:root local-waifu
WORKDIR /root/waifu2x-cpp-opt/opt/waifu2x-cpp-opt/etc/models
RUN cp /home/build/waifu2x-converter-cpp/models/noise1_model.json .
RUN cp /home/build/waifu2x-converter-cpp/models/noise2_model.json .
RUN cp /home/build/waifu2x-converter-cpp/models/scale2.0x_model.json .
RUN chmod a+r-wx *.json
RUN chown root:root *.json
WORKDIR /root/waifu2x-cpp-opt/opt/waifu2x-cpp-opt/bin
RUN cp /home/build/waifu2x-converter-cpp/waifu2x-converter-cpp .
RUN chmod a+rx-w waifu2x-converter-cpp
RUN chown root:root waifu2x-converter-cpp
WORKDIR /root
RUN dpkg-deb --build waifu2x-cpp-opt
RUN cp waifu2x-cpp-opt.deb /home/build/waifu2x-cpp-opt.deb
RUN chown build:build /home/build/waifu2x-cpp-opt.deb
RUN chmod a+rwx /home/build/waifu2x-cpp-opt.deb
RUN mkdir -p /root/waifu2x-opencv/DEBIAN
WORKDIR /root/waifu2x-opencv/DEBIAN
ADD control_opencv control
#ADD links_opencv waifu2x-opencv.links
RUN mkdir -p /root/waifu2x-opencv/lib
WORKDIR /root/waifu2x-opencv/lib
RUN cp /home/build/waifu2x-converter-cpp/opencv-install/lib/libopencv_imgcodecs.so.3.0.0 libopencv_imgcodecs.so.3.0
RUN cp /home/build/waifu2x-converter-cpp/opencv-install/lib/libopencv_imgproc.so.3.0.0 libopencv_imgproc.so.3.0
RUN cp /home/build/waifu2x-converter-cpp/opencv-install/lib/libopencv_core.so.3.0.0 libopencv_core.so.3.0
RUN cp /home/build/waifu2x-converter-cpp/opencv-install/lib/libopencv_imgcodecs.so.3.0.0 .
RUN cp /home/build/waifu2x-converter-cpp/opencv-install/lib/libopencv_imgproc.so.3.0.0 .
RUN cp /home/build/waifu2x-converter-cpp/opencv-install/lib/libopencv_core.so.3.0.0 .
RUN chmod a+rx-w *.so.*
RUN chown root:root *.so.*
WORKDIR /root
RUN dpkg-deb --build waifu2x-opencv
RUN cp waifu2x-opencv.deb /home/build/waifu2x-opencv.deb
RUN chown build:build /home/build/waifu2x-opencv.deb
RUN chmod a+rwx /home/build/waifu2x-opencv.deb
WORKDIR /home/build
USER build
ENTRYPOINT ["/bin/bash"]
