#!/bin/bash
docker run -ti --rm -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -v $HOME/Docker/Wine:/home/user wine_docker "$@"