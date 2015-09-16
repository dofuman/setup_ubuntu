# git-flow on emacs featured magit
*注意*

- このスクリプトはあなたの環境を破壊する可能性があります。実行は自己責任でおねがいします。


emacs,magit.el,git-flowの連携。
## 1 required

	・emacs24.5
	・git2.5.1
	・magit最新版
	・magit-popup最新版
	・git-flow最新版

## 2 install 手順

### 2.2 emacs24.4のinstall

- [参考サイト](http://ubuntuhandbook.org/index.php/2014/10/emacs-24-4-released-install-in-ubuntu-14-04/)
- [emacsソース配布サイト](http://ftp.gnu.org/gnu/emacs/)

emacs24.3以下のバージョンをインストールしている場合、アンインストールする。
autoremoveは削除されるパッケージを慎重に確認すること。

```sh
sudo apt-get remove emacs
sudo apt-get autoremove
```

emacs24.5のインストール.

```sh
sudo apt-get install build-essential
sudo apt-get build-dep emacs24
cd ~/Downloads
wget http://ftp.gnu.org/gnu/emacs/emacs-24.5.tar.gz
tar -xf emacs-24.5.tar.gz
cd emacs-24.5
./configure
make
sudo make install
```

### 2.3 git-2.5.1のinstall
gitの最新版をインストール。

```sh
sudo add-apt-repository ppa:git-core/ppa  
sudo apt-get update  
sudo apt-get install git
```

### 2.4 git-flowのインストール
gitflowをインストールする。

```sh
sudo apt-get install git-flow
```

### 2.5 magit.el 最新版のインストール
以下、emacsの設定。

- 古いパッケージの削除
emacs上で、`M-x list-packages`を実行。次の画像が確認できる。
![pacakges](./fig/mlpa_packages_list.png)
以下のパッケージの該当箇所で`d`キーを押し、パッケージ横に
Dと表示されたら、`x`キーを押し、削除を実行する。

- git-commit
- git-rebase
- magit
- magit-popup

以下のパッケージをインストールする。
該当するパッケージの箇所にカーソルを合わせてから`i`キーを押すと選択したパッケージ
の先頭に`I`が表示される。次に`x`キーを押して実行。

- magit
- magit-popup
- magit-gitflow

インストールが終了したら、`M-x package-initialize`を実行するか、emacsを再起動する。
次にinit.elにmagit-gitflowの設定を記述する。
`~/.emacs.d/init.el`

	;; magit
	(global-set-key (kbd "C-x g") 'magit-status)

	;;magit-flow
	(require 'magit-gitflow)
	(add-hook 'magit-mode-hook 'turn-on-magit-gitflow)

## 3 Usage

- `magit-status`を開く
- magit-statusバッファで`C-f`















