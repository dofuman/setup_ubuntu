#!/bin/sh
# trackpointのスピード調整
# 参考: https://nrvale0.github.io/posts/2016/07/ubuntu-trackpoint-sensitivity/

if [ -f /etc/tmpfiles.d/trackpoint.conf ]; then
	echo "trackpoint.conf already exists."
	exit 1
fi

if [ -f $PWD/config/trackpoint.conf ]; then
	sudo cp $PWD/config/trackpoint.conf
	sudo systemd-tmpfiles --prefix=/sys --create
fi	

