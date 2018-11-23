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
docker cp $ID:/home/build/waifu2x-cpp-opt.deb $HOME/$ContainerName-share/waifu2x-cpp-opt.deb
docker cp $ID:/home/build/waifu2x-opencv.deb $HOME/$ContainerName-share/waifu2x-opencv.deb
echo "docker removing container..."
docker rm -v $ID
echo "container removed."
