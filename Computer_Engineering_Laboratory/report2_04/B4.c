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
