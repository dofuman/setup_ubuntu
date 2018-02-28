#!/bin/bash

function abort
{
	echo "$@" 1>&2
	exit 1
}

# emacs25.2のインストール
pwd_dir=$(dirname $(readlink -f $0))
sudo apt install -y build-essential checkinstall || abort "Please enable dep-src. Check /etc/apt/sources.list"

# emacs24と25は同じ依存関係を持つ
sudo apt build-dep emacs24

# 不足するパッケージをインストール
sudo apt install -y automake autoconf
sudo apt install -y libgtk2.0-dev libtiff5-dev libgif-dev libjpeg-dev libpng12-dev libxpm-dev libncurses-dev libclang-dev lsb lldb

cd ~
mkdir emacs && cd emacs 
wget http://ftp.gnu.org/gnu/emacs/emacs-25.2.tar.gz
tar -xf emacs-25.2.tar.gz
cd emacs-25.2
./autogen.sh
./configure
make -j $(($(nproc) + 1)) -l $(($(nproc) + 1))
sudo make install
cd $pwd_dir

# emacsで使う外部パッケージをインストール
sudo apt  install -y cmigemo ruby ruby-dev rbenv
sudo apt  install -y python3-pip
sudo apt  install -y libclang-dev clang
sudo pip3 install --upgrade pip
sudo pip3 install virtualenv

# cask 
sudo apt install -y curl
curl -fsSkL https://raw.github.com/cask/cask/master/go | python

