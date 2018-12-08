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
docker cp $ID:/home/build/filemanager/FileManager/build/outputs/apk/release/home/build/filemanager/FileManager/build/outputs/apk/release/FileManager-release-unsigned-2.2.3.apk $HOME/$ContainerName-share/FileManager-release-unsigned-2.2.3.apk
docker cp $ID:/home/build/filemanager/FileManager/build/outputs/apk/debug/home/build/filemanager/FileManager/build/outputs/apk/debug/FileManager-debug-2.2.3.apk $HOME/$ContainerName-share/FileManager-debug-2.2.3.apk
echo "docker removing container..."
docker rm -v $ID
echo "container removed."
