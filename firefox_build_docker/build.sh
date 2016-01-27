#!/bin/bash
ContainerName="firefox_build_docker"
docker build -t $ContainerName ~/$ContainerName
