#!/bin/bash
CurrPath=$(pwd)
echo "Path: $CurrPath"
Basename=${CurrPath##*/}
echo "Name: $Basename"
echo "docker run -ti --rm $Basename"
docker run -ti --rm -p 1935:1935 -p 8080:80 $Basename
