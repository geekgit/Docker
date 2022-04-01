FROM ubuntu:16.04
MAINTAINER geekgit
RUN apt-get update && apt-get upgrade -y && apt-get install -y software-properties-common
RUN apt-get install -y build-essential unzip wget gnupg git
RUN apt-get install -y autoconf automake
RUN apt-get install -y git dialog pyqt4-dev-tools libusb-dev libjack-dev libbluetooth-dev python-dbus
RUN apt-get install -y sudo
RUN adduser --disabled-password --gecos '' build
USER build
WORKDIR /home/build
RUN git clone https://github.com/geekgit/qtsixa
WORKDIR /home/build/qtsixa
RUN make -j$(nproc --all)
#RUN make -j$(nproc --all) &>> /home/build/log.txt
ENTRYPOINT ["/bin/bash"]
