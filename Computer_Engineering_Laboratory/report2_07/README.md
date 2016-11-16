# report2_07 - Elective subject -

## 課題内容 - Contents  

* コピー対象の領域の重なり具合が、report2_05とreport2_06のどちらの場合であっても、コピー方法を自動的に切り替えて、正しくコピーできるプログラムを作成せよ。  
* 完成したプログラムが正しく動作することを示すため、両方(report2_05, report2_06)のデータ領域に対する実行結果を明記すること

## C言語版プログラムのリスト
```c
#include <stdio.h>
#include <stdlib.h>

int array[15] = {0, 0, 0, 0, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
int array2[15] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 0, 0, 0, 0, 0};

int B5(){
	int * const from = array + 5;
    int * const to = array;
    int * p;
    for(p = array; p < array + 15; p++)
        printf("%p : %d\n", p, *p);
    printf("\n");
    for(p = array; p < array + 10; p++)
        *p = p[from - to];
    for(p = array; p < array + 15; p++)
        printf("%p : %d\n", p, *p);
	printf("\n");
}

int B6(){
	int * const from = array2;
	int * const to = array2 + 5;
	int * p;
	for(p = array2; p < array2 + 15; p++ )
		printf("%p : %d\n", p, *p);
	for(p = array2 + 15; p >= array2 + 5; p--)
		*p = p[from - to];
	printf("\n");
	for(p = array2; p < array2 + 15; p++)
		printf("%p : %d\n", p, *p);
}


int main(){
	
	if(array)
		B5();
	if (array2)
		B6();

	return 0;
}
```

## 完成したプログラムのリスト

## プログラムの説明

## 実行結果、および、その実行結果の正しさの説明
