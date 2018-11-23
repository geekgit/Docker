FROM ubuntu:16.04
MAINTAINER geekgit
RUN echo "123"
RUN apt-get update && apt-get upgrade -y && apt-get install -y software-properties-common
RUN apt-get install -y build-essential unzip wget gnupg git sudo
RUN apt-get install -y tar p7zip p7zip-full p7zip-rar unrar
# geekgit linux_scripts_meta install
WORKDIR /root
RUN git clone https://github.com/geekgit/linux_scripts_meta
WORKDIR /root/linux_scripts_meta
RUN ./download-container-xenial.sh
WORKDIR /root
RUN apt-get update
RUN apt-get install -y libpng12-0
ADD waifu2x-cpp-opt.deb waifu2x-cpp-opt.deb
ADD waifu2x-opencv.deb waifu2x-opencv.deb
RUN dpkg -i waifu2x-opencv.deb
RUN dpkg -i waifu2x-cpp-opt.deb
RUN adduser --disabled-password --gecos '' waifu
USER waifu
WORKDIR /home/waifu
USER root
ADD input input
RUN chmod -R a+rwx ./input/
RUN chown -R waifu:waifu ./input/
USER waifu
RUN mkdir output
WORKDIR /home/waifu/input
RUN for f in *; do local-waifu $f; rm $f; done;
RUN mv *.* /home/waifu/output
WORKDIR /home/waifu/output
RUN ls -l
WORKDIR /home/waifu
RUN 7z a "output.7z" "output"
ENTRYPOINT ["/bin/bash"]
