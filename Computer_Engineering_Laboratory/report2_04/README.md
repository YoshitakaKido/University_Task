# report2_04 - Elective subject -

## 課題内容 - Contents

* report2_03のプログラムを拡張して、入力された非負整数の頻度分布を表示するプログラムを作成せよ  
* 簡単のため、非負整数の範囲は0~9のみに限定してよい

## C言語版プログラムのリスト
```c
#include <stdio.h>
#include <stdlib.h>

int array[10] = {0, 0, 0, 0, 0, 0, 0, 0, 0 ,0};

int main(){
	int a, b;
	do{
		printf(">");
		scanf("%d", &a);
		if(a < 0 || 9 < a)
			break;
		array[a]++;
		printf("%d\n", a);
	}while(1);
	for(b = 0; b <= 9; b++)
		printf("%d : %d\n", b, array[b]);
	return 0;
}
```

## 完成したプログラムのリスト
```s
        .data
array:	.word	0, 0, 0, 0, 0, 0, 0, 0, 0, 0
str:	.asciiz "\n"
msg:	.asciiz	">"
colon:	.asciiz	":"
        .text
        .align	2
        .globl	main
main:
        li       $t3, 0          # レジスタ $t3に即値０を格納
        li	     $v0, 4          # print_stringのシステムコールコードは4
        la	     $a0, msg        # asciizで保存したプリントする文字列のアドレスを$a0に格納
        syscall                  # 文字列 ">" を表示
        li	     $v0, 5          # 整数入力システムコールの番号５を設定
        syscall                  # 入力された整数が$v0に入る
        move	 $t0, $v0        # 入力された整数をレジスタ $t0に格納
        li	     $t1, 0          # レジスタ $t1に即値０を格納(ロード)
        blt	     $t0, $t1, loop  # 入力された整数が０未満ならばラベルloopへ
        li	     $t1, 10         # レジスタ $t1に即値１０を格納(ロード)
        bge	     $t0, $t1, loop  # 入力された整数が１０以上ならばラベルloopへ
        la	     $t1, array      # arrayが指すアドレスをレジスタ $t1に格納
        sll 	 $t2, $t0, 2     # レジスタ $t0を２ビット論理左シフトしたものをレジスタ $t2に格納
        addu	 $t1, $t1, $t2   # レジスタ $t1に $t1 + $t2のアドレスを格納
        lw	     $t2, 0($t1)     # $t1 + 0のアドレスの内容をレジスタ $t2に格納
        addiu	 $t2, $t2, 1     # レジスタ $t2の値に１(16ビット)を加算してレジスタ $t2に格納
        sw	     $t2, 0($t1)     # レジスタ $t2の内容をレジスタ $t1の数値 + 0が示すメモリ番地に格納
        move	 $a0, $t0        # レジスタ $a0にレジスタ $t0の保持するアドレスを格納
        li	     $v0, 1          # print_intのシステムコールコードは 1
        syscall                  # 入力された整数が表示される
        li	     $v0, 4          # print_stringのシステムコールコードは4
        la	     $a0, str        # asciizで保存したプリントする文字列のアドレスをレジスタ $a0に格納
        syscall                  # 改行処理
        li	     $t1, 0          # レジスタ $t1に即値０を格納(ロード)
        j        main            # jump to main
loop:
        move	 $a0, $t3        # レジスタ $a0にレジスタ $t3の保持するアドレスを格納
        li	     $v0, 1          # print_intのシステムコールコードは１
        syscall                  # レジスタ $a0の保持する整数を表示
        li	     $v0, 4          # print_stringのシステムコールコードは４
        la	     $a0, colon      # asciizで保存したプリントする文字列のアドレスをレジスタ $a0に格納
        syscall                  # 文字列":"を表示
        la	     $t1, array      # arrayが指すアドレスをレジスタ $t0に格納
        sll	     $t2, $t3, 2     # レジスタ $t3を２ビット論理左シフトしたものをレジスタ $t2に格納
        addu	 $t1, $t1, $t2   # レジスタ $t1に $t1 + $t2のアドレスを格納
        lw	     $t1, 0($t1)     # $t1 + 0のアドレスの内容をレジスタ $t1に格納
        move	 $a0, $t1        # レジスタ $a0にレジスタ $t1の保持するアドレスを格納
        li	     $v0, 1          # print_intのシステムコールコードは１
        syscall                  # レジスタ $a0の保持する値を表示
        li	     $v0, 4          # print_stringのシステムコールコードは４
        la	     $a0, str        # asciizで保存したプリントする文字列のアドレスをレジスタ $a0に格納
        syscall                  # 改行処理
        addiu	 $t3, $t3, 1     # レジスタ $t3の値に１(16ビット)を加算してレジスタ $t3に格納
        li	     $t1, 10         # レジスタ
        blt	     $t3, $t1, loop  # レジスタ $t3の保持する値がレジスタ $t1の保持する値より小さければラベルloopへ
        j        $ra             # jump to $ra
```

## プログラムの説明



## 実行結果、および、その実行結果のせ正しさの説明
