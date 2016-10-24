# report2_04

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
