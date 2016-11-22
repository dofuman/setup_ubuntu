Python on windows10
===
Python2.7の開発環境をwindows10上で構築するためのメモ。

- Python2.7  
    こちらから[Python2.7](https://www.python.org/downloads/)のsetupファイルをダウンロード、実行し
    インストールする。
    - Path設定を追加(コントロールパネル/システムの詳細設定/環境変数/Pathの編集)  
        C:\Python27  
        C:\Python27\Scripts  
        
- easy_install
    Pythonモジュール管理用コマンド。[ez_setup.py](https://bootstrap.pypa.io/ez_setup.py)をダウンロード、実行しインストール。
    
- pip
    Pythonモジュール管理用コマンド。`easy_install pip`を実行。 `pip install --upgrade pip`でpipモジュールのupgrade
    
- ipython
    pythonを使いやすくしたもの。`pip install ipython`を実行。

- jupyter
	ipythonをブラウザ上で動作させるためのモジュール。`pip install jupyter`でインストールされる。

TODO
===
導入予定
- virtualenv  
- virtualenvwrapper  
- chainer  
Pythonとは関係ないが  
- cuda  
- cuDNN  




