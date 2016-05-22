#!/bin/bash
ContainerName="qemu_rpi_build_docker"
DebName="qemu-rpi.deb"
echo "building image..."
docker build -t $ContainerName $(pwd)
echo "starting container..."
ID=$(docker create $ContainerName)
echo "container id: $ID"
echo "docker copying files..."
mkdir $HOME/$ContainerName-share
docker cp $ID:/root/$DebName $HOME/$ContainerName-share/$DebName
echo "docker removing container..."
docker rm -v $ID
echo "container removed."
