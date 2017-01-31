#setup_ubuntu for ubuntu 16.04

- *注意*

ここにおいてあるスクリプトの中には`sudo rm -rf`を実行するものが含まれています。
あなたのOSを破壊する可能性があります。自己責任で実行してください。

## インストール一覧

|インストール対象|説明                  |script file      |
|---------------|:--------------------:|:---------------:|
|Google Chrome  |web browser           |setup.sh         |
|Dropbox        |cloud strage          |                 |
|terminator     |CUI                   |                 |
|cmake          |compile command       |                 |
|ccache colorgcc|accelerate compilation|                 |
|indicator-*    |display computer state|                 |
|emacs25.1      |GOD editor            |emacs_install.sh | 
|opencv(latest) |image processing lib  |opencv_install.sh|
|texlive        |tex distribution      |tex_install.sh   |
|nkf            |文字コードの変換       |                 |
|gnuplot-*      |グラフの作成など       |                 |
|tgif           |ベクター画像のお絵かき |                 |
|gimp           |画像編集など           |                 |
|inkscape       |お絵かき               |                 |
|mimetex        |TeX形式の数式を出力    |                 |
|latexdiff      |tex差分を表示          |                 |
|tlp tpacpi-bat |laptop向け 省電力設定  |tlp_install.sh   |


## その他設定
- リブートしたときの時計のズレを防ぐ

`sudo sed -i 's/UTC=yes/UTC=no/g' /etc/default/rcS`

- ホームディレクトリの日本語名を英語表記に変更する

`env LANGUAGE=C LC_MESSAGES=C xdg-user-dirs-gtk-update`

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


```sh
cp /etc/colorgcc/colorgccrc ~/.colorgccrc
```

## ccache, colorgccの設定

```sh  
g++: /usr/bin/g++  
gcc: /usr/bin/gcc  
c++: /usr/bin/g++  
cc:  /usr/bin/gcc  
g77: /usr/bin/g77  
f77: /usr/bin/g77  
gcj: /usr/bin/gcj  
```

これを次のように書き換える

```sh  
g++: ccache /usr/bin/g++  
gcc: ccache /usr/bin/gcc  
c++: ccache /usr/bin/g++  
cc:  ccache /usr/bin/gcc  
g77: ccache /usr/bin/g77  
f77: ccache /usr/bin/g77  
gcj: ccache /usr/bin/gcj  
```  


シンボリックリンクを任意のディレクトリで作成し,
PATHを通す.(ここでは$HOME/bin)
```sh  
ln -s /usr/bin/colorgcc c++  
ln -s /usr/bin/colorgcc cc  
ln -s /usr/bin/colorgcc g++  
ln -s /usr/bin/colorgcc gcc  
```  

以下を~/.bashrcに記述する.
```sh  
export PATH=$HOME/bin:$PATH  
```

## 既知のエラーと解決策

colorgccとccacheを有効にした状態で,emacs上でirony-serverをbuildするのに失敗する.
`permission denied`になるので, 一旦,`~/.colorgccrc`をrenameして無効化した状態だと
正常にbuildできる.一度ビルドすれば,再ビルドが必要になるまでccacheとcolorgccを有効
にしていても問題はない.

なのでemacs上で`M-x irony-install-server`を実行してから,ccacheとcolorgccの設定
をしたほうが良い.

