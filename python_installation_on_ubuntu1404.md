Python on ubuntu 14.04
===
Python2.7の開発環境をubuntu 14.04上で構築するためのメモ。  
目標はchainerが動くところまで。
- Python2.7  
  
  ```sh
  sudo apt-get install python-dev
  sudo apt-get install python-pip
  ```
- Pythonの仮想環境
  
  ```sh
  sudo pip install virtualenv
  sudo pip install virtualenvwrapper
  mkdir ~/.virtualenvs && mkdir ~/Projects
  echo "source /usr/local/bin/virtualenvwrapper.sh" >> ~/.bashrc
  echo "export WORKON_HOME=~/.virtualenvs" >> ~/.bashrc
  echo "export PROJECT_HOME=$HOME/Projects" >> ~/.bashrc
  virtualenv YOUR_ENV 
  mkproject YOUR_PROJECT
  ```
  - 仮想環境を作る  
  
  `virtualenv YOUR_env`
  
  - 仮想環境に入る  
  
  `workon YOUR_ENV`
  
  - 仮想環境から出る
  
  `deactivate`

- Project in virtualenvwrapper

Python仮想環境とprojectディレクトリを$PROJECT_HOMNEで指定した
場所に生成する。Projectの生成以外の使い方はvirtualenvと一緒。

  - Projectをつくる
  
  `mkproject YOUR_PROJECT`
  
	


TODO
===

導入予定

- chainer  

Pythonとは関係ないが  

- cuda  
- cuDNN  




