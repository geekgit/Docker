FROM debian:sid
MAINTAINER geekgit
RUN apt-get update && apt-get upgrade -y && apt-get install -y software-properties-common
RUN apt-get install -y tar p7zip p7zip-full git sudo wget
# geekgit linux_scripts_meta install
WORKDIR /root
RUN git clone https://github.com/geekgit/linux_scripts_meta
WORKDIR /root/linux_scripts_meta
RUN ./download-lite.sh
# screenfetch
RUN wget  --secure-protocol=TLSv1_3 --https-only https://raw.githubusercontent.com/KittyKatt/screenFetch/master/screenfetch-dev -O screenfetch-dev
RUN cp screenfetch-dev /usr/local/bin/screenfetch-dev
RUN chown root:root /usr/local/bin/screenfetch-dev
RUN chmod a+rx-w /usr/local/bin/screenfetch-dev
RUN rm screenfetch-dev
# user
RUN adduser --disabled-password --gecos '' sid
USER sid
WORKDIR /home/sid
RUN mkdir fceux
WORKDIR /home/sid/fceux
RUN apt-get download fceux
WORKDIR /home/sid
RUN geekgit-7z-each-directory-to-separate-archive
ENTRYPOINT ["/bin/bash"]
