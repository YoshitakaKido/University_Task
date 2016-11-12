# report2_08 - Compulsory subject -

## 課題内容 - Contents  

* 階乗を再帰的に求めるサブルーチン fact 作成せよ  
    fact(n) =  
    1 (n = 0)  
    n * fact(n-1) (n > 0)  
* まず、フィボナッチ数の例を参考にしてC言語で作成せよ  
* 次に、そのC言語版を基に、アセンブリ言語で作成せよ  
* 作成したサブルーチン fact を用いて、10から0までの階乗の数表を表示するプログラムを作成せよ  

## C言語版プログラムのリスト
```c
#include <stdio.h>
#include <stdlib.h>

int fact(int a){
	if(a == 0)
		return 1;
	else
		return a * fact(a - 1);
}

int main(){
	int b;
	for(b = 10; b >= 0; b--)
		printf("%d! = %d\n", b, fact(b));
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
            li      $t0, 10             # レジスタ $t0 に即値10をロード
loop:
            move    $a0, $t0            # レジスタ $a0 にレジスタ $t0 の保持するアドレスを格納
            li      $v0, 1              # syscallで int型を表示する為にレジスタ $v0 に即値1を格納
            syscall                     # レジスタ $a0 の保持する整数を表示
            la      $a0, factorial      # factorialが指すアドレスをレジスタ $a0 に格納
            li      $v0, 4              # syscallで string型を表示する為にレジスタ $v0 に即値4を格納
            syscall                     # 文字列 " != "を表示

            move    $a0, $t0            # レジスタ $a0 にレジスタ $t0の保持するアドレスを格納
            addi    $sp, $sp, -8        # スタックに場所を作る
            sw      $t0, 4($sp)         # レジスタ$t0を格納
            sw      $ra, 0($sp)         # レジスタ$raを格納

            jal     fact                # jump to fact and save position to $ra

            lw      $ra, 0($sp)         # レジスタ$raを復活させる
            lw      $t0, 4($sp)         # レジスタ$t0を復活させる
            addi    $sp, $sp, 8         # レジスタ$spを復活させる
            move    $a0, $v0            # レジスタ $a0 にレジスタ $v0の保持するアドレスを格納
            li      $v0, 1              # syscallで int型を表示する為にレジスタ $v0に即値１を格納
            syscall                     # レジスタ $a0 の保持する値が表示される

            la      $a0, str            # strが指すアドレスをレジスタ $a0に格納
            li      $v0, 4              # syscallでstring型を表示する為にレジスタ $v0に即値４を格納
            syscall                     # 改行処理

            subu    $t0, $t0, 1         # レジスタ $t0から１引いたものをレジスタ $t1に格納
            bge     $t0, $0, loop       # レジスタ $t0の保持する値が０より大きいか等しければラベルloopへ

            j       $ra                 # jump to $ra
fact:
            move    $t0, $a0            # レジスタ $t0にレジスタ $a0の保持するアドレスを格納
            bne     $t0, $0, refact     # レジスタ $t0の保持する値が０でなければラベル refactへ
            li      $v0, 1              # レジスタ $v0に即値１をロード
            j       $ra                 # 戻る

refact:
            subu    $a0, $t0, 1         # レジスタ $t0から１引いたものをレジスタ $a0に格納
            addi    $sp, $sp, -8        # スタックに場所を作る
            sw      $t0, 4($sp)         # レジスタ$t0を格納
            sw      $ra, 0($sp)         # レジスタ$raを格納
            jal     fact                # ラベル fact へ
            lw      $ra, 0($sp)         # レジスタ$raを復活させる
            lw      $t0, 4($sp)         # レジスタ$t0を復活させる
            addi    $sp, $sp, 8         # レジスタ$spを復活させる
            mult    $t0, $v0            # レジスタ $t0とレジスタ $v0の値で乗算を行う
            mflo    $v0                 # 乗算の結果を格納
            j       $ra                 # 戻る
```
## プログラムの説明
```txt

ラベルmain内において、
1行目でレジスタ$t0に即値10をロード
次にラベルloopに入る。
loop内では、
1行目でレジスタ$a0にレジスタ$t0の保持するアドレスを格納する。
2行目でsyscallでint型を表示する為にレジスタ$v0に即値１を格納する。
3行目でレジスタ$a0の保持する値を表示する。
4行目でfactorialが示すアドレスをレジスタ$a0に格納する。
5行目でsyscallでstring型を表示する為にレジスタ$v0に即値４を格納する。
6行目で文字列" != "を表示する。
7行目でレジスタ$a0にレジスタ$t0のアドレスを格納する。
8行目でスタックに場所を作る。
9行目でレジスタ$t0を格納する。
10行目でレジスタ$raを格納する。
11行目でラベル fact へ

先にfact内の説明に移る。
fact内では、
1行目でレジスタ$t0にレジスタ$a0の保持するアドレスを格納する。
2行目でレジスタ$t0の保持する値が０でなければラベルrefactへ
3行目でレジスタ$v0に即値１をロード
4行目で呼び出し側に戻る

続いてrefat内の説明に移る。
refact内では、
1行目ではレジスタ$a0にレジスタ$t0から１引いたものを格納する。
2行目でスタックに場所を作る。
3行目でレジスタ$t0を格納する。
4行目でレジスタ$raを格納する。
5行目でラベル fact へ
6行目でレジスタ$raを復活させる
7行目でレジスタ$t0を復活させる
8行目でレジスタ$spを復活させる
9行目でレジスタ$t0とレジスタ$v0の乗算を行う。
10行目で乗算の結果をレジスタ$v0に格納する。
11行目で呼び出し側に戻る。

ここでmain内の説明に戻る。
12行目でレジスタ$raを復活させる
13行目でレジスタ$t0を復活させる
14行目でレジスタ$spを復活させる
15行目でレジスタ$v0の保持するアドレスをレジスタ$a0に格納する。
16行目でsyscallでint型を表示する為にレジスタ$v0に即値1を格納する。
17行目でレジスタ$a0の保持する値が表示される。
18行目でstrが指すアドレスをレジスタ$a0に格納する。
19行目でsyscallでstring型を表示する為にレジスタ$v0に即値４を格納する。
20行目で改行処理が行われる。
21行目でレジスタ$t0から１引いたものをレジスタ$t0に格納する。
22行目でレジスタ$t0の保持する値が０より大きいか等しいならばラベルloopへ戻る
23行目で呼び出し側に戻り終了である。
```

## 実行結果、および、その実行結果の正しさの説明

<img src="https://github.com/YoshitakaKido/University_Task/blob/master/Computer_Engineering_Laboratory/report2_08/result08.png">

```txt
上図より、予期される結果が示された。
```
