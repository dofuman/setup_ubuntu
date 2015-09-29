#!/bin/sh
#キャッシュクリア
#usage: Place this file in $Path_dir 
echo 3 | sudo tee /proc/sys/vm/drop_caches
