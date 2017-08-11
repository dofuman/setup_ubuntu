#!/bin/sh

# for ubuntu 16.04

pwd_dir=$(dirname $(readlink -f $0))

#google chrome
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
sudo apt update
sudo apt install google-chrome-stable

# Dropbox
cd ~/Downloads/
wget -v https://www.dropbox.com/download?dl=packages/ubuntu/dropbox_2015.10.28_amd64.deb -O dropbox_2015.10.28_amd64.deb
sudo dpkg -i dropbox_2015.10.28_amd64.deb

sudo apt update
sudo apt install terminator

#terminator設定
gsettings set org.gnome.desktop.default-applications.terminal exec /usr/bin/terminator
gsettings set org.gnome.desktop.default-applications.terminal exec-arg "-x"
sudo update-alternatives --config x-terminal-emulator


#speed up compilation tools
sudo apt install cmake cmake-curses-gui

echo "indicators installation start."
#indicator-multiload
yes | sudo add-apt-repository ppa:indicator-multiload/stable-daily
#indicator-sensor
yes | sudo add-apt-repository ppa:dgadomski/indicator-sensors
#indicator-sound-switcher
yes | sudo apt-add-repository ppa:yktooo/ppa
sudo apt update
sudo apt install indicator-multiload
sudo apt install indicator-sensors
sudo apt install indicator-sound-switcher
