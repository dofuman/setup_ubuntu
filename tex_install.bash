#!/bin/bash

echo "Start installation"
pwd_dir=$(cd $(dirname $0); pwd)

#Tex install
sudo apt update && sudo apt upgrade
sudo apt install -y texlive-lang-cjk
sudo apt install -y texlive-fonts-recommended
sudo apt install -y texlive-fonts-extra
sudo apt install -y xdvik-ja
sudo apt install -y dvipsk-ja
sudo apt install -y gv

# 他文書,図作成用ソフトもインストール
sudo apt install -y nkf
sudo apt install -y gnuplot
sudo apt install -y gnuplot-x11
sudo apt install -y gnuplot-doc
sudo apt install -y tgif
sudo apt install -y gimp
sudo apt install -y inkscape
sudo apt install -y mimetex
sudo apt install -y latexdiff

# .bashrcにexport PATH=$HOME/bin:$PATHを追記するこ.
dir=$HOME/bin
file=$dir/platex2pdf
if [ -e $dir ]; then
	if [ -e $file ]; then
		echo "$file found."
	else
		cp command_script/platex2pdf ~/bin && echo "$file is copied."
	fi	
else
	mkdir ~/bin
	cp command_script/platex2pdf ~/bin
fi

echo "Please add the following command to ~/.bashrc"
echo 'export PATH=$HOME/bin:$PATH'
