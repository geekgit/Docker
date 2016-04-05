#!/bin/bash
CurrPath=$(pwd)
echo "Path: $CurrPath"
Basename=${CurrPath##*/}
echo "Base name: $Basename"
ContainerName="$Basename"
echo "Container name: $ContainerName"
echo "building image..."
echo "docker build -t $Basename $CurrPath"
docker build -t $ContainerName $CurrPath
echo "starting container..."
ID=$(docker create $ContainerName)
echo "docker copying files..."
mkdir $HOME/$ContainerName-share
docker cp $ID:/home/build/gpg-verify.log $HOME/$ContainerName-share/gpg-verify.log
docker cp $ID:/home/build/configure.log $HOME/$ContainerName-share/configure.log
docker cp $ID:/root/nginx-opt.deb $HOME/$ContainerName-share/nginx-opt.deb 
echo "docker removing container..."
docker rm -v $ID
echo "container removed."
