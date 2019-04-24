FROM nvidia/opencl:devel-ubuntu16.04
MAINTAINER geekgit
RUN apt-get update && apt-get upgrade -y && apt-get install -y software-properties-common
RUN apt-get install -y build-essential unzip wget gnupg git sudo
RUN apt-get install -y mesa-utils
# geekgit linux_scripts_meta install
WORKDIR /root
RUN git clone https://github.com/geekgit/linux_scripts_meta
WORKDIR /root/linux_scripts_meta
RUN ./download-container-xenial.sh
RUN adduser --disabled-password --gecos '' opencl
USER opencl
WORKDIR /home/opencl
RUN git clone https://github.com/hashcat/hashcat
WORKDIR /home/opencl/hashcat
RUN git submodule update --init
RUN make -j$(nproc --all)
USER root
RUN make install
WORKDIR /home/opencl
ADD benchmark-md5.sh benchmark-md5.sh
ADD benchmark-sha256.sh benchmark-sha256.sh
RUN chmod a+rwx benchmark*.sh
RUN chown opencl:opencl benchmark*.sh
USER opencl
ENTRYPOINT ["/bin/bash"]
