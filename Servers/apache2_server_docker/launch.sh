#!/bin/bash
CurrPath=$(pwd)
echo "Path: $CurrPath"
Basename=${CurrPath##*/}
echo "Name: $Basename"
echo "docker run -ti --rm $Basename"
docker run -ti --rm -p 8081:80 $Basename
