#include <stdio.h>

int main(void) {
  unsigned int x = 0x87654321;
  unsigned int y = 0x000000FF;
  unsigned int z = x & y;
  // x = 1000 0111 0110 0101 0100 0011 0010 0001
  // y = 1000 0111 0110 0101 0100 0011 0010 0001
  // z = 0000 0000 0000 0000 0000 0000 0010 0001
  printf("%08x & %08x = %08x\n", x, y, z);
  
  y = 0xFF000000;
  z = x | y;
  // x = 1000 0111 0110 0101 0100 0011 0010 0001
  // y = 1111 1111 0000 0000 0000 0000 0000 0000
  // z = 1111 1111 0110 0101 0100 0011 0010 0001
  printf("%08x & %08x = %08x\n", x, y, z);
  
  return 0;
}