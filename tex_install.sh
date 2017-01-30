#!/bin/sh

echo "Start installation"
pwd_dir=$(cd $(dirname $0); pwd)

#Tex install
sudo apt -yV update && sudo apt -yV upgrade
sudo apt install --assume-yes texlive-lang-cjk
sudo apt install --assume-yes texlive-fonts-recommended
sudo apt install --assume-yes texlive-fonts-extra
sudo apt install --assume-yes xdvik-ja
sudo apt install --assume-yes dvipsk-ja
sudo apt install --assume-yes gv

# 他文書,図作成用ソフトもインストール
# .bashrcにexport PATH=$HOME/bin:$PATHを追記するこ.
sudo apt install 
mkdir -p ~/bin
cp script/platex2pdf ~/bin

echo "Please add the following command to ~/.bashrc"
echo "export PATH=$HOME/bin:$PATH"

 
 
