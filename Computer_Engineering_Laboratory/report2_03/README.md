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
