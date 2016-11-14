# Report2_01 - Compulsory subject -

## 課題内容 - Contents
* "Hello, World"を表示するプログラムを作成し、SPIM上で実行せよ
* 自分の学生番号を表示するプログラムを作成・実行せよ

## "Hello, World"を表示するプログラム
```s
        .data                       # データセグメントにデータを配置することを示す
str:    .asciiz     "s153038"
        .text                       # 以下の記述をテキストセグメントに配置
        .align      2               # 4byte境界になるように調整する
        .globl      main
main:
        li          $v0, 4          # syscallで文字列を表示する為に即値4をv0レジスタにロード
        la          $a0, str        # strが示すアドレスをa0レジスタにロード
        syscall                     # 文字列を表示
        move        $v0, $0         # 返り値を$v0に設定
        j           $ra             # 呼び出し側に戻る
```

## 実行手順(SPIMの使用方法)
```txt
1) QtSpimを実行する。
2) File → LoadFileより実行したいファイルを選択する。
3) Simulator → Run/Continueを選択し実行する。
4) 実行結果がConsoleに表示される。
```

## 実行結果(コンソールの表示内容)

