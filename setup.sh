#!/bin/sh
pwd_dir=$(dirname $(readlink -f $0))
echo "Installation starts ..."
#レポジトリの追加
#gnome-tweak-tool, ubuntu-tweak
yes | sudo add-apt-repository ppa:tualatrix/ppa
sudo apt-get -y update
sudo apt-get -yV install ubuntu-tweak
sudo apt-get -yV install unity-tweak-tool
sudo apt-get -yV install gnome-tweak-tool

#google chrome
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
sudo apt-get -y update
sudo apt-get -yV install google-chrome-stable

#更新確認
sudo apt-get -y update
sudo apt-get -y upgrade

# ファイルブラウザから端末を起動できるようにする.
sudo apt-get -yV install nautilus-open-terminal

# emacs24のインストール
#sudo apt-get -yV install emacs24
sudo apt-get -yV install build-essential
sudo apt-get -y build-dep emacs24
cd ~/Downloads
wget http://ftp.gnu.org/gnu/emacs/emacs-24.5.tar.gz
tar -xf emacs-24.5.tar.gz
cd emacs-24.5
./configure
make -j -l
sudo make install
cd ~
#git 最新版のインストール
yes | sudo add-apt-repository ppa:git-core/ppa  
sudo apt-get -y  update  
sudo apt-get -yV install git
#git flowのインストール
sudo apt-get -yV  install git-flow
#ccmake install
sudo apt-get -y update
sudo apt-get -yV cmake-curses-guils
sudo apt-get -yV install terminator
sudo apt-get -yV install compizconfig-settings-manager
sudo apt-get -yV install synaptic
sudo apt-get -yV install gnuplot-x11

# 最初は前提ソフトウエアのインストール

# OpenCV install
# インストールするOpenCVのバージョン
OPENCV_VERSION="2.4.10"

sudo apt-get -yV install opencl-headers
#
sudo apt-get -yV install libjpeg-dev
sudo apt-get -yV install libopenjpeg-dev
sudo apt-get -yV install jasper
sudo apt-get -yV install libjasper-dev libjasper-runtime
sudo apt-get -yV install libpng12-dev
sudo apt-get -yV install libpng++-dev libpng3
sudo apt-get -yV install libpnglite-dev libpngwriter0-dev libpngwriter0c2
sudo apt-get -yV install libtiff-dev libtiff-tools pngtools
sudo apt-get -yV install zlib1g-dev zlib1g-dbg
sudo apt-get -yV install v4l2ucp
#
sudo apt-get -yV install python
sudo apt-get -yV install autoconf
sudo apt-get -yV install libtbb2 libtbb-dev
sudo apt-get -yV install libeigen2-dev
sudo apt-get -yV install cmake
sudo apt-get -yV install openexr
sudo apt-get -yV install gstreamer-plugins-*
sudo apt-get -yV install freeglut3-dev
sudo apt-get -yV install libglui-dev
sudo apt-get -yV install libavc1394-dev libdc1394-22-dev libdc1394-utils
sudo apt-get -yV install libgtk2.0-dev
sudo apt-get -yV install pkg-config
# ビデオ関係のパッケージ
sudo apt-get -yV install libxine-dev
sudo apt-get -yV install libxvidcore-dev
sudo apt-get -yV install libva-dev
sudo apt-get -yV install libssl-dev
sudo apt-get -yV install libv4l-dev
sudo apt-get -yV install libvo-aacenc-dev
sudo apt-get -yV install libvo-amrwbenc-dev
sudo apt-get -yV install libvorbis-dev
sudo apt-get -yV install libvpx-dev
sudo apt-get install -yV lsb-core
cd ~/Downloads
wget http://sourceforge.net/projects/opencvlibrary/files/opencv-unix/${OPENCV_VERSION}/opencv-${OPENCV_VERSION}.zip
unzip opencv-${OPENCV_VERSION}.zip
cd opencv-${OPENCV_VERSION}

cmake -DBUILD_DOCS=ON -DBUILD_EXAMPLES=ON -DCMAKE_BUILD_TYPE=RELEASE -DWITH_TBB=ON -DINSTALL_C_EXAMPLES=ON -DWITH_OPENCL=OFF -DWITH_CUDA=OFF -DWITH_OPENNI=ON -DWITH_UNICAP=ON -DWITH_V4L=ON -DWITH_XINE=ON -DWITH_OPENEXR=ON -DBUILD_OPENEXR=ON .

make -j4 -l4
sudo make install
sudo ldconfig

#terminator設定
gsettings set org.gnome.desktop.default-applications.terminal exec /usr/bin/terminator
gsettings set org.gnome.desktop.default-applications.terminal exec-arg "-x"
sudo update-alternatives --config x-terminal-emulator


#pcl install
yes | sudo add-apt-repository ppa:v-launchpad-jochen-sprickerhof-de/pcl
sudo apt-get -y update
sudo apt-get -yV install libpcl-all

#ROSinstall
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu trusty main" > /etc/apt/sources.list.d/ros-latest.list'
wget https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -O - | sudo apt-key add -
sudo apt-get -y update
sudo apt-get -yV install ros-indigo-desktop-full
sudo rosdep init
rosdep update
echo "source /opt/ros/indigo/setup.bash" >> ~/.bashrc
source ~/.bashrc
sudo apt-get -yV install python-rosinstall
sudo rosdep fix-permissions

#その他 便利ツールインストール
sudo apt-get -y update
#ccmake cmakeのgui設定ツール usage:$ ccmake <CMakeLists.txt>
sudo apt-get -yV install cmake-curses-gui
#speed up compilation tools for PCL
sudo apt-get install ccache
sudo apt-get install colorgcc

# #Tex install
# # Tex Live Installer のためのパッケージ
# sudo apt-get install -yV perl
# sudo apt-get install -yV perl-tk
# cd $pwd_dir
# cp ./data/install-tl-unx.tar.gz /tmp/
# cd /tmp/
# tar -xvzf /tmp/install-tl-unx.tar.gz
# cd install-tl-*
# echo "Start tex installer."
# sudo ./install-tl <<EOF
# I
# EOF

# echo "Set Path & Environments"

# echo "# TeX Live" >> ~/.bashrc
# echo "export INFOPATH=$INFOPATH:/usr/local/texlive/2015/texmf-dist/doc/info" >> ~/.bashrc
# echo "export MANPATH=$MANPATH:/usr/local/texlive/2015/texmf-dist/doc/man" >> ~/.bashrc
# echo "export PATH=\$PATH:/usr/local/texlive/2015/bin/x86_64-linux" >> ~/.bashrc
# cd $pwd_dir
# sudo /usr/local/texlive/2015/bin/x86_64-linux/tlmgr path add
# sudo mkdir -p /usr/local/texlive/texmf-local/web2c
# sudo cp ./texmf.cnf /usr/local/texlive/texmf-local/web2c/texmf.cnf
# sudo mktexlsr
# sudo kanji-config-updmap-sys ipaex
# cp latexmkrc ~/.latexmkrc
# echo "Tex Install Finished !!"

echo "indicators installation start."
#indicator-multiload
yes | sudo add-apt-repository ppa:indicator-multiload/stable-daily
#indicator-sensor
yes | sudo apt-add-repository ppa:alexmurray/indicator-sensors
#indicator-sound-switcher
yes | sudo apt-add-repository ppa:yktooo/ppa
sudo apt-get -y update
sudo apt-get -yV install indicator-multiload
sudo apt-get -yV install indicator-sensors
sudo apt-get -yV install indicator-sound-switcher


echo "ALL installation has been finished."
