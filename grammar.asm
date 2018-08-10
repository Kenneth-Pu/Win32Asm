;KERNEL32.DLL	系统服务功能，包括内存管理、任务管理和动态链接。
;GDI32.DLL		图形设备接口。利用VGA与DRV之类的显示设备驱动程序完成显示文本和矩形等功能
;USER32.DLL		用户接口服务，建立窗口和传递消息。
;使用TCP/IP协议进行网络通信的DLL是Wsock32.dll,它提供的API称为Socket API
;HWND LPCTSTR UINT 实际上就是汇编中的dword
;MessageBox proto hWnd:dword,lpText:dword,lpCaption:dword,uType:dword
;MessageBox proto :dword,:dword,:dword,:dword
;	push uType
;	push lpCaption
;	push lpText
;	push hWnd
;	call MessageBox
;Proto伪指令的格式
;uType定义对话框的类型，这个参数可以是以下标志的集合。
;函数名 Proto [距离] [语言] [参数1]：数据类型，[参数2]：数据类型，……
;伪指令invoke MessageBox,NULL,offset szText,offset szCaption,MB_OK
;MessageBox		equ		<MessageBoxA>
;Win32环境中,库文件只留有函数的定位信息和参数数目等简单信息，这种库文件叫做导入库
;includelib告诉链接器在链接的时候到指定的库文件中去找API函数的位置信息
;标号，变量，数据结构
;标号名：	目的地址	;方法1			标号名作用域是当前子程序
;标号名::	目的地址	;方法2			标号名作用域是整个程序
;@@做标号时可以用@F和@B引用，@F表示本条指令后的第一个@@标号，@B表示本条指令前的第一个@@标号。
;全局变量的作用域在整个程序，定义在.data和.data?段内。
;全局变量的初始化
;局部变量
;MASM用local伪指令提供对局部变量的支持
;local 变量名1 [[重复数量]][:类型],变量名2[[重复数量]][:类型]......
;call指令后，CPU把返回地址压入堆栈，再跳转到子程序执行。
;leave指令等价于mov esp,ebp 和 pop ebp
;全局变量起始值为0，局部变量起始值是随机的，是其他子程序执行后堆栈里留下的垃圾。
;数据结构的写法
;	结构名	struct
;
;	字段1	类型	?
;	字段2	类型	?
;	......
;	
;	结构名	ends
;movzx无符号扩展
;movsz有符号扩展
;sizeof伪指令可以取得变量，数据结构或数据类型以字节为单位的长度。
;lengthof可以取得变量中数据的项数。
;offset取变量地址的伪指令。
;lea用来取指针的地址
;addr伪指令
;子程序定义
;StdCall 子程序清除堆栈
;高级语法
