FROM ubuntu:18.04
MAINTAINER geekgit
RUN apt-get update && apt-get upgrade -y && apt-get install -y software-properties-common
RUN apt-get install -y build-essential unzip wget gnupg git sudo cmake
RUN apt-get install -y libboost-dev libsdl1.2-dev libsdl-mixer1.2-dev libsdl-image1.2-dev libsdl-gfx1.2-dev libyaml-cpp-dev
RUN apt-get install -y --no-install-recommends xmlto
# geekgit linux_scripts_meta install
WORKDIR /root
RUN git clone https://github.com/geekgit/linux_scripts_meta
WORKDIR /root/linux_scripts_meta
RUN ./download-container.sh
WORKDIR /root
RUN adduser --disabled-password --gecos '' build
USER build
WORKDIR /home/build
RUN git clone https://github.com/geekgit/yaml-cpp
WORKDIR /home/build/yaml-cpp
RUN mkdir build
WORKDIR /home/build/yaml-cpp/build
RUN cmake .. -DCMAKE_BUILD_TYPE=Release -DYAML_CPP_BUILD_CONTRIB=OFF -DYAML_CPP_BUILD_TESTS=OFF -DYAML_CPP_BUILD_TOOLS=OFF
USER root
RUN make install
USER build
WORKDIR /home/build
RUN git clone --single-branch --branch oxce-plus https://github.com/geekgit/OpenXcom/
WORKDIR /home/build/OpenXcom
RUN mkdir build
WORKDIR /home/build/OpenXcom/build
RUN cmake .. -DCMAKE_BUILD_TYPE=Release -DDEV_BUILD=OFF -DBUILD_PACKAGE=OFF
RUN make -j$(nproc --all)
WORKDIR /home/build/OpenXcom/build/bin
RUN echo "#!/bin/bash" > install-dev-deps.sh
RUN echo "sudo apt-get update && sudo apt-get upgrade -y && sudo apt-get install -y libboost-dev libsdl1.2-dev libsdl-mixer1.2-dev libsdl-image1.2-dev libsdl-gfx1.2-dev libyaml-cpp-dev" >> install-dev-deps.sh
RUN chmod a+rwx install-dev-deps.sh
RUN tar -zcvf /home/build/oxce.tar.gz *
ENTRYPOINT ["/bin/bash"]
