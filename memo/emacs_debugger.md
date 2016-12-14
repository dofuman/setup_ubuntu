# How to use emacs gdb  #

emacs gdbの使い方をいい加減覚えようということでメモ作成.
[参考にしたサイト](https://kb.iu.edu/d/aqsy)

基本的な流れ:

	- プログラムを`-g`オプション付きでコンパイル  
	- emacsでデバッガを起動し,実行ファイルを選択  

## 1.デバッグフラグ付きでプログラムをコンパイル ##

以下のようなc++プログラムを`test.cpp`という名前で作成.

``` c++
#include <iostream>
#include <vector>

void y_ef(double *u){
  *u = *u > 0 ? *u : 0;
}

int main(){
  std::vector<char> str;
  std::vector<char> a(10, 'a'); 
  std::vector<double> d = {1.1, 2.2, 3.3, 4.4};
  std::vector<double> d_copy(d);
  
  return 0;
}

```

GDBを使うためにまず最初に`g++`に`-g`オプションをつけてコンパイル

``` shell
g++ -std=c++11 -g -o test test.cpp
```
これでデバッグフラグ付きの実行ファイルが生成される.

## emacs上でGDBを開く ##
次に`test.cpp`をemacsで編集中にデバッガ用のウィンドウを`C-x 3`でセパレートし,
実行ファイルをデバッガで開く.

``` emacs-lisp
M-x gdb
;;or
M-x realgud:gdb
```

更にデバッガで開く実行ファイルを訪ねてくるので

```
gdb test
```

としてEnter.以下のように表示されるはず.

```
Current directory: ~/
Command: gdb test
set annotate 1
GNU gdb (Ubuntu 7.7.1-0ubuntu5~14.04.2) 7.7.1
...
...
(gdb) (gdb) 
(gdb)
```

## gdbの使い方 ##

**ソースコードの表示**

```
(gdb) list 
(gdb) list 1, 5 #行指定
```

**クラッシュするポイントの特定**

```
(gdb) run
(gdb) where
```

**break point**

ブレークポイントの指定

```
(gdb) break 3
(gdb) break 4
(gdb) break 6 #行指定
```

次に`run`コマンドで順に実行していく.
`next`で次のブレークポイントへ移動.

ブレークポイントの削除

```
(gdb) del #行番号
```

設定されたブレークポイントの確認

```
(gdb) i b 
```


**runの停止**

```
(gdb) kill
```

**helpの呼び出し**

```
(gdb) help
```

より詳細な`help`

```
(gdb) help topic
```

基本的にmainでブレークポイント設定して,nextで進めながら,詳細はstepで確認
, `print 変数`で変数の中身をチェックでいいかな.















	
















