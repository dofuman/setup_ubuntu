# VPN Gate client for linux

## インストール方法

- 依存するパッケージをインストール

```shell
sudo apt update && sudo apt upgrade -y
sudo apt install openvpn -y
sudo apt install python-requests -y
sudo apt install python-urwid -y
sudo apt install wmctrl -y
```
不足するパッケージがある場合, vpngate-with-proxyを初回実行に
自動的にインストールしてくれる.

- vpngate-with-proxyをクローン

```shell
git clone https://github.com/Dragon2fly/vpngate-with-proxy.git
```

## 使い方

- vpnに接続する

以下のコマンドを実行

```shel
cd /your/path/to/vpngate-with-proxy/
./run tui
```

少し待つとサーバリストが表示されるので, 好みのサーバの番号を
入力して`Enter`を押せば接続される. 

なおdeadしているサーバは自動的に排除してくれる.

- vpnを切断する

`q`で切断できる.

