/*

struct X {
  int val1; // 8 bytes 0 1 2 3 4 5 6 7
  int val2; // 8 bytes 8 9 10 11 12 13 14 15
};

int f(int i, int v);

void boo (struct X *px, int n, int val) {
  while (n--) {
    px->val2 = f(px->val1, val);
    px++;
  }
}

*/

.text
.globl boo

boo:
    pushq %rbp
    movq %rsp, %rbp
    subq $16, %rsp
    movq %r12, -16(%rbp) /* backup ptr */
    movq %rbx, -8(%rbp) /* contador */
    
    movl %esi, %ebx
    movq %rdi, %r12

while:
    cmpl $0, %ebx
    je fim

    movl %edx, %esi
    call f
    movl %eax, 8(%r12)
    addq $16, %r12
    subl $1, %ebx
    jmp while

fim:
    movq -16(%rbp), %r12
    movq -8(%rbp), %rbx
    leave
    ret
