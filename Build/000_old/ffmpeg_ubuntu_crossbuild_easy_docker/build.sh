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
docker cp $ID:/home/build/ffmpeg-windows-build-helpers/sandbox/win32/quick_install/install_root/ffmpeg_static_fdk_aac/bin/ffmpeg.exe $HOME/$ContainerName-share/ffmpeg.exe
docker cp $ID:/home/build/ffmpeg-windows-build-helpers/sandbox/win32/quick_install/install_root/ffmpeg_static_fdk_aac/bin/ffprobe.exe $HOME/$ContainerName-share/ffprobe.exe
docker cp $ID:/home/build/ffmpeg-windows-build-helpers/sandbox/win32/quick_install/install_root/bin/x264.exe $HOME/$ContainerName-share/x264.exe
echo "docker removing container..."
docker rm -v $ID
echo "container removed."
