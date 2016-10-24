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
