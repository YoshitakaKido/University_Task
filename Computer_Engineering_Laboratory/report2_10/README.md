# report2_10 - Elective subject -

## 課題内容 - Contents  
* 100の階乗を計算し、表示するプログラムを作成せよ  

## C言語版プログラムのリスト
```c
#include <stdio.h>
unsigned int result[40];
int main(){
    unsigned int top = 0;
    unsigned int kake;
    unsigned int agari;
    int i, t;
    result[0] = 1;
    for(kake = 2; kake <= 100; kake++){
        agari = 0;
        for(i = 0; i <= top; i++){
            t = result[i] * kake;
            t = t + agari;
            agari = t / 10000;
            result[i] = t % 10000;
        }
        if(agari > 0){
            top++;
            result[top] = agari;
        }
    }
    for(i = top; i >= 0; i--){
        printf("%d", result[i]);
    }return 0;
}
```
## 完成したプログラムのリスト
```s
            .data
result:     .word	    0:40
str:        .asciiz	"\n"
            .text
            .align	2
            .globl	main
main:
            li      $t0, 0              # top = 0
            li	    $t5, 1              # レジスタ$t5に即値１をロード
            sw	    $t5, result($0)     # result[0] = 1
            li	    $t1, 2              # kake = 2
for_kake:
            li	    $t2, 0              # agari = 0
            li	    $t3, 0              # i = 0
for_i:
            sll	    $t6, $t3, 2         # レジスタ$t3の内容を２ビット左へ論理シフト
            lw	    $t5, result($t6)    # reslut[i]
            mult	$t5, $t1            # reslut[i] * kake
            mflo	$t4                 # t = result[i] * kake
            add	    $t4, $t4, $t2       # t = t + agari
            li	    $t5, 10000          # レジスタ$t5に即値10000をロード
            div	    $t4, $t5            # t / 10000
            mflo	$t2                 # agari = t / 10000
            mfhi	$t6                 # t % 10000
            sll	    $t7, $t3, 2         # レジスタ$t3の内容を２ビット左へ論理シフト
            sw	    $t6, result($t7)    # reslut[i] = t % 10000
            addi	$t3, $t3, 1         # i++
            ble	    $t3, $t0, for_i     # i <= topならばラベルfor_iへ
            ble	    $t2, $0, else       # agari <= 0ならばラベルelseへ
            addi	$t0, $t0, 1         # top++
            sll	    $t5, $t0, 2         # レジスタ$t0の内容を２ビット左へ論理シフト
            sw	    $t2, result($t5)    # result[top] = agari
else:
            addi	$t1, $t1, 1         # kake++
            li	    $t5, 100            # レジスタ$t5に即値100をロード
            ble	    $t1, $t5, for_kake  # kake <= 100ならばラベルfor_kakeへ
            move	$t3, $t0            # レジスタ$t3にレジスタ$t0の保持するアドレスを格納
print:
            sll	    $t5, $t3, 2         # レジスタ$t3の内容を２ビット左へ論理シフト
            lw	    $a0, result($t5)    # reslut[i]呼び出し
            li	    $v0, 1              # print_int出力
            syscall                     # 実行結果表示
            subu	$t3, $t3, 1         # i--
            bge	    $t3, $0, print      # i >= 0 ならばラベルprintへ
            la	    $a0, str            # asciizで保存したプリントする文字列のアドレスをレジスタ a0 に格納
            li	    $v0, 4              # print_string出力
            syscall                     # 改行表示
            j       $ra                 # 呼び出し側に戻る

```
## プログラムの説明
```txt
ラベルmain内において、
1行目でレジスタ$t0に即値0をロードする。
2行目でレジスタ$t5に即値１をロードする。
3行目でresult + 0が示すメモリ番地にレジスタ$t5の内容を1ワードとして格納する。
4行目でレジスタ$t1に即値2をロードする。
上記の動作の後、ラベルfor_kakeに入る。ラベルfor_kake内では、
1行目でレジスタ$t2に即値０をロードする。
2行目でレジスタ$t3に即値０をロードする。
上記の動作の後、ラベルfor_iに入る。ラベルfor_i内では、
1行目でレジスタ$t3の内容を２ビット左へ論理シフトしたものをレジスタ$t6に格納する。
2行目でresult + $t6のアドレスの内容をレジスタ$t5に格納する。
3行目でレジスタ$t5の値とレジスタ$t1の値で乗算を行う。
4行目でレジスタ$t4に乗算の結果を格納する。
5行目でレジスタ$t4に$t4 + $t2の価を格納する。
6行目でレジスタ$t5に即値10000をロードする。
7行目でレジスタ$t4の値とレジスタ$t5の値で除算を行う。
8行目で余りをレジスタ$t2に格納する。
9行目で商をレジスタ$t6に格納する。
10行目でレジスタ$t3の内容を２ビット左へ論理シフトしたものをレジスタ$t7に格納する。
11行目でresult + $t7が示すメモリ番地にレジスタ$t6の内容を1ワードとして格納する。
12行目でレジスタ$t3に１を加算する。
13行目でレジスタ$t3の値を比較する。$t0以下ならばラベルfor_iへ
14行目でレジスタ$t21の値を比較する。0以下ならばラベルelseへ
15行目でレジスタ$t0に１を加算する。
16行目でレジスタ$t0の内容を２ビット左へ論理シフトしたものをレジスタ$t5に格納する。
17行目でresult + $t5が示すメモリ番地にレジスタ$t2の内容を1ワードとして格納する。
ラベルelse内では、
1行目でレジスタ$t1に１を加算する。
2行目でレジスタ$t5に即値100を格納する。
3行目でレジスタ$t1の値を比較する。$t5以下ならばラベルfor_kakeへ
4行目でレジスタ$t3にレジスタ$t0の保持するアドレスを格納する。
上記の動作の後、ラベルprintに入る。print内では、
1行目でレジスタ$t3の内容を２ビット左へ論理シフトしたものをレジスタ$t5に格納する。
2行目でresult + $t5のアドレスの内容をレジスタ$a0に格納する。
3行目でprint_intのシステムコールコードは１
4行目で計算結果を表示する。
5行目でレジスタ$t3から１を減算する。
6行目でレジスタ$t3の値を比較する。０以上ならばラベルprintへ
7行目でasciizで保存したプリントする文字列のアドレスをレジスタ$a0に格納する。
8行目でprint_stringのシステムコールコードは４
9行目で改行する。
10行目で呼び出し側に戻る。
```
## 実行結果、および、その実行結果の正しさの説明
```txt
933262154439441526816992388562667049071596826438162146859296389521759999322991560894146397615651828625369792082722375825118
