#!/bin/bash
CurrPath=$(pwd)
echo "Path: $CurrPath"
Basename=${CurrPath##*/}
echo "Base name: $Basename"
ContainerName="$Basename"
docker build -t $ContainerName $CurrPath
docker run -ti --rm $ContainerName
