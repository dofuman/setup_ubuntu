#!/bin/sh

# for laptop without graphic board

CURRENTDIR=$(dirname $(readlink -f $0))
echo "current directory is $CURRENTDIR"

mkdir /tmp/opencv
cd /tmp/opencv

echo "Install the dependencies..."
# Install the dependencies.
sudo apt install build-essential cmake git
sudo apt install build-essential pkg-config unzip ffmpeg qtbase5-dev python-dev python3-dev python-numpy python3-numpy
sudo apt install libopencv-dev libgtk-3-dev libdc1394-22 libdc1394-22-dev libjpeg-dev libpng12-dev libtiff5-dev libjasper-dev
sudo apt install libavcodec-dev libavformat-dev libswscale-dev libxine2-dev libgstreamer0.10-dev libgstreamer-plugins-base0.10-dev
sudo apt install libv4l-dev libtbb-dev libfaac-dev libmp3lame-dev libopencore-amrnb-dev libopencore-amrwb-dev libtheora-dev
sudo apt install libvorbis-dev libxvidcore-dev v4l-utils

# Download source code
git clone https://github.com/opencv/opencv.git
cd opencv
mkdir build
cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local -D WITH_TBB=ON -D WITH_V4L=ON -D WITH_QT=ON -D WITH_OPENGL=ON ..
make -j $(($(nproc) + 1)) -l $(($(nproc) + 1))

sudo make install
sudo /bin/bash -c 'echo "/usr/local/lib" > /etc/ld.so.conf.d/opencv.conf'
sudo ldconfig

echo "ALL installation has finished."
cd $CURRENTDIR
