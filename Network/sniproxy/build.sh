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
docker cp $ID:/home/build/sniproxy_0.6.1_amd64.deb $HOME/$ContainerName-share/sniproxy_0.6.1_amd64.deb
echo "docker removing container..."
docker rm -v $ID
echo "container removed."
