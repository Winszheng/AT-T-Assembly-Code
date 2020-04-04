#bubble.s - 冒泡排序
#思路是先设置基址
.section .data
values:
	.int 105, 235, 61, 315, 134, 221, 53, 145, 117, 5
.section .text
.globl _start
_start:
	movl $values, %esi
	movl $9, %ebx	#9次内层循环
	movl $9, %ecx	#9次外层循环
loop:
	movl (%esi), %eax	#第一个元素赋值给eax
	cmp %eax, 4(%esi)	#相邻元素作比较
	jge skip	#if(esi>=eax)jump to skip
	xchg %eax, 4(%esi)
	movl %eax, (%esi)	#eax就相当于temp
skip:
	add $4, %esi	#改变指针的位置
	dec %ebx	#内层循环做一次-1,之前写的是外层循环做一次+1,异曲同工
	jnz loop
	dec %ecx	#外层循环做一次-1
	jz end	#外层循环为0,做完
	movl $values, %esi
	movl %ecx, %ebx
	jmp loop	#无条件跳转
end:
	movl $1, %eax
	movl $0, %ebx
	int $0x80
	

