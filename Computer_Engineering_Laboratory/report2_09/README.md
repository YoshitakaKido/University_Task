# report2_09 - Elective subject -

## 課題内容 - Contents
* 階乗(再帰ではなく)繰り返しによって求めるサブルーチンを作成せよ  
* report2_08と同様に、作成したサブルーチンを用いて10から0までの階乗の数表を表示するプログラムを作成せよ  

## C言語プログラムのリスト
```c
#include <stdio.h>
#include <stdlib.h>

int fact(int a){
	int b = 1;
	while(a > 0){
		b = b * a;
		a--;
	}		
	return b;
}

int main(){
	int c;
	for(c = 10; c >= 0; c--)
		printf("%d! = %d\n", c, fact(c));
	return 0;
}
```
## 完成したプログラムのリスト

```s
            .data
factorial:  .asciiz " != "
str:        .asciiz "\n"
            .text
            .align  2
            .globl  main
main:
            li      $t0, 10         # レジスタ $t0 に即値10をロード
loop:
            move    $a0, $t0        # レジスタ $a0 にレジスタ $t0 の保持するアドレスを格納
            li      $v0, 1          # syscallで int型を表示する為にレジスタ $v0 に即値1を格納
            syscall                 # レジスタ $a0 の保持する整数を表示
            la      $a0, factorial  # factorialが指すアドレスをレジスタ $a0 に格納
            li      $v0, 4          # syscallで string型を表示する為にレジスタ $v0 に即値4を格納
            syscall                 # 文字列 " != "を表示
            move    $a0, $t0        # レジスタ $a0 にレジスタ $t0の保持するアドレスを格納
            addi    $sp, $sp, -8    # スタックに場所を作る
            sw      $t0, 4($sp)     # レジスタ$t0を格納
            sw      $ra, 0($sp)     # レジスタ$raを格納
            jal      fact           # jump to fact and save position to $ra
            lw	     $ra, 0($sp)    # レジスタ$raを復活させる
            lw	     $t0, 4($sp)    # レジスタ$t0を復活させる
            addi     $sp, $sp, 8    # レジスタ$spを復活させる
            move     $a0, $v0       # レジスタ $a0 にレジスタ $v0の保持するアドレスを格納
            li	     $v0, 1         # syscallで int型を表示する為にレジスタ $v0に即値１を格納
            syscall                 # レジスタ $a0 の保持する値が表示される
            la	     $a0, str       # strが指すアドレスをレジスタ $a0に格納
            li	     $v0, 4         # syscallでstring型を表示する為にレジスタ $v0に即値４を格納
            syscall                 # 改行処理
            addi     $t0, $t0, -1   # レジスタ $t0から１引いたものをレジスタ $t1に格納
            bge	     $t0, $0, loop  # レジスタ $t0の保持する値が０より大きいか等しければラベルloopへ
            j        $ra            # jump to $ra
fact:
            move     $t0, $a0       # レジスタ$t0にレジスタ$a0のアドレスを格納
            li	     $v0, 1         # レジスタ $v0に即値１をロード
            li	     $t1, 1         # レジスタ $t1に即値１をロード
for:
            mult     $v0, $t1       # レジスタ $v0とレジスタ $t1の値で乗算を行う
            mflo     $v0            # 乗算の結果を格納
            addi     $t1, $t1, 1    # レジスタ$t1に１加算したものをレジスタ$t1に格納
            ble	     $t1, $t0, for  # レジスタ$t1の保持する値がレジスタ$t0を超えない限りラベルforへ
            j	     $ra            # 呼び出し側に戻る
```
