# report2_09

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
