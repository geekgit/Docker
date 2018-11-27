#!/bin/bash
CurrPath=$(pwd)
echo "Path: $CurrPath"
Basename=${CurrPath##*/}
echo "Base name: $Basename"
ContainerName="$Basename"
echo "Container name: $ContainerName"
dps=$(docker ps -q --filter ancestor="$ContainerName")
echo "dps: ${dps}"
if [[ "$dps" == "" ]]; then
	echo "NULL"
else
	echo "NOT NULL"
	docker stop "${dps}"
fi

