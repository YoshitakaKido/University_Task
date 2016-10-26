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
