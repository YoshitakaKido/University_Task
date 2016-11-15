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

## プログラムの説明

## 実行結果、および、その実行結果の正しさの説明
```txt
933262154439441526816992388562667049071596826438162146859296389521759999322991560894146397615651828625369792082722375825118
