#!/bin/bash

echo "Start installation"
pwd_dir=$(cd $(dirname $0); pwd)

#Tex install
sudo apt update && sudo apt upgrade
sudo apt install texlive-lang-cjk
sudo apt install texlive-fonts-recommended
sudo apt install texlive-fonts-extra
sudo apt install xdvik-ja
sudo apt install dvipsk-ja
sudo apt install gv

# 他文書,図作成用ソフトもインストール
sudo apt install nkf
sudo apt install gnuplot
sudo apt install gnuplot-x11
sudo apt install gnuplot-doc
sudo apt install tgif
sudo apt install gimp
sudo apt install inkscape
sudo apt install mimetex
sudo apt install latexdiff

# .bashrcにexport PATH=$HOME/bin:$PATHを追記するこ.
dir = $HOME/bin
file = $dir/platex2pdf
if [ -e $dir ]; then
	if [ -e $file ]; then
		echo "$file found."
	else
		cp command_script/platex2pdf ~/$dir/ && echo "$file is copied."
	fi	
else
	mkdir ~/bin
	cp command_script/platex2pdf ~/bin
fi

echo "Please add the following command to ~/.bashrc"
echo "export PATH=$HOME/bin:$PATH"
