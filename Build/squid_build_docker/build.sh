#!/bin/bash
ContainerName="squid_build_docker"
echo "building image..."
docker build -t $ContainerName $(pwd)
echo "starting container..."
ID=$(docker create $ContainerName)
echo "container id: $ID"
echo "docker copying files..."
mkdir $HOME/$ContainerName-share
docker cp $ID:/home/build/squid.tar.gz $HOME/$ContainerName-share/squid.tar.gz
echo "docker removing container..."
docker rm -v $ID
echo "container removed."
