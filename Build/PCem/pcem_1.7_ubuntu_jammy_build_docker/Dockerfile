FROM ubuntu:22.04
MAINTAINER geekgit
RUN apt-get update && apt-get upgrade -y && apt-get install -y software-properties-common
RUN apt-get install -y build-essential unzip wget gnupg git mercurial meld
RUN apt-get install -y autoconf automake build-essential
RUN apt-get install -y libsdl2-dev libalut-dev libopenal-dev
RUN apt-get install -y sudo
RUN apt-get install -y ninja-build cmake
RUN apt-get install -y libwxbase3.0-dev libwxgtk-media3.0-gtk3-dev libwxgtk-webview3.0-gtk3-dev libwxgtk3.0-gtk3-dev
RUN apt-get install -y uuid-runtime
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
ENV verA 17
ENV verB 1.7
RUN git clone --branch dev https://github.com/sarah-walker-pcem/pcem
WORKDIR /home/build/pcem
RUN git reset --hard 1a6e20b6d5ca77ba96982a5961b82df74a182cc3
RUN cmake -G "Ninja" -DCMAKE_BUILD_TYPE=Release .
RUN ninja
USER root
WORKDIR /root
ENV pcemName "pcem${verB}-opt"
RUN mkdir -p /root/${pcemName}/DEBIAN
RUN mkdir -p /root/${pcemName}/opt/${pcemName}/bin
WORKDIR /root/${pcemName}/DEBIAN
ADD control control
WORKDIR /root/${pcemName}/opt/${pcemName}/bin
RUN cp /home/build/pcem/src/pcem .
RUN chown root:root pcem
RUN chmod a+rx-w pcem
WORKDIR /root
RUN dpkg-deb --build ${pcemName}
RUN cp ${pcemName}.deb /home/build/
RUN chmod a+rwx /home/build/${pcemName}.deb
RUN chown build:build /home/build/${pcemName}.deb
WORKDIR /home/build
USER build
ENTRYPOINT ["/bin/bash"]
