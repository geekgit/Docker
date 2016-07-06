#!/bin/bash
ContainerName="wine1.9_build_docker"
ArchiveName="wine1.9.11.tar.gz"
echo "building image..."
docker build -t $ContainerName $(pwd)
echo "starting container..."
ID=$(docker create $ContainerName)
echo "container id: $ID"
echo "docker copying files..."
mkdir $HOME/$ContainerName-share
docker cp $ID:/home/build/buffer.tar.gz $HOME/$ContainerName-share/$ArchiveName
cd "$HOME/$ContainerName-share"
echo "untar..."
tar -xvf "$ArchiveName"
echo "deleting tar archive"
rm "$ArchiveName"
echo "docker removing container..."
docker rm -v $ID
echo "container removed."
