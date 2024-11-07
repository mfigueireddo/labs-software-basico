/*

float foo (float a, float b) {
  return sin(a) + b;
}

double sin(double x);

*/

.globl foo
.text

foo:
    pushq %rbp
    movq %rsp, %rbp

    cvtss2sd %xmm0, %xmm0 /* (a) float -> double */
    cvtss2sd %xmm1, %xmm1 /* (b) float -> double */

    call sin /* a = sin(a) */

    addsd %xmm1, %xmm0 /* a = a + b */
    
    cvtsd2ss %xmm0, %xmm0

    leave
    ret
