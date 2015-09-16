#!/bin/sh
script_dir_path=$(dirname $(readlink -f $0))
echo "pwd_dir is $script_dir_path"
cd /tmp/
pwd
cd $script_dir_path
pwd
