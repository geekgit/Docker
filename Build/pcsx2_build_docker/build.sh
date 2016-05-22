#!/bin/bash
ContainerName="pcsx2_build_docker"
TarGzName="pcsx2-git.tar.gz"
echo "building image..."
docker build -t $ContainerName $(pwd)
echo "starting container..."
ID=$(docker create $ContainerName)
echo "container id: $ID"
echo "docker copying files..."
mkdir $HOME/$ContainerName-share
docker cp $ID:/home/build/pcsx2/$TarGzName $HOME/$ContainerName-share/$TarGzName
echo "docker removing container..."
docker rm -v $ID
echo "container removed."
