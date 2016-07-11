#!/bin/bash
CurrPath=$(pwd)
echo "Path: $CurrPath"
Basename=${CurrPath##*/}
echo "Name: $Basename"
echo "docker run -ti --rm $Basename"
docker build -t $Basename $CurrPath
docker run -ti --rm -p 6697 $Basename
