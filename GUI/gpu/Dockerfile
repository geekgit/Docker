FROM ubuntu:18.04
MAINTAINER geekgit
RUN apt-get update && apt-get upgrade -y && apt-get install -y software-properties-common
RUN apt-get install -y build-essential unzip wget gnupg git sudo
RUN apt-get install -y mesa-utils
# geekgit linux_scripts_meta install
WORKDIR /root
RUN git clone https://github.com/geekgit/linux_scripts_meta
WORKDIR /root/linux_scripts_meta
RUN ./download-container.sh
#
RUN env DEBIAN_FRONTEND=noninteractive apt-get install -y keyboard-configuration
#
RUN add-apt-repository -y ppa:graphics-drivers/ppa
RUN apt-get install -y nvidia-driver-418
RUN adduser --disabled-password --gecos '' gpu
USER gpu
WORKDIR /home/gpu
RUN wget --secure-protocol=TLSv1_2 --https-only "https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/7fa2af80.pub" -O 7fa2af80.pub
USER root
RUN apt-key add 7fa2af80.pub
USER gpu
RUN wget --secure-protocol=TLSv1_2 --https-only "https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/cuda-repo-ubuntu1804_10.1.105-1_amd64.deb" -O cuda-repo.deb
USER root
RUN dpkg -i cuda-repo.deb
RUN apt-get update
RUN apt-get install -y cuda
USER gpu
WORKDIR /home/gpu
RUN git clone https://github.com/NVIDIA/cuda-samples
WORKDIR /home/gpu/cuda-samples/Samples/deviceQuery
RUN make -j$(nproc --all)
USER root
WORKDIR /
RUN apt-get install -y xterm
USER gpu
WORKDIR /home/gpu/cuda-samples/Samples/deviceQuery
ENTRYPOINT ["/bin/bash"]
