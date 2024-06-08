FROM ubuntu:20.04
MAINTAINER geekgit
RUN apt-get update && apt-get upgrade -y && apt-get install -y software-properties-common
RUN apt-get install -y build-essential git make curl cmake
# user
RUN adduser --disabled-password --gecos '' build
USER build
WORKDIR /home/build
RUN echo "Hello, World!" > hello_world.txt
ENTRYPOINT ["/bin/bash"]
