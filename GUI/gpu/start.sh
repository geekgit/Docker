#!/bin/bash
# Xephyr
XPort=":9"
Xephyr "${XPort}" -extension MIT-SHM -ac -br -screen 1280x720 &
# docker
CurrPath=$(pwd)
echo "Path: $CurrPath"
Basename=${CurrPath##*/}
echo "Base name: $Basename"
ContainerName="$Basename"
echo "Container name: $ContainerName"
echo "building image..."
echo "docker build -t $Basename $CurrPath"
docker build -t $ContainerName $CurrPath
echo "starting container..."
docker run -ti --rm -e DISPLAY="${XPort}" -v /tmp/.X11-unix:/tmp/.X11-unix --device /dev/nvidia0:/dev/nvidia0 --device /dev/nvidiactl:/dev/nvidiactl --device /dev/nvidia-uvm:/dev/nvidia-uvm "$ContainerName" 
