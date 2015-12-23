#!/bin/bash
ContainerName="wine1.8_build_docker"
ArchiveName="wine1.8.tar.gz"
echo "building image..."
docker build -t $ContainerName ~/$ContainerName
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
