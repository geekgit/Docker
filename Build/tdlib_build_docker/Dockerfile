# Tested: 4 cores + 8 GB RAM + 4 GB swap
FROM ubuntu:16.04
MAINTAINER geekgit
RUN apt-get update && apt-get upgrade -y && apt-get install -y software-properties-common
RUN add-apt-repository -y ppa:ubuntu-toolchain-r/test
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y build-essential ccache cmake git gperf htop libreadline-dev libssl-dev openssl p7zip-full sudo tar unzip wget zlib1g-dev 
# gcc 8
RUN apt-get install -y gcc-8 g++-8 gcc-8-multilib g++-8-multilib
RUN update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-8 60 --slave /usr/bin/g++ g++ /usr/bin/g++-8
WORKDIR /root
RUN git clone https://github.com/geekgit/linux_scripts_meta
WORKDIR /root/linux_scripts_meta
RUN ./download-all.sh
WORKDIR /root
RUN adduser --disabled-password --gecos '' build
USER build
WORKDIR /home/build
ENV TdlibVersion 1.2.0
ENV TdlibArchive "v$TdlibVersion.zip"
ENV TdlibArchiveUrl "https://github.com/tdlib/td/archive/$TdlibArchive"
RUN wget --secure-protocol=TLSv1_2 --https-only "$TdlibArchiveUrl" -O "$TdlibArchive"
RUN unzip "$TdlibArchive" -d tdlib
WORKDIR /home/build/tdlib/td-$TdlibVersion
RUN mkdir build
WORKDIR /home/build/tdlib/td-$TdlibVersion/build
RUN cmake -DCMAKE_BUILD_TYPE=Release ..
RUN cmake --build . -- -j $(expr $(nproc --all) / 2)
WORKDIR /home/build/tdlib/td-$TdlibVersion
RUN 7z a -t7z -mx9 tdlib.7z build
RUN mv tdlib.7z /home/build
ENTRYPOINT ["/bin/bash"]
