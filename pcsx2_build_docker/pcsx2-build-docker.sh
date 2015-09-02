#!/bin/bash
docker run -ti --rm -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -v $HOME/Docker/PCSX2_Build:/home/build/share pcsx2_build_docker "$@"
