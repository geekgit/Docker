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
docker cp $ID:/home/user/input.sfArk $HOME/$ContainerName-share/input.sfArk
docker cp $ID:/home/user/output.sf2 $HOME/$ContainerName-share/output.sf2
echo "docker removing container..."
docker rm -v $ID
echo "container removed."
