#!/bin/bash
sudo cp local-waifu /usr/local/bin
sudo chown root:root /usr/local/bin/local-waifu
sudo chmod a+rx-w /usr/local/bin/local-waifu

sudo cp waifu2x-converter-cpp /usr/local/bin
sudo chown root:root /usr/local/bin/waifu2x-converter-cpp
sudo chmod a+rx-w /usr/local/bin/waifu2x-converter-cpp

sudo cp libopencv_imgcodecs.so.3.0 /usr/lib
sudo chown root:root /usr/lib/libopencv_imgcodecs.so.3.0 
sudo chmod a+rx-w /usr/lib/libopencv_imgcodecs.so.3.0 

sudo cp libopencv_imgproc.so.3.0 /usr/lib
sudo chown root:root /usr/lib/libopencv_imgproc.so.3.0
sudo chmod a+rx-w /usr/lib/libopencv_imgproc.so.3.0

sudo cp libopencv_core.so.3.0 /usr/lib
sudo chown root:root /usr/lib/libopencv_core.so.3.0
sudo chmod a+rx-w /usr/lib/libopencv_core.so.3.0

sudo mkdir -p /opt/waifu/etc/models
sudo cp noise1_model.json /opt/waifu/etc/models
sudo cp noise2_model.json /opt/waifu/etc/models
sudo cp scale2.0x_model.json /opt/waifu/etc/models
sudo chown root:root /opt/waifu/etc/models/*.json
sudo chmod a+r-xw /opt/waifu/etc/models/*.json

