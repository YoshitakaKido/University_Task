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
