#!/bin/sh

echo "Start installation"
pwd_dir=$(cd $(dirname $0); pwd)

#Tex install
sudo apt -y update && sudo apt -y upgrade
sudo apt install --assume-yes texlive-lang-cjk
sudo apt install --assume-yes texlive-fonts-recommended
sudo apt install --assume-yes texlive-fonts-extra
sudo apt install --assume-yes xdvik-ja
sudo apt install --assume-yes dvipsk-ja
sudo apt install --assume-yes gv

# 他文書,図作成用ソフトもインストール
sudo apt -yV install nkf
sudo apt -yV install gnuplot
sudo apt -yV install gnuplot-x11
sudo apt -yV install gnuplot-doc
sudo apt -yV install tgif
sudo apt -yV install gimp
sudo apt -yV install inkscape
sudo apt -yV install mimetex
sudo apt -yV install latexdiff
# .bashrcにexport PATH=$HOME/bin:$PATHを追記するこ.
sudo apt install 
mkdir -p ~/bin
cp command_script/platex2pdf ~/bin

echo "Please add the following command to ~/.bashrc"
echo "export PATH=$HOME/bin:$PATH"
