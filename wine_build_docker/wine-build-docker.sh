#!/bin/bash
docker run -ti --rm -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -v $HOME/Docker/Wine_Build:/home/build/share wine_build_docker "$@"
