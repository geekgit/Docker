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
docker cp $ID:/home/build/rpp/rpp_r.gbc $HOME/$ContainerName-share/rpp_r.gbc
docker cp $ID:/home/build/rpp/rpp_b.gbc $HOME/$ContainerName-share/rpp_b.gbc
echo "go and checksum check"
cd "$HOME/$ContainerName-share"
geekgit-md5-calculate *.gbc
echo "return to old pwd..."
cd "$CurrPath"
echo "docker removing container..."
docker rm -v $ID
echo "container removed."
