#!/bin/sh

# for ubuntu 16.04

pwd_dir=$(dirname $(readlink -f $0))
echo "Installation starts ..."
#レポジトリの追加
#google chrome
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
sudo apt -y update
sudo apt -yV install google-chrome-stable

#更新確認
sudo apt -y update
sudo apt -y upgrade


#ccmake install
sudo apt -y update
sudo apt -yV cmake-curses-gui
sudo apt -yV install terminator
sudo apt -yV install gnuplot-x11

# 最初は前提ソフトウエアのインストール

#terminator設定
gsettings set org.gnome.desktop.default-applications.terminal exec /usr/bin/terminator
gsettings set org.gnome.desktop.default-applications.terminal exec-arg "-x"
sudo update-alternatives --config x-terminal-emulator

#その他 便利ツールインストール
sudo apt -y update

#speed up compilation tools
sudo apt install ccache
sudo apt install colorgcc


echo "indicators installation start."
#indicator-multiload
yes | sudo add-apt-repository ppa:indicator-multiload/stable-daily
#indicator-sensor
yes | sudo add-apt-repository ppa:dgadomski/indicator-sensors
#indicator-sound-switcher
yes | sudo apt-add-repository ppa:yktooo/ppa
sudo apt -y update
sudo apt -yV install indicator-multiload
sudo apt -yV install indicator-sensors
sudo apt -yV install indicator-sound-switcher
echo "ALL installation has been finished."
