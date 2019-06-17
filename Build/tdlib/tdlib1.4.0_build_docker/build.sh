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
docker cp $ID:/home/build/libtdjson.so.1.4.0 $HOME/$ContainerName-share/libtdjson.so.1.4.0
docker cp $ID:/home/build/tg_cli $HOME/$ContainerName-share/tg_cli
echo "docker removing container..."
docker rm -v $ID
echo "container removed."
