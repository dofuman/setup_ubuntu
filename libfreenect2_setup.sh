#!/bin/sh
cd ~
sudo apt-get -y update
#libfreenect2の依存ライブラリ
sudo apt-get install -yV build-essential
sudo apt-get install -yV libturbojpeg
sudo apt-get install -yV libtool
sudo apt-get install -yV autoconf
sudo apt-get install -yV libudev-dev
sudo apt-get install -yV cmake
sudo apt-get install -yV mesa-common-dev
sudo apt-get install -yV freeglut3-dev
sudo apt-get install -yV libxrandr-dev
sudo apt-get install -yV doxygen
sudo apt-get install -yV libxi-dev


sudo ln -s /usr/lib/x86_64-linux-gnu/libturbojpeg.so.0 /usr/lib/x86_64-linux-gnu/libturbojpeg.so
git clone https://github.com/dofuman/libfreenect2.git

cd ~/libfreenect2/depends
./install_ubuntu.sh
cd ~/libfreenect2/build
mkdir linux && cd linux
cmake ~/libfreenect2/examples/protonect/ -DENABLE_CXX11=ON
make && sudo make install
cd ~/libfreenect2
sudo cp 90-kinect2.rules /etc/udev/rules.d/

#iai-kinect2 install
mkdir -p ~/kinect2_ws/src/
cd ~/kinect2_ws/src/
git clone https://github.com/code-iai/iai_kinect2.git
cd ~/kinect2_ws/src/iai_kinect2
rosdep install -r --from-paths .
cd ~/kinect2_ws
catkin_make -DCMAKE_BUILD_TYPE="Release"


