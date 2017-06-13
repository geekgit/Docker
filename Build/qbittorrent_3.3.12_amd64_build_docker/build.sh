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
docker cp $ID:/home/build/qbittorrent-3.3.12-opt.deb $HOME/$ContainerName-share/qbittorrent-3.3.12-opt.deb
docker cp $ID:/home/build/qbittorrent-3.3.12-opt.deb.md5 $HOME/$ContainerName-share/qbittorrent-3.3.12-opt.deb.md5
echo "go and checksum check"
cd "$HOME/$ContainerName-share"
md5sum -c qbittorrent-3.2.13-opt.deb.md5
echo "return to old pwd..."
cd "$CurrPath"
echo "docker removing container..."
docker rm -v $ID
echo "container removed."
