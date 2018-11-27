FROM ubuntu:18.04
MAINTAINER geekgit
RUN apt-get update && apt-get upgrade -y && apt-get install -y software-properties-common
RUN apt-get install -y build-essential unzip wget gnupg git sudo
RUN apt-get install -y tar p7zip p7zip-full p7zip-rar unrar
# geekgit linux_scripts_meta install
WORKDIR /root
RUN git clone https://github.com/geekgit/linux_scripts_meta
WORKDIR /root/linux_scripts_meta
RUN ./download-container.sh
WORKDIR /root
RUN apt-get update
ENV DefaultFrontend "${DEBIAN_FRONTEND}"
ENV DEBIAN_FRONTEND noninteractive 
RUN apt-get install --assume-yes -y mono-complete
ENV DEBIAN_FRONTEND "${DefaultFrontend}"
RUN geekgit-tweak-set-utc-time
RUN adduser --disabled-password --gecos '' terraria
USER terraria
WORKDIR /home/terraria
ENV tver 4.3.25
RUN wget --secure-protocol=TLSv1_2 --https-only "https://github.com/Pryaxis/TShock/releases/download/v${tver}/tshock_${tver}.zip" -O "tshock_${tver}.zip"
RUN 7z x "tshock_${tver}.zip" -otshock
WORKDIR /home/terraria/tshock
RUN chmod u+rwx *.exe
WORKDIR /home/terraria
RUN mkdir -p world
WORKDIR /home/terraria/tshock
ENTRYPOINT ["mono", "--server", "--gc=sgen", "-O=all", "TerrariaServer.exe", "-configpath", "/home/terraria/world", "-worldpath", "/home/terraria/world", "-logpath", "/home/terraria/world"]
