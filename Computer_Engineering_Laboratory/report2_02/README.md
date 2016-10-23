# Report2_02  

## 課題内容 - Contents
* 配列の和を求めるアセンブリ・プログラムを作成せよ
* レポートに以下を記述せよ  
    C言語版プログラムのリスト  
    完成下プログラムのリスト(コメントも記入)  
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
