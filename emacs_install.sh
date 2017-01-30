#!/bin/sh

# emacs25のインストール
pwd_dir=$(dirname $(readlink -f $0))

# emacs25.1のインストール
sudo apt -yV install build-essential checkinstall
sudo apt -y build-dep emacs24 libdbus-1-dev
cd ~
mkdir emacs && cd emacs 
wget http://ftp.gnu.org/gnu/emacs/emacs-25.1.tar.gz
tar -xf emacs-25.1.tar.gz
cd emacs-25.1
./autogen.sh
./configure
make -j $(($(nproc) + 1)) -l $(($(nproc) + 1))
sudo checkinstall
cd $pwd_dir
