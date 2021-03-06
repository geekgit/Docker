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
docker cp $ID:/home/build/version.txt $HOME/$ContainerName-share/version.txt
GitHash=$(cat $HOME/$ContainerName-share/version.txt | grep RedPlusPlus | awk '{print $3}' | awk -F# '{print $2}' | xargs)
echo "git hash: $GitHash"
docker cp $ID:/home/build/RedPlusPlus/pokeblue.gbc $HOME/$ContainerName-share/redplusplus_hard_git_$GitHash.gbc
docker cp $ID:/home/build/RedPlusPlus/pokered.gbc $HOME/$ContainerName-share/redplusplus_normal_git_$GitHash.gbc
docker cp $ID:/home/build/RedPlusPlus/pokeblue.gbc $HOME/$ContainerName-share/redplusplus_hard_git_$GitHash.gb
docker cp $ID:/home/build/RedPlusPlus/pokered.gbc $HOME/$ContainerName-share/redplusplus_normal_git_$GitHash.gb
echo "go and checksum check"
cd "$HOME/$ContainerName-share"
geekgit-md5-calculate *.gb
geekgit-md5-calculate *.gbc
echo "return to old pwd..."
cd "$CurrPath"
echo "docker removing container..."
docker rm -v $ID
echo "container removed."
