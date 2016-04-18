#!/bin/sh
pwd_dir=$(cd $(dirname $0); pwd)
#Tex install
# Tex Live Installer のためのパッケージ
sudo apt-get install -yV perl
sudo apt-get install -yV perl-tk

cp ./data/install-tl-unx.tar.gz /tmp/
cd /tmp/
tar -xvzf /tmp/install-tl-unx.tar.gz
cd /tmp/install-tl-*
echo "Start tex installer."
sudo ./install-tl <<EOF
I
EOF

echo "Set Path & Environments"
echo "# TeX Live" >> ~/.bashrc
echo "export INFOPATH=$INFOPATH:/usr/local/texlive/2015/texmf-dist/doc/info" >> ~/.bashrc
echo "export MANPATH=$MANPATH:/usr/local/texlive/2015/texmf-dist/doc/man" >> ~/.bashrc
echo "export PATH=\$PATH:/usr/local/texlive/2015/bin/x86_64-linux" >> ~/.bashrc
cd $pwd_dir

sudo /usr/local/texlive/2015/bin/x86_64-linux/tlmgr path add
sudo mkdir -p /usr/local/texlive/texmf-local/web2c
sudo cp ./texmf.cnf /usr/local/texlive/texmf-local/web2c/texmf.cnf
sudo mktexlsr
sudo kanji-config-updmap-sys ipaex
cp latexmkrc ~/.latexmkrc
echo "Tex Install Finished !!"
echo "Installation has been  finished."

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

