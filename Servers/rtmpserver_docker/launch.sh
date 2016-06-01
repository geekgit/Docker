#!/bin/bash
# NOTE: tmpfs -> Docker 1.10+
CurrPath=$(pwd)
echo "Path: $CurrPath"
Basename=${CurrPath##*/}
echo "Name: $Basename"
echo "docker run -ti --rm $Basename"
docker run -ti --rm --tmpfs /tmp -p 1935:1935 -p 8080:80 $Basename
