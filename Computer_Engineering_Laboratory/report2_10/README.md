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
	t = 0;
	for(i = top; i >= 0; i--){
		printf("%04d ", result[i]);
		t++;
		if(t % 10 == 0)
			printf("\n");
	}return 0;
}
```
## 完成したプログラムのリスト

## プログラムの説明

## 実行結果、および、その実行結果の正しさの説明
```txt
9332621544394415268169923885626670490715968264381621468592963895217599993229915608941463976156518286253697920827223758251185210916864000000
```
