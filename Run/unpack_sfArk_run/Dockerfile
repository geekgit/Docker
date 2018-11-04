FROM ubuntu:18.04
MAINTAINER geekgit
RUN apt-get update && apt-get upgrade -y && apt-get install -y software-properties-common
RUN apt-get install -y build-essential sudo unzip wget
RUN apt-get install -y git
RUN apt-get install -y sfarkxtc
# geekgit linux_scripts_meta install
WORKDIR /root
RUN git clone https://github.com/geekgit/linux_scripts_meta
WORKDIR /root/linux_scripts_meta
RUN ./download-container.sh
RUN adduser --disabled-password --gecos '' user
USER user
WORKDIR /home/user
USER root
ADD input.sfArk input.sfArk
RUN chmod a+rw-x input.sfArk
RUN chown user:user input.sfArk
USER user
RUN sfarkxtc input.sfArk output.sf2
ENTRYPOINT ["/bin/bash"]
