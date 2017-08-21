# Git

- gitのインストール

ubuntuの初期リポジトリだと更新が遅いため,
ppaのgit-coreのリポジトリを追加しても良い.

"""shell
sudo apt update && sudo apt upgrade
sudo apt install git ssh
"""

- ユーザ名とメールアドレスを設定

ここは適宜変更して実行すること
  
"""shell
git config --global user.name "your name"
git congit --global user.email "your@email.address"
"""
	
# SSH鍵
パスフレーズも設定する Github.comも推奨している.
鍵の生成場所と名前も設定する.
デフォルトだと"~/.ssh/id_rsa"となる 
"~/.ssh/id_rsa_github"などすると管理しやすくなる.

- SSH鍵の生成
	
"""sh
ssh-keygen -t rsa -b 4096 -C "your@email.address"
"""

- 秘密鍵の権限を設定する.
	
"""sh
chmod 600 ~/.ssh/id_rsa
"""

- Githubとの接続に使う秘密鍵の設定
	
エディタで"config"に記述する.なければ作ってから
	
"""sh
nano ~/.ssh/config
"""

以下記述する  
"Host github  
	HostName github.com  
	User git  
	IdentityFile ~/.ssh/id_rsa"  

# Github

ユーザページの"settings"から"SSH and GPG keys"を選択し"New SSh key"
をクリックし,"cat ~/.ssh/id_rsa.pub"で公開鍵をコピーし貼り付けて設定する.

# SSH接続のテスト

"ssh -T git@github.com"を実行する.




