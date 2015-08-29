#!/bin/bash
xhost local:root
docker run -ti --rm -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -v /home/vivid/Docker/Firefox:/home/user firefox_docker "$@"
