#!/bin/bash
ContainerName="dante_build_docker"
echo "building image..."
docker build -t $ContainerName $(pwd)
echo "starting container..."
ID=$(docker create $ContainerName)
echo "container id: $ID"
echo "docker copying files..."
mkdir $HOME/$ContainerName-share
docker cp $ID:/home/build/dante-server-opt.deb $HOME/$ContainerName-share/dante-server-opt.deb
echo "docker removing container..."
docker rm -v $ID
echo "container removed."
