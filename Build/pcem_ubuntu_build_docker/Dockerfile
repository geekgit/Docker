FROM ubuntu:18.04
MAINTAINER geekgit
RUN apt-get update && apt-get upgrade -y && apt-get install -y software-properties-common
RUN apt-get install -y build-essential unzip wget gnupg git mercurial meld
RUN apt-get install -y autoconf automake build-essential
RUN apt-get install -y libsdl2-dev libwxbase3.0-dev libwxgtk-media3.0-dev libwxgtk-media3.0-gtk3-dev libwxgtk-webview3.0-gtk3-dev libwxgtk3.0-dev libwxgtk3.0-gtk3-dev libalut-dev libopenal-dev
RUN apt-get install -y sudo
# Under construction
# geekgit linux_scripts_meta install
WORKDIR /root
RUN git clone https://github.com/geekgit/linux_scripts_meta
WORKDIR /root/linux_scripts_meta
RUN ./download-container.sh
WORKDIR /root
RUN adduser --disabled-password --gecos '' build
USER build
WORKDIR /home/build
RUN hg clone "https://bitbucket.org/pcem_emulator/pcem"
WORKDIR /home/build/pcem
RUN autoreconf -i
RUN echo "configure log" > /home/build/configure.log
RUN ./configure >> /home/build/configure.log
RUN make -j$(nproc --all)
RUN ls -l
ENTRYPOINT ["/bin/bash"]
