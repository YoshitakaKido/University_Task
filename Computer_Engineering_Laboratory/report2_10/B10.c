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
