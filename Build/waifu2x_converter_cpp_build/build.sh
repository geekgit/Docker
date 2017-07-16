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
docker cp $ID:/home/build/waifu2x-converter-cpp/waifu2x-converter-cpp $HOME/$ContainerName-share/waifu2x-converter-cpp
docker cp $ID:/home/build/waifu2x-converter-cpp/opencv-install/lib/libopencv_imgcodecs.so.3.0.0 $HOME/$ContainerName-share/libopencv_imgcodecs.so.3.0
docker cp $ID:/home/build/waifu2x-converter-cpp/opencv-install/lib/libopencv_imgproc.so.3.0.0 $HOME/$ContainerName-share/libopencv_imgproc.so.3.0
docker cp $ID:/home/build/waifu2x-converter-cpp/opencv-install/lib/libopencv_core.so.3.0.0 $HOME/$ContainerName-share/libopencv_core.so.3.0
echo "md5"
cd "$HOME/$ContainerName-share"
geekgit-md5-calculate waifu2x-converter-cpp
geekgit-md5-calculate *.so.*
echo "return to old pwd..."
cd "$CurrPath"
echo "docker removing container..."
docker rm -v $ID
echo "container removed."
