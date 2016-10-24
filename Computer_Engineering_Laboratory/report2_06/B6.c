#include <stdio.h>
#include <stdlib.h>

int array[15] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 0, 0, 0, 0, 0};

int main(){
	int * const from = array;
	int * const to = array + 5;
	int * p;
	for(p = array; p < array + 15; p++ )
		printf("%p : %d\n", p, *p);
	for(p = array + 15; p >= array + 5; p--)
		*p = p[from - to];
	for(p = array; p < array + 15; p++)
		printf("%p : %d\n", p, *p);
}

