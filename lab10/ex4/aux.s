/*

int f(int x);

void map2 (int* um, int * outro, int n) {
  int i;
  for (i=0; i<n; i++)
    *(outro+i) = f(*(um+i));
}

*/

.text
.globl map2

map2:
    pushq %rbp
    movq %rsp, %rbp
    subq $16, %rsp
    movq %r12, -16(%rbp) /* backup "um" */
    movq %rbx, -8(%rbp) /* contador */
    
    movl $0, %ebx
    movq %rdi, %r12

for:
    cmpl %edx, %ebx
    jge fim

    imul $4, %ebx /* !!! */

    addq %rbx, %r12 /* !!! */
    movl %r12d, %edi
    call f

    addq %rbx, %rsi
    movl %eax, %esi

    sar $2, %ebx /* !!! */

    jmp for

fim:
    movq -16(%rbp), %r12
    movq -8(%rbp), %rbx
    leave
    ret
 