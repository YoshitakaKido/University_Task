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
