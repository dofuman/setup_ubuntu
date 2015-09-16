#setup_ubuntu
***
*注意*
ここにおいてあるスクリプトの中には`sudo rm -rf`を実行するものが含まれています。
あなたのOSを破壊する可能性があります。自己責任で実行してください。

 - リブートしたときの時計のズレを防ぐ
`sudo sed -i 's/UTC=yes/UTC=no/g' /etc/default/rcS`

 - ホームディレクトリの日本語名を英語表記に変更する
`env LANGUAGE=C LC_MESSAGES=C xdg-user-dirs-gtk-update`

 - capsを追加のctrlに変更する.
`dconf reset /org/gnome/settings-daemon/plugins/keyboard/active`
`dconf write /org/gnome/desktop/input-sources/xkb-options "['ctrl:nocaps']"`

## 1.環境構築
*注意点*
以下のスクリプトを実行する前に,nvidiaのcuda対応グラフィックドライバを
インストールしないでください。ROSをインストール前にそれをすると、最悪xserverが
ぶっ壊れて、ubuntuが死にました。

ここにあるスクリプトは、ubuntu14.04でkinectv2が動く環境を整えるためのものです。

 - インストールされるものは以下の通り。

|パッケージ名|説明|参考サイト|
|:--|:--|:--|
|ubuntu-tweak|ubuntu GUI config|[]()|
|unity-tweak|unity config|[]()|
|gnome-tweak|gnome config|[]()|
|Google-chrome||[]()|
|emacs24|emacs24.5 ソースからビルド|[]()|
|nautilus-open-terminal|ファイルブラウザから右クリックでターミナルを開く|[]()|
|git|分散バージョン管理システム,PPAを追加して最新版にしてる|[]()|
|terminator|画面分割など便利。|[]()|
|ccmake|cmakeをGUIで設定できる|[]()|
|compizconfig-settings-manager|特になし.|[]()|
|gnuplot|グラフ作る|[]()|
|OpenCV2.4.10|画像処理ライブラリ。依存するパッケージも。|[]()|
|PCL|点群処理ライブラリ|[]()|
|ROS|ロボット触るなら|[]()|
|ccache|キャッシュを使ってコンパイルを高速化|[]()|
|colorgcc|color|[]()|
|texlive|color|[]()|

```sh
sudo sh setup.sh
```



次はOpenCLをインストールしましょう.
intelが提供しているパッケージを持ってきてください。
サポートしていないOSと言われますが,僕の環境だと大丈夫でした.
依存するライブラリが入っていないかもチェックしてくれるので,英文ですがちゃんと読みながら
インストールを進めてください.インストールするコンポーネントをカスタマイズできるので,おそらく
`for android`のパッケージはいらないのでチェックを外してインストールしましょう.

あとはcuda-7.0対応のドライバをインストールしましょう.

## 1.2 cuda対応グラフィックドライバのインストール方法.
[cuda-7.0](https://developer.nvidia.com/cuda-downloads)がリリースされたので注意.
以下の手順を実行した後,試すこと.

```sh
sudo emacs /etc/default/grub
```

`GRUB_CMDLINE_LINUX_DEFAULT="quiet splash"`を
`GRUB_CMDLINE_LINUX_DEFAULT="splash nouveau.modeset=0"`に変更して保存.次に以下のコマンドを実行.

```sh
sudo grub-mkconfig -o /boot/grub/grub.cfg
sudo reboot
```

Ctrl + Alt + F1でCUIモードを立ち上げ,
ユーザ名,パスワードを入力し,CUIにログインする.
次に,`sudo service lightdm stop`を実行し,x11をキルする.
あとは以下の通り.

```sh
chmod +x cuda_<virsion_number>_linux_64.run
sudo ./cuda_<virsion_number>_linux_64.run 
```

実行すると,最初は英文の利用規約が出てくるので適当にスペースキーを
押しながら読み飛ばし,最後に同意するかどうか聞いてくるので,
`accept`と入力し,Enterキーで次に進む.

* graphic driver
* cuda library
* cuda sample

それぞれ,インストールするかどうか聞かれるので最初のインストールでは
graphic driverのみ`y`と入力すればよい.


## 1.3.OpenCLのインストール

intelが提供してるOpenCLのライブラリをインストールする.
それを見つけて `sudo ./install.sh`を実行するだけ.多分依存関係で`lsb-core`を先に
aptからインストールしておいたほうが楽でしょう.

## 4.libfreenect2 & iai-kinect2 の導入
おそらく準備は整ったので,kinectv2を動かしてみましょう.
とは言っても,`libfreenect2_setup.sh`を実行するだけです.お疲れ様でした.

## ex.その他の環境構築
上記までは,libfreenect2およびiai-kinect2を動かせるようにするためにいろいろ
インストールとかしたけど,ここからは僕の作業用の環境構築なのであしからず.

#### ex1.emacs

適当なディレクトリで`dotfiles`を`git clone`する. `ssh`でやるべし.
あとはシンボリックリンクを作成して終了.`ls -s ~/適当なディレクトリ/dotfiles/.emacs.d/ ~/`

#### ex2.pcl
PCLは基本的にコンパイルにものすごく時間がかかっちゃうので高速化しましょう。
手順は以下の通り。

・install ccache

```sh
sudo apt-get install ccache
```

・install colorgcc

```sh
sudo apt-get install colorgcc
```

・colorgccを有効化する

```sh
cp /etc/colorgcc/colorgccrc ~/.colorgccrc
```

$HOME/.colorgccrc ファイルを編集する。以下のラインを探しましょう。

```sh  
g++: /usr/bin/g++  
gcc: /usr/bin/gcc  
c++: /usr/bin/g++  
cc:  /usr/bin/gcc  
g77: /usr/bin/g77  
f77: /usr/bin/g77  
gcj: /usr/bin/gcj  
```  

これを次のように書き換えます。

```sh  
g++: ccache /usr/bin/g++  
gcc: ccache /usr/bin/gcc  
c++: ccache /usr/bin/g++  
cc:  ccache /usr/bin/gcc  
g77: ccache /usr/bin/g77  
f77: ccache /usr/bin/g77  
gcj: ccache /usr/bin/gcj  
```  

・$HOME/bin ディレクトリを作り、シンボリックシンクを作成します。  

```sh  
ln -s /usr/bin/colorgcc c++  
ln -s /usr/bin/colorgcc cc  
ln -s /usr/bin/colorgcc g++  
ln -s /usr/bin/colorgcc gcc  
```  

・最後に`~/.bashrc`に$HOME/binを最初に読み込むように設定して終了。

```sh  
export PATH=$HOME/bin:$PATH  
```

を`~/.bashrc`の最後の行に書き込む。

## Linux kernelの更新
linux-images-3.13.0-*だとkinectv2が動かない可能性があるので、
kernelの更新をする必要に迫られる場合がある。(特にlibusbの問題で)

kernelのバージョンを3.16-*に上げる方法を以下に示す。

```sh
sudo apt-get install linux-image-generic-lts-utopic
uname -a #カーネルのバージョン確認
sudo apt-get install linux-headers-3.16.0-45-generic #インストールしたlinux-imageのバージョンに合わせること。
```

linux-headersをインストールしないと、cuda driverのインストール時にエラーが出るので注意。
また、この作業は必ず慎重に行うこと。








