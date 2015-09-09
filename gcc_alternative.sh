#!/bin/sh

#gcc setup 4.6を使いたいときにどうぞ
sudo apt-get -yV install gcc-4.6
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.8 10
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.6 46
echo 'export CXX=/usr/bin/gcc-4.6' >> ~/.bashrc
