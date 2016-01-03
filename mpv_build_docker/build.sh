#!/bin/bash
ContainerName="mpv_build_docker"
BinName="mpv"
echo "building image..."
docker build -t $ContainerName ~/$ContainerName
echo "starting container..."
ID=$(docker create $ContainerName)
echo "container id: $ID"
echo "docker copying files..."
mkdir $HOME/$ContainerName-share
docker cp $ID:/home/build/mpv-build/mpv/build/$BinName $HOME/$ContainerName-share/$BinName
echo "docker removing container..."
docker rm -v $ID
echo "container removed."
