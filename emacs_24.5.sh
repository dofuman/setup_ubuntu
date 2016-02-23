#!/bin/sh

# emacs24のインストール
pwd_dir=$(dirname $(readlink -f $0))

sudo apt-get -yV install build-essential
sudo apt-get -y build-dep emacs24
cd ~/Downloads
wget http://ftp.gnu.org/gnu/emacs/emacs-24.5.tar.gz
tar -xf emacs-24.5.tar.gz
cd emacs-24.5
./configure
make -j -l
sudo make install
cd ~
