#include <stdio.h>

typedef int (*funcp)(int x);

int add (int x) {
  return x+1;
}

int main(void){
    
    unsigned char codigo[] = { 0x55, 0x48, 0x89, 0xe5, 0xe8, 0x00, 0x00, 0x00, 0x00, 0xc9, 0xc3 };
    
    unsigned char *posCall = &codigo[4];
    unsigned char *posNext = &codigo[4+5];

    int diferenca = posNext - posCall;
    codigo[5] = diferenca;

    funcp f = (funcp)codigo;
    int i = (*f)(10);

    printf("%d\n", i);

    return 0;
}