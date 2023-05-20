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
docker cp $ID:/home/build/Open-PS2-Loader/opl_stripped.elf $HOME/$ContainerName-share/opl_stripped.elf
docker cp $ID:/home/build/Open-PS2-Loader/opl.elf $HOME/$ContainerName-share/opl.elf
echo "docker removing container..."
docker rm -v $ID
echo "container removed."
