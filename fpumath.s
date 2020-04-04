#fpumath.s - 浮点数运算
#((43.65/22)+(76.34*3.1)) / ((12.43*6)-(140.2/94.21))
.section .data
value1:
	.float 43.65
value2:
	.int 22
value3:
	.float 76.34
value4:
	.float 3.1
value5:
	.float 12.43
value6:
	.int 6
value7:
	.float 140.2
value8:
	.float 94.21
output:
	.asciz "Result: %f\n"
.section .text
.globl _start
_start:
	finit			#初始化fpu堆栈
	flds value1		#加载单精度浮点数value1到st[0]
	fidiv value2	#st[0]/value2并把结果存在st[0]
	flds value3		#加载单精度浮点数value3到栈顶
	fmul value4		#st[0]*value4并存在栈顶
	faddp 			#st[0]+st[1]，把结果存在st[1]，并把st[0]弹出
	flds value5		#加载单精度浮点数
	fimul value6	
	flds value7
	flds value8
	fdivrp			#st[1]/st[0]，把结果存在st[1]并把栈顶弹出
	fsubrp 			#st[1]-st[0]，把结果存在st[1]并把栈顶弹出
	fdivrp			#st[1]/st[0]，把结果存在st[1]并把栈顶弹出
	
	subl $8, %esp	#打印浮点数
	fstpl (%esp)
	push $output
	call printf
	add $12, %esp
	
	pushl $0		#退出程序
	call exit

