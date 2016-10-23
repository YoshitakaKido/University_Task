#include <stdio.h>
int array[] = {1, 2, 4, 8, 16, 32, 64, 128};
int main(){
    int sum = 0;
    int *a = array;
    int i = 8;
    do {
        int x = *a;
        sum = sum + x;
        a++;
        i--;
    } while(i != 0);
    printf("%d", sum);
    return 0;
}
