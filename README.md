#setup_ubuntu for ubuntu 16.04

ここにおいてあるスクリプトの中には`sudo rm -rf`を実行するものが含まれています。
あなたのOSを破壊する可能性があります。自己責任で実行してください。

## ubuntu 16.04.3 をインストール直後に実行

- リブートしたときの時計のズレを防ぐ

`sudo sed -i 's/UTC=yes/UTC=no/g' /etc/default/rcS`

- ホームディレクトリの日本語名を英語表記に変更する

`env LANGUAGE=C LC_MESSAGES=C xdg-user-dirs-gtk-update`

*ここからはは日本語キーボード使用する人もしくはラップトップPCを使用する人向け*

- CapsLockを追加のctrlに変更する.

```sh
dconf reset /org/gnome/settings-daemon/plugins/keyboard/active
dconf write /org/gnome/desktop/input-sources/xkb-options "['ctrl:nocaps']"
```

- for laptop

画面の明るさ調整。起動時に画面の明るさを暗くする。　

```sh
sudo apt-get install xbacklight
```

自動起動するアプリケーションに次のコマンドを追加`xbacklight -set 40`


*ここまで*

