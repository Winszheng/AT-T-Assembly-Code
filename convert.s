#convert.s - Converting lower to upper case
.section .data
str1:
	.asciz "Damn Potter!\n"
length:
	.int 13
.section .text
.globl _start
_start:
	nop
	lea str1, %esi
	movl %esi, %edi
	movl length, %ecx
	cld	#递增
loop:
	lodsb
	cmp $'a', %al	#比较大小用的是destination和source的结果
	jl skip
	cmp $'z', %al
	jg skip
	subb $32, %al
skip:
	stosb
	loop loop
	#打印
	pushl $str1
	call printf
	addl $4, %esp
	pushl $0
	call exit
	
