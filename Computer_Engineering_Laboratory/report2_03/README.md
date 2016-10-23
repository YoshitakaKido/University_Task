# Report2_03  

## 課題内容 - Contents  
* 標準入力(キーボード)から入力された非負整数を、オウム返しいそのまま表示するプログラムを作成せよ  
* 入力が非負である限り入出力を繰り返し、負数が入力されたらプログラムお終了うるようにせよ  
* レポートへの記入事項はRepore2_02と同様  

## C言語版プログラムのリスト
```c
#include <stdio.h>
#include <stdlib.h>

int main(){
	int a;
	while(1){
		printf(">");
		scanf("%d", &a);
		if(a < 0) break;
		printf("%d\n", a);
	}
	return 0;
}
```

## 完成したプログラムのリスト
```s
        .data                   # データセグメントにデータを配置することを示す
str:    .asciiz "\n"
msg:    .asciiz ">"
        .text                   # 以下の記述をテキストセグメントに配置
        .align  2               # 4byte境界になるように調整する
        .globl  main
main:
        addi    $t0, $0, 0      # t0 = 0を代入
loop:
        li      $v0, 4          # print_stringのシステムコールコードは4
        la      $a0, msg        # asciizで保存したプリントする文字列のアドレスを$a0に格納
        syscall                 # 文字列を表示
        li      $v0, 5          # 整数入力システムコールの番号５を設定
        syscall                 # 入力された整数が$v0に入る
        slt     $t0, $v0, $t0   # 入力された数($v0)が0より小さいか　小さい：$t0 = 1, 大きい：$t0 = 0
        bne     $t0, $0, break  # 入力された数が0より小さい場合は終了 $t0 = 1ならbreak
        move    $a0, $v0        # その整数をシステムコールの引数にする
        li      $v0, 1          # 整数表示システムコールの番号1を設定
        syscall                 # 入力された整数が画面に表示される
        li      $v0, 4          # 改行処理
        la      $a0, str
        syscall
        j       loop            # jump to loop
break:
        move    $v0, $0
        j       $ra             # jump to $ra
```

## プログラムの説明
