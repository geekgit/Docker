#!/bin/bash

OUTPUT_DIR="/usr/local/bin"
OUTPUT_PATH="$OUTPUT_DIR/pcsx2-build-docker"
SHARE_DIR="$HOME/Docker/PCSX2_Build"

echo "Building Docker image ..."
./build.sh > build_log.txt
echo "pcsx2-build-docker.sh -> $OUTPUT_PATH ..."
sudo cp pcsx2-build-docker.sh "$OUTPUT_PATH"
sudo chmod +x "$OUTPUT_PATH"
if [ -d "$SHARE_DIR" ]; then
	echo "$SHARE_DIR exists"
else
	echo "$SHARE_DIR doesn't exist"
	echo "creating $SHARE_DIR..."
	mkdir "$SHARE_DIR"
fi
