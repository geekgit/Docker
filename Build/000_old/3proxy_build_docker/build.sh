#!/bin/bash
ContainerName="3proxy_build_docker"
echo "building image..."
docker build -t $ContainerName $(pwd)
echo "starting container..."
ID=$(docker create $ContainerName)
echo "container id: $ID"
echo "docker copying files..."
mkdir $HOME/$ContainerName-share
docker cp $ID:/home/build/3proxy-opt.deb $HOME/$ContainerName-share/3proxy-opt.deb 
echo "docker removing container..."
docker rm -v $ID
echo "container removed."
