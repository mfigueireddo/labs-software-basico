
/*
float foo (double a, float b) {
  return (a+b)*(a-b);
}
*/

.globl foo
.text

foo:
    pushq %rbp
    movq %rsp, %rbp
    subq $32, %rsp
    movsd %xmm0, -8(%rbp)
    movsd %xmm1, -16(%rbp)

    /* xmm0 = conta 1 // xmm1 = conta 2 */
    
        

    movds -8(%rbp)
    movds -16(%rbp)
    ret
    leave
