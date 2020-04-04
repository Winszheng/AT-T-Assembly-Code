#stacktest.s - fpu入栈出栈
# fld - 压栈
# fst - 出栈
.section .data
value1:
	.int 40
value2:
	.float 92.4405
value3:
	.double 221.440321
.section:
	.lcomm int1, 4
	.lcomm control, 2
	.lcomm status, 2
	.lcomm result, 4
.section .text
.globl _start
_start:
	nop
	finit	#初始化fpu堆栈
	fstcw control	#把控制寄存器复制到内存位置
	fstsw status	#把状态寄存器复制到内存位置
	filds value1	#把双字压入堆栈
	fists int1		#获取双字值到int1
	flds value2		#单精度浮点数压栈
	flds value3		#双精度浮点数压栈
	fst %st(4)		#获取栈顶值到st[4]
	fxch %st(1)		#st[0]和st[1]交换
	fstps result	#获取栈顶并弹出
	
	movl $1, %eax
	movl $0, %ebx
	int $0x80
