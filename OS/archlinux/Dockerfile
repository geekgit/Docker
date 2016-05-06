FROM pritunl/archlinux
MAINTAINER geekgit
RUN pacman -Syu
RUN pacman -S --noconfirm nano wget git
RUN useradd user
USER user
WORKDIR /home/user
ENTRYPOINT ["/bin/bash"]
