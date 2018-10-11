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
docker cp $ID:/root/cpuminer-git.deb $HOME/$ContainerName-share/cpuminer-git.deb
echo "go and checksum check"
cd "$HOME/$ContainerName-share"
#md5sum -c cpuminer-git.deb.md5
echo "return to old pwd..."
cd "$CurrPath"
echo "docker removing container..."
docker rm -v $ID
echo "container removed."
