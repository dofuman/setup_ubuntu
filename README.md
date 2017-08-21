# setup_ubuntu for ubuntu 16.04

ここにおいてあるスクリプトの中には`sudo rm -rf`を実行するものが含まれています。
あなたのOSを破壊する可能性があります。自己責任で実行してください。

## ubuntu 16.04.3 をインストール直後に実行

- リブートしたときの時計のズレを防ぐ

`sudo sed -i 's/UTC=yes/UTC=no/g' /etc/default/rcS`

- ホームディレクトリの日本語名を英語表記に変更する

`env LANGUAGE=C LC_MESSAGES=C xdg-user-dirs-gtk-update`

## 日本語キーボード使用する場合

- CapsLockを追加のctrlに変更する.

```sh
dconf reset /org/gnome/settings-daemon/plugins/keyboard/active
dconf write /org/gnome/desktop/input-sources/xkb-options "['ctrl:nocaps']"
```

## LaptopPCを使用する場合

- 画面の明るさ調整。起動時に画面の明るさを暗くする。

```sh
sudo apt-get install xbacklight
```

自動起動するアプリケーションに次のコマンドを追加`xbacklight -set 40`

- TLPを導入し, 省電力設定する

``` shell
./tlp_install.sh
```





