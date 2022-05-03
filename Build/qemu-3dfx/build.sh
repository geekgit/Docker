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
echo "ID: ${ID}"
echo "docker copying files..."
mkdir $HOME/$ContainerName-share
docker cp $ID:/home/build/qemu-3dfx.tar.gz $HOME/$ContainerName-share/qemu-3dfx.tar.gz
docker cp $ID:/home/build/qemu-3dfx/build/qemu-system-i386 $HOME/$ContainerName-share/qemu-system-i386
echo "docker removing container..."
docker rm -v $ID
echo "container removed."
