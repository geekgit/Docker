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
docker cp $ID:/home/build/android-adbm/app/build/outputs/apk/app-debug-unaligned.apk $HOME/$ContainerName-share/adb_manager-debug-unaligned.apk
docker cp $ID:/home/build/android-adbm/app/build/outputs/apk/app-release-unsigned.apk $HOME/$ContainerName-share/adb_manager-release-unsigned.apk
docker cp $ID:/home/build/android-adbm/app/build/outputs/apk/app-debug.apk $HOME/$ContainerName-share/adb_manager-debug.apk
echo "docker removing container..."
docker rm -v $ID
echo "container removed."
