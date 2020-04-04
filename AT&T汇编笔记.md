AT&T汇编笔记
============

笔记目的：捋一遍以当复习，备速查。

第8章 基本数学功能
------------------

### 8.1 整数运算

source和destination都不能同时是内存；

结果都存在destination；

source都可以是立即数、内存和寄存器；

```sql
#1.加法运算
	add source, destination		
	adc source, destination		#考虑进位的加法，实现长整数加法
#2.减法运算
	sub source, destination
	sbb source, destination		#考虑借位的减法，实现长整数加法
#3.递增递减
	dec destination
	inc destination
#4.乘法
	mul source		#不带符号的乘法，des是source的两倍长
	imul source		#带符号的乘法
	imul source, destination	#自行选择目标寄存器
	imul multiplier, source, destination	#自行选择立即数和寄存器
#5.除法
	div divisor		#无符号的除法，高位放余数，低位放商
	idiv divisor	#带符号除法，余数符号同被除数
#6.移位乘法
	sal destination		#左移1位
	sal %cl, destination	#左移%cl位
	sal shifter, destination	#左移立即数位
#7.移位除法
	shr
	sar
#8.循环移位
	rol
	ror
	rcl
	rcr
```

### 8.2 十进制运算

```sql
#1.不打包bcd的运算 —— 用于把二进制结果转换为不打包bcd格式
	aaa		#调整加法运算
	aas		#调整减法
    aam	  #调整乘法
    aad	   #除法
#2.打包bcd的运算
	daa		#调整加法
	das		#调整减法
```

### 8.3 逻辑操作

```
and source, destinnation
not
or
xor
```

第9章 高级数学功能
------------------

### 9.1 FPU环境

助记符是根据source决定的;

i表integer；

r是根据st[0]的位置定的;

```
#1.初始化fpu堆栈
	finit
#2.fld 压栈
	flds value1 加载单精度浮点数value1到st[0]
#3.fst获取栈顶
#4.加减乘除	
```





































