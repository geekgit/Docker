FROM fedora:rawhide
MAINTAINER geekgit
RUN dnf update -y
RUN dnf install -y nano wget git
RUN useradd user
USER user
WORKDIR /home/user
ENTRYPOINT ["/bin/bash"]
