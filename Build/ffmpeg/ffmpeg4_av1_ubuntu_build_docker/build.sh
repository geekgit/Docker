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
docker cp $ID:/home/build/ffmpeg4.2.2-av1-opt.deb $HOME/$ContainerName-share/ffmpeg4.2.2-av1-opt.deb
docker cp $ID:/home/build/gpg-check-log.txt $HOME/$ContainerName-share/gpg-check-log.txt
docker cp $ID:/home/build/configure-log.txt $HOME/$ContainerName-share/configure-log.txt
docker cp $ID:/home/build/ffmpeg-file-log.txt $HOME/$ContainerName-share/ffmpeg-file-log.txt
echo "docker removing container..."
docker rm -v $ID
echo "container removed."
