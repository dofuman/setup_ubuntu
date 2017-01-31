#!/bin/sh

# tlp install
yes | sudo add-apt-repository ppa:linrunner/tlp
sudo apt -yV update
sudo apt install tlp tlp-rdw

# for thinkpad x250

yes | sudo add-apt-repository ppa:morgwai/tpbat
sudo apt -yV update
sudo apt install tpacpi-bat

# battery configuration

echo "Current configuration is following."
sudo tpacpi-bat -g ST 1
sudo tpacpi-bat -g ST 2

echo "Battery will be charged from 75% to 85%"
sudo tpacpi-bat -s ST 1 75
sudo tpacpi-bat -s ST 2 75

sudo tpacpi-bat -s SP 1 85
sudo tpacpi-bat -s SP 2 85

echo "Configuration is finished. Please reboot."

