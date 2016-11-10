# report2_06 - Compulsory subject -

## 課題内容 - Contents  
* アドレス from から始まる10ワードのデータを、アドレス to から始まる10ワードの領域にコピーせよ

## C言語版プログラムのリスト
```c

#include <stdio.h>
#include <stdlib.h>

int array[15] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 0, 0, 0, 0, 0};

int main(){
	int * const from = array;
	int * const to = array + 5;
	int * p;
	for(p = array; p < array + 15; p++ )
		printf("%p : %d\n", p, *p);
	for(p = array + 15; p >= array + 5; p--)
		*p = p[from - to];
	for(p = array; p < array + 15; p++)
		printf("%p : %d\n", p, *p);
}
```

## 完成プログラムのリスト
```s
        .data                       # データセグメントにデータを配置することを示す
from:   .word   1, 2, 3, 4, 5
to:     .word   6, 7, 8, 9, 10
        .word   0, 0, 0, 0, 0
str:    .asciiz "\n"
msg:    .asciiz ":"
        .text                       # 以下の記述をテキストセグメントに配置
        .align  2                   # 4byte境界になるように調整する
        .globl  main
main:
        la        $t1, from         # fromが指すアドレスをレジスタ t1 に格納
        la        $t2, to           # toが指すアドレスをレジスタ t2 に格納
        li        $t3, 15           # レジスタ $t3 に即値15をロード
        li        $t4, 10           # レジスタ $t4 に即値10をロード
        li        $t5, 15           # レジスタ $t5 に即値15をロード
loop:
        move      $a0, $t1          # レジスタ a0 に レジスタ t1 の保持するアドレスを格納
        li        $v0, 1            # print_intのシステムコールコードは 1
        syscall                     # レジスタ to のアドレスを表示
        la        $a0, msg          # asciizで保存したプリントする文字列のアドレスをレジスタ a0 に格納
        li        $v0, 4            # print_stringのシステムコールコードは 4
        syscall                     # 文字列 ":" を表示
        lw        $a0, 0($t1)       # $t1 + 0のアドレスの内容をレジスタ a0 に格納
        li        $v0, 1            # print_intのシステムコールコードは 1
        syscall                     # レジスタ a0 の内容を表示
        la        $a0, str          # asciizで保存したプリントする文字列のアドレスをレジスタ a0 に格納
        li        $v0, 4            # print_stringのシステムコールコードは 4
        syscall                     # 改行処理
        addu      $t1, $t1, 4       # レジスタ t1 の保持するアドレスに 4 を加えたものをレジスタ t1 に格納
        subu      $t3, $t3, 1       # レジスタ t3 の保持する値から 1 を引いたものをレジスタ t3 に格納
        bne       $t3, $0, loop     # レジスタ t3 の保持する値が 0 でなければラベル loop へ
        la        $a0, str          # asciizで保存したプリントする文字列のアドレスをレジスタ a0 に格納
        li        $v0, 4            # print_stringのシステムコールコードは 4
        syscall                     # 改行処理
        addi      $t1, $t1, -24     # レジスタ $t1 の保持するアドレスに -20 を加えたものをレジスタ $t1 に格納
        addu      $t2, $t2, 36      # レジスタ $t2 の保持するアドレスに 40 を加えたものをレジスタ $t2 に格納
loop2:
        lw        $t0, 0($t1)       # $t1 + 0のアドレスの内容をレジスタ t6 に格納
        sw        $t0, 0($t2)       # $t2 + 0 が示すメモリ番地にレジスタ t6 の内容を1ワードとして格納
        addi      $t1, $t1, -4      # レジスタ $t1 の保持するアドレスから 4 を引いたものをレジスタ $t1 に格納
        addi      $t2, $t2, -4      # レジスタ $t2 の保持するアドレスから 4 を引いたものをレジスタ $t2 に格納
        subu      $t4, $t4, 1       # レジスタ $t4 の保持する値から 1 引いたものをレジスタ $t4 に格納
        bne       $t4, $0, loop2    # レジスタ $t4 の保持する値が 0 でなければラベル loo2 へ
        addi      $t1, $t1, 4       # レジスタ $t1 の保持するアドレスに 4 を加えたものをレジスタ $t1 に格納
loop3:
        move      $a0, $t1          # レジスタ a0 にレジスタ $t2 の保持するアドレスを格納
        li        $v0, 1            # print_intのシステムコールコードは 1
        syscall                     # レジスタ t2 の保持するアドレスを表示
        la        $a0, msg          # asciizで保存したプリントする文字列のアドレスをレジスタ a0 に格納
        li        $v0, 4            # print_stringのシステムコールコードは 4
        syscall                     # 文字列 ":" を表示
        lw        $a0, 0($t1)       # $t2 + 0のアドレスの内容をレジスタ a0 に格納
        li        $v0, 1            # print_intのシステムコールコードは 1
        syscall                     # レジスタ a0 の内容を表示
        la        $a0, str          # asciizで保存したプリントする文字列のアドレスをレジスタ a0 に格納
        li        $v0, 4            # print_stringのシステムコールコードは 4
        syscall                     # 改行処理
        addu      $t1, $t1, 4       # レジスタ t2 の保持するアドレスに 4 を加えたものをレジスタ t2 に格納
        subu      $t5, $t5, 1       # レジスタ t5 の保持する値から 1 を引いたものをレジスタ t5 に格納
        bne       $t5, $0, loop3    # レジスタ t5 の保持する値が 0 でなければラベル loop3 へ
        j         $ra               # jump to $ra
```
## プログラムの説明

## 実行結果
