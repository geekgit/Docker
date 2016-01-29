#!/bin/bash
ContainerName="dnscrypt_build_docker"
echo "building image..."
docker build -t $ContainerName ~/$ContainerName
echo "starting container..."
ID=$(docker create $ContainerName)
echo "container id: $ID"
echo "docker copying files..."
mkdir $HOME/$ContainerName-share
docker cp $ID:/home/build/log.txt  $HOME/$ContainerName-share/log.txt
docker cp $ID:/root/dnscrypt-opt.deb $HOME/$ContainerName-share/dnscrypt-opt.deb
echo "docker removing container..."
docker rm -v $ID
echo "container removed."
