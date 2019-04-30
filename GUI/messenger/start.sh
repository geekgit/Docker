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
mkdir -p ./messenger_data/home/messenger/data
mkdir -p ./messenger_data/home/messenger/.local
docker run -ti --rm -e DISPLAY="${XPort}" -v /tmp/.X11-unix:/tmp/.X11-unix -v $CurrPath/messenger_data/home/messenger/data:/home/messenger/data -v $CurrPath/messenger_data/home/messenger/.local:/home/messenger/.local "$ContainerName" 
