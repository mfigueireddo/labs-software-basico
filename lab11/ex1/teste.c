#include <stdio.h>

int novonum(void) {
  int minhalocal;
  printf("numero: ");
  scanf("%d",&minhalocal);
  return minhalocal;
}

int main (void) {
  printf ("%d\n", novonum());
  return 0;
}