#!/bin/bash

function abort
{
	echo "$@" 1>&2
	exit 1
}

# emacs25.2のインストール
pwd_dir=$(dirname $(readlink -f $0))
sudo apt install build-essential checkinstall || abort "enable dep-src"

# emacs24と25は同じ依存関係を持つ
sudo apt build-dep emacs24

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
sudo apt  install cmigemo ruby ruby-dev rbenv
sudo apt  install python3-pip
sudo pip3 install --upgrade pip
sudo pip3 install virtualenv
sudo apt  install libclang-dev clang

