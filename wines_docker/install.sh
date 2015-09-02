#!/bin/bash

OUTPUT_DIR="/usr/local/bin"
OUTPUT_PATH="$OUTPUT_DIR/wine_docker"
SHARE_DIR="$HOME/Docker/Wine"

echo "Building Docker image ..."
./build.sh > build_log.txt
echo "wine-docker.sh -> $OUTPUT_PATH ..."
sudo cp wine-docker.sh "$OUTPUT_PATH"
sudo chmod +x "$OUTPUT_PATH"
if [ -d "$SHARE_DIR" ]; then
	echo "$SHARE_DIR exists"
else
	echo "$SHARE_DIR doesn't exist"
	echo "creating $SHARE_DIR..."
	mkdir "$SHARE_DIR"
fi
