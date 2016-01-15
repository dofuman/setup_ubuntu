#!/bin/bash

pwd_dir=$(dirname $(readlink -f $0))
echo "current directory is  $pwd_dir"

echo "こちらでよろしいですか？ [Y/n]"
read ANSWER

ANSWER=`echo $ANSWER | tr y Y | tr -d '[\[\]]'`
#echo $ANSWER
case $ANSWER in
    ""|Y* ) echo "YES!!";;
    *  ) echo "NO!!";;
esac
