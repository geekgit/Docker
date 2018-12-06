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
docker cp $ID:/home/build/Overchan-Android/build/outputs/apk/Overchan-Android-debug-unaligned.apk $HOME/$ContainerName-share/Overchan-Android-debug-unaligned.apk
docker cp $ID:/home/build/Overchan-Android/build/outputs/apk/Overchan-Android-debug.apk $HOME/$ContainerName-share/Overchan-Android-debug.apk
docker cp $ID:/home/build/Overchan-Android/build/outputs/apk/Overchan-Android-release-unsigned.apk $HOME/$ContainerName-share/Overchan-Android-release-unsigned.apk
echo "docker removing container..."
docker rm -v $ID
echo "container removed."
