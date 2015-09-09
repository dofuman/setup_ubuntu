#!/bin/sh

git config --global user.name "nishidalab"
git congit --global user.email "nishidalab@example.com"
ssh-keygen -t rsa -C nishidalab@example.com

#パスフレーズなどは空でおk
# [Press enter] # about key directry
# [Press enter] # about passphrase
# [Press enter] # passphrase confirm

cat ~/.ssh/id_rsa.pub
