#setup_ubuntu

- *注意 1*

ここにおいてあるスクリプトの中には`sudo rm -rf`を実行するものが含まれています。
あなたのOSを破壊する可能性があります。自己責任で実行してください。


- リブートしたときの時計のズレを防ぐ

`sudo sed -i 's/UTC=yes/UTC=no/g' /etc/default/rcS`

- ホームディレクトリの日本語名を英語表記に変更する

`env LANGUAGE=C LC_MESSAGES=C xdg-user-dirs-gtk-update`

- capsを追加のctrlに変更する.

`dconf reset /org/gnome/settings-daemon/plugins/keyboard/active`
`dconf write /org/gnome/desktop/input-sources/xkb-options "['ctrl:nocaps']"`

- for laptop

画面の明るさ調整。起動時に画面の明るさを暗くする。　

```sh
sudo apt-get install xbacklight
```

自動起動するアプリケーションに次のコマンドを追加`xbacklight -set 40`


## 1.環境構築




ここにあるスクリプトは、ubuntu14.04でkinectv2が動く環境を整えるためのものです。

 - インストールされるものは以下の通り。

|パッケージ名|説明|
|:--|:--|
|ubuntu-tweak|ubuntu GUI config|
|unity-tweak|unity config|
|gnome-tweak|gnome config|
|Google-chrome||
|emacs24|emacs24.5 ソースからビルド|
|nautilus-open-terminal|ファイルブラウザから右クリックでターミナルを開く|
|git|分散バージョン管理システム,PPAを追加して最新版にしてる|
|terminator|画面分割など便利。|
|ccmake|cmakeをGUIで設定できる|
|compizconfig-settings-manager|特になし.|
|gnuplot|グラフ作る|
|OpenCV2.4.10|画像処理ライブラリ。依存するパッケージも。|
|PCL|点群処理ライブラリ|
|ROS|ロボット触るなら|
|ccache|キャッシュを使ってコンパイルを高速化|
|colorgcc|color|
|texlive|color|

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
[cuda-7.5](https://developer.nvidia.com/cuda-downloads)がリリースされたので注意.  
ここでは、CUIモードからrunファイルを実行してインストールする手順を示す.  

- 古いバージョンのcuda及び、ドライバをインストールしている場合、まずアンインストールしておく。

```sh
sudo /usr/local/cuda-X.Y/bin/uninstall_cuda_X.Y.pl #uninstall a toolkit
sudo /usr/bin/nvidia-uninstall #uninstall driver
```

- grubにデフォルトのドライバを使わないように設定する。

```sh
sudo emacs /etc/default/grub
```

`GRUB_CMDLINE_LINUX_DEFAULT="quiet splash"`を
`GRUB_CMDLINE_LINUX_DEFAULT="splash nouveau.modeset=0"`に変更して保存.次に以下のコマンドを実行.

```sh
sudo grub-mkconfig -o /boot/grub/grub.cfg
sudo reboot
```

- cudaのインストール手順

Ctrl + Alt + F1でCUIモードを立ち上げ,
ユーザ名,パスワードを入力し,CUIにログインする.
次に,`sudo service lightdm stop`を実行し,サービスを止める.
あとは以下の通り.

```sh
chmod +x cuda_<virsion_number>_linux_64.run
sudo ./cuda_<virsion_number>_linux_64.run 
```

実行すると,最初は英文の利用規約が出てくるので適当にスペースキーを
押しながら読み飛ばし,最後に同意するかどうか聞いてくるので,
`accept`と入力し,Enterキーで次に進む.インストールするものを聞いてくるので、
必要なものには`y`を入力、いらないものには`n`を入力.


- cudaの環境設定。

PATHの設定を行う。

```sh
echo '/usr/local/cuda-7.5/lib64' | sudo tee -a /etc/ld.so.conf
echo 'export PATH=$PATH:/usr/local/cuda-7.5/bin' | tee -a ~/.bashrc
```

- 注意点。

	linux kernelを手動でインストールしている場合、linux-headerもインストールすること。
 
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
sudo apt-get install linux-headers-3.16.0-**-generic #インストールしたlinux-imageのバージョンに合わせること。
```

linux-headersをインストールしないと、cuda driverのインストール時にエラーが出るので注意。
また、この作業は必ず慎重に行うこと。

## VMware

[vmware](https://my.vmware.com/jp/web/vmware/free#desktop_end_user_computing/vmware_workstation_player/12_0|PLAYER-1200|product_downloads)  
  
```sh
chmod +x VMware-Player-12.*************.bundle
sudo ./VMware-Player-12.*************.bundle
```

- エラーが出た時の対処 

`"[...]timeTracker_user.c:234 bugNr=148722" `というエラー。

ubuntu14.04にインストールした、vmwareで仮想windows8.1を立ち上げようとするとクラッシュする問題が出たので、
修正法。[このサイト](https://wiki.archlinuxjp.org/index.php/VMware)を参考に。

`/etc/vmware/config`上の次の箇所を修正する。`X`に使用しているCPUの動作クロックを入れれば良い。

```sh
host.cpukHz = "X" #where "X" equals the maximum speed in KHz of your host machine.  That is, its speed in MHz times 1000 or its speed in GHz times 1000000.  A 3GHz machine would be 3000000.
 host.noTSC = TRUE
 ptsc.noTSC = TRUE
```

## rosemacs
***

rosemacsの導入。

- aptからインストール(試してないです。)

```sh
sudo apt-get install ros-indigo-rosemacs
sudo apt-get install rosemacs-el
```

- sourceからビルド

`catkin_ws/src`に.rosinstallファイルがない場合、以下を実行する。(あれば、スキップすること)

```sh
mkdir -p catkin\_ws/src
cd YOUR\_CATKIN\_WS
wstool init src
```
catkin_ws/srcに.rosinstallがあればここから

```sh
cd YOUR\_CATKIN\_WS/src
wstool set ros_emacs_utils --git https://github.com/code-iai/ros_emacs_utils.git
wstool update ros_emacs_utils
cd ..
catkin_make
catkin_make install
```

catkin_ws内にinstallフォルダが生成される。次に、`.emacs.d/init.el`に
以下を記述する。

```lisp
(add-to-list 'load-path "/opt/ros/DISTRO/share/emacs/site-lisp")
;; or whatever your install space is + "/share/emacs/site-lisp"
(require 'rosemacs-config)
```

今回の場合だと、`$(YOUR_CATKIN_WS_PATH)/install/share/emacs/site-lisp`になる。

また、`~/.bashrc`に`source $(YOUR_CATKIN_WS_PATH)/install/setup.bash`を記述する。

catkin_workspaceを分けて使用している場合は、`/opt/ros/indigo`にinstallしてもよいが
おすすめはしない。また、ユーザ権限などは自分で調整すること。

*注意*  

以下のコマンドは`root`で実行するため、自己責任でやること。筆者は責任をとりません。

```sh
sudo -s
cd YOUR_CATKIN_WS
catkin_make -DCMAKE_INSTALL_PREFIX=/opt/ros/indigo install
```

- Prefix key を追加

`.emacs.d/init.el`に次を追記する。

```lisp
(global-set-key "\C-x\C-r" ros-keymap)
```

- rosemacs コマンド

[wiki.ros.org/rosemacs](http://wiki.ros.org/rosemacs)

や

[ROS勉強記録](http://ros-robot.blogspot.jp/2010/01/rosemacs.html)

を参照。

setup.bashをloadした、terminalからemacsを開かないとrosemacsは使えないので注意。
