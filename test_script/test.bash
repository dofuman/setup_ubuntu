#!/bin/bash
pwd_dir=$(cd $(dirname $0); pwd)
echo "pwd_dir is $script_dir_path"

dir=$HOME/bin
file=$dir/platex2pdf
if [ -e $dir ]; then
	if [ -e $file ]; then
		echo "$file found."
	else
		cp command_script/platex2pdf ~/bin/ && echo "$file is copied."
	fi	
else
	mkdir ~/bin
	cp command_script/platex2pdf ~/bin
fi

echo "Please add the following command to ~/.bashrc"
echo 'export PATH=$HOME/bin:$PATH'
