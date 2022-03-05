FROM ubuntu:18.04
MAINTAINER geekgit
RUN apt-get update && apt-get upgrade -y && apt-get install -y software-properties-common
RUN apt-get install -y autoconf automake bison build-essential flex gcc git gnupg libpng-dev make pkg-config python python-setuptools sudo unzip wget yasm
RUN apt-get install -y python-pip
RUN pip install pypng
# user
RUN adduser --disabled-password --gecos '' build
USER build
WORKDIR /home/build
RUN git clone https://github.com/bentley/rgbds
WORKDIR /home/build/rgbds
RUN git submodule init
RUN git submodule update
USER root
RUN make install
USER build
WORKDIR /home/build
#RUN git clone --recursive https://github.com/TheFakeMateo/RedPlusPlus
RUN git clone --recursive https://github.com/JustRegularLuna/rpp-backup
RUN mv rpp-backup RedPlusPlus
WORKDIR /home/build/RedPlusPlus
RUN git submodule init
RUN git submodule update
RUN make
WORKDIR /home/build
ENTRYPOINT ["/bin/bash"]
