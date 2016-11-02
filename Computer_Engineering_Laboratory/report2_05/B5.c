#include <stdio.h>
#include <stdlib.h>

int array[15] = {0, 0, 0, 0, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10};

int main(void){
    int * const from = array + 5;       //配列の5番目の要素のアドレスを格納     
    int * const to = array;             //配列の先頭要素のアドレスを格納
    int * p;                            //アドレスをコピーするためのポインタを宣言
    for(p = array; p < array + 15; p++) 
        printf("%p : %d\n", p, *p);
    printf("\n");
    for(p = array; p < array + 10; p++)
        *p = p[from - to];
    for(p = array; p < array + 15; p++)
        printf("%p : %d\n", p, *p);
    return 0;
}
