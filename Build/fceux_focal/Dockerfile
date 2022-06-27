FROM ubuntu:20.04
MAINTAINER geekgit
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get upgrade -y && apt-get install -y software-properties-common
RUN apt-get install -y build-essential unzip wget gnupg git mercurial meld
RUN apt-get install -y autoconf automake build-essential
RUN apt-get install -y libsdl2-dev libwxbase3.0-dev libwxgtk-media3.0-gtk3-dev libwxgtk-webview3.0-gtk3-dev libwxgtk3.0-gtk3-dev libalut-dev libopenal-dev
RUN apt-get install -y ninja-build cmake
RUN apt-get install -y sudo
RUN adduser --disabled-password --gecos '' build
USER build
WORKDIR /home/build
ENV verB -git
RUN git clone https://github.com/TASEmulators/fceux
WORKDIR /home/build/fceux
USER root
RUN apt-get install -y libqt5-ukui-style-dev libqt5charts5-dev libqt5gamepad5-dev libqt5networkauth5-dev libqt5pas-dev libqt5remoteobjects5-dev libqt5scxml5-dev libqt5sensors5-dev libqt5serialbus5-dev libqt5serialport5-dev libqt5svg5-dev libqt5texttospeech5-dev libqt5virtualkeyboard5-dev libqt5waylandclient5-dev libqt5waylandcompositor5-dev libqt5webchannel5-dev libqt5webkit5-dev libqt5websockets5-dev libqt5webview5-dev libqt5x11extras5-dev libqt5xdg-dev libqt5xdgiconloader-dev libqt5xmlpatterns5-dev libqtav-private-dev libqtdbusmock1-dev libqtdbustest1-dev libqtermwidget5-0-dev libqtest-ocaml-dev libqtpropertybrowser-dev libqtspell-qt5-dev qt5-default qt5keychain-dev qt5qevercloud-dev qtbase5-dev-tools qtbase5-doc-dev qtbase5-private-dev qtchooser qtconnectivity5-dev qtcreator qtdeclarative5-dev-tools qtdeclarative5-doc-dev qtdeclarative5-private-dev qtlocation5-dev qtlocation5-doc-dev qtpositioning5-dev qtquickcontrols2-5-dev qtscript5-dev qttools5-dev qttools5-dev-tools qttools5-private-dev qtwayland5-dev-tools qtwebengine5-dev qtwebengine5-dev-tools qtwebengine5-private-dev qtxdg-dev-tools qtxmlpatterns5-dev-tools
RUN apt-get install -y minizip libminizip-dev
USER build
RUN cmake -G "Ninja" -DCMAKE_BUILD_TYPE=Release .
RUN ninja
WORKDIR /home/build
USER build
ENTRYPOINT ["/bin/bash"]
