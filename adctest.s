#adctest.c - 长整数加法
.code32		#32位和64位对指令支持不一样，pushl %ecx不能过
.section .data
data1:
	.quad 7252051615
data2:
	.quad 5732348928
output:
	.asciz "The result is %qd\n"
.section .text
.globl _start
_start:
	movl data1, %ebx
	movl data1+4, %eax
	movl data2, %edx
	movl data2+4, %ecx
	addl %ebx, %edx
	adcl %eax, %ecx
	pushl %ecx		#先进先打印
	pushl %edx
	push $output
	call printf
	addl $12, %esp
	pushl $0	
	call exit
