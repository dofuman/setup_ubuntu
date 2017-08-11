#!/bin/sh
#Gitを使えるようにするまで

sudo apt update && sudo apt upgrade
sudo apt install git ssh

# ここは適宜変更して実行すること
# ユーザ名とメールアドレスを設定
git config --global user.name "your name"
git congit --global user.email "your@email.address"

# SSH鍵の生成
#パスフレーズも設定する Github.comも推奨している.
#鍵の生成場所と名前も設定する.
#デフォルトだと"~/.ssh/id_rsa"となる "~/.ssh/id_rsa_github"
#などすると管理しやすくなる.
ssh-keygen -t rsa -b 4096 -C "your@email.address"

#生成後,秘密鍵の権限を"600"に設定する.
chmod 600 ~/.ssh/id_rsa

#以下の設定をconfigに記述する.
nano ~/.ssh/config

"Host github
	  HostName github.com
	  User git
	  IdentityFile ~/.ssh/id_rsa"

cat ~/.ssh/id_rsa.pub
