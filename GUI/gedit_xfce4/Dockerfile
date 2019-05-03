FROM ubuntu:18.04
MAINTAINER geekgit
RUN apt-get update && apt-get upgrade -y && apt-get install -y software-properties-common
RUN apt-get install -y build-essential sudo unzip wget curl git mesa-utils fonts-takao-mincho fonts-takao-gothic fonts-takao fonts-arphic-ukai fonts-arphic-uming fonts-ipafont-mincho fonts-ipafont-gothic fonts-unfonts-core
RUN apt-get install -y desktop-file-utils
RUN apt-get install -y fontconfig fontconfig-config libfontconfig1
RUN apt-get install -y gedit
RUN env DEBIAN_FRONTEND=noninteractive apt-get install -y keyboard-configuration
RUN env DEBIAN_FRONTEND=noninteractive apt-get install -y xfce4
RUN env DEBIAN_FRONTEND=noninteractive apt-get install -y language-pack-ru language-pack-gnome-ru language-pack-kde-ru
RUN update-locale LANG=ru_RU.UTF-8
RUN locale -a
WORKDIR /root
# geekgit linux_scripts_meta install
WORKDIR /root
RUN git clone https://github.com/geekgit/linux_scripts_meta
WORKDIR /root/linux_scripts_meta
RUN ./download-container.sh
RUN adduser --disabled-password --gecos '' gedit
USER gedit
WORKDIR /home/gedit
ENV USER gedit
ENV FONTCONFIG_PATH=/etc/fonts
ENV QT_XKB_CONFIG_ROOT=/usr/share/X11/xkb
#ENTRYPOINT ["/bin/bash"]
ENTRYPOINT ["/usr/bin/startxfce4"]

