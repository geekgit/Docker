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
docker cp $ID:/home/build/adaway/app/build/outputs/apk/release/app-release-unsigned.apk $HOME/$ContainerName-share/adaway-release-unsigned.apk
docker cp $ID:/home/build/adaway/app/build/outputs/apk/debug/app-debug-unsigned.apk $HOME/$ContainerName-share/adaway-debug-unsigned.apk
echo "docker removing container..."
docker rm -v $ID
echo "container removed."
