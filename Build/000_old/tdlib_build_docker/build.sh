#!/bin/bash
ContainerName="tdlib_build_docker"
echo "building image..."
docker build -t $ContainerName $(pwd)
echo "starting container..."
ID=$(docker create $ContainerName)
echo "container id: $ID"
echo "docker copying files..."
mkdir $HOME/$ContainerName-share
docker cp $ID:/home/build/tdlib.7z $HOME/$ContainerName-share/tdlib.7z
echo "docker removing container..."
docker rm -v $ID
echo "container removed."
