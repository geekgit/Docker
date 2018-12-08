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
docker cp $ID:/home/build/Anki-Android/AnkiDroid/build/outputs/apk/release/AnkiDroid-release-unsigned.apk $HOME/$ContainerName-share/AnkiDroid-release-unsigned.apk
docker cp $ID:/home/build/Anki-Android/AnkiDroid/build/outputs/apk/debug/AnkiDroid-debug.apk $HOME/$ContainerName-share/AnkiDroid-debug.apk
echo "docker removing container..."
docker rm -v $ID
echo "container removed."
