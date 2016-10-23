# Report2_02  

## 課題内容 - Contents
* 配列の和を求めるアセンブリ・プログラムを作成せよ
* レポートに以下を記述せよ  
    C言語版プログラムのリスト  
    完成したプログラムのリスト(コメントも記入)  
    プログラムの流れ図(PAD版等でもよい)  
    プログラムの説明(200文字以上)  
    実行結果、および、その実行結果の正しさの説明  

## C言語版プログラム
```c
#include <stdio.h>
int array[] = {1, 2, 4, 8, 16, 32, 64, 128};
int main(){
    int sum = 0;
    int *a = array;
    int i = 8;
    do {
        int x = *a;
        sum = sum + x;
        a++;
        i--;
    } while(i != 0);
    printf("%d", sum);
    return 0;
}
```

## 完成したプログラムのリスト
```s

        .data                                   # データセグメントにデータを配置することを示す
array:  .word   1, 2, 4, 8, 16, 32, 64, 128
        .text                                   # 以下の記述をテキストセグメントに配置
        .align 2                                # 4byte境界になるように調整する
        .globl main
main:
        move    $a0, $0                         # sum = 0
        la      $t0, array                      # a = array
        li      $t1, 8                          # i = 8
loop:
        lw      $t2, 0($t0)                     # x = *a
        addu    $a0, $a0, $t2                   # sum = sum + x
        addu    $t0, $t0, 4                     # a ++
        subu    $t1, $t1, 1                     # i --
        bne     $t1, $0, loop                   # do ... while (i != 0)
        li      $v0, 1                          # printf("%d", sum)
        syscall
        move    $v0, $0                         # 返り値を$v0に設定
        j       $ra                             # 呼び出し側に戻る
```
