;模块和句柄
;一个模块代表的是一个运行中的exe文件或dll文件，用来代表这个文件中的所有代码和资源
;磁盘上的文件不是模块，装入内存后运行时就叫做模块
;每一个模块都有一个唯一的模块句柄来标识
;在win32中，模块句柄在数值上等于程序在内存中装入的起始地址
;取模块句柄使用的API函数是GetModuleHandle
;invoke GetModuleHandle,lpModuleName
;lpModuleName参数是一个指向含有模块名称字符串的指针
;如果用NULL调用GetModuleHandle，那么得到调用是调用者本模块的句柄
;在win32中，实例句柄就是模块句柄;
;句柄，Windows用来表示各种资源的编号，只有Windows才知道怎样使用它来引用各种资源
;创建窗口
;类，主要是为了把一组物体的相同属性归纳整理起来封装在一起，以便重复使用，在类已定义的属性基础上
;加上其它个性化的属性，就形成了各式各样的个体。
;建立窗口类的方法是在系统中注册，注册窗口类的API函数是RegisterClassEx
;一个窗口类定义了窗口的主要属性。
;这些属性并不是分成多个参数传递过去的，而是定义在一个WNDCLASSEX结构中，再把结构的地址当参数一次性传递给RegisterClassEx。
WNDCLASSEX			STRUCT
	cbsize			DWORD	?			;结构的字节数
	style   		DWORD	?			;类风格
	lpfnwndproc		DWORD	?			;窗口过程的地址
	cbclsextra		DWORD	?			
	cbwndextra		DWORD	?
	hinstance		DWORD	?			;所属的实例句柄
	hicon			DWORD	?			;窗口图标
	hcursor			DWORD	?			;窗口光标
	hbrbackground	DWORD	?			;背景色
	lpszmenuname	DWORD	?			;窗口菜单
	lpszclassname	DWORD	?			;类名字符串地址
	hiconsm			DWORD	?			;小图标
WNDCLASSEX			ENDS
;局部变量使用前必须初始化,使用RtlZeroMemory
;LoadCursor获取光标句柄
;一个窗口过程可以为多个窗口服务,只要这些窗口是基于同一个窗口类建立的.
;使用类的原因是定义窗口的共性,建立窗口时指定窗口的很多个性化的参数.
;建立窗口时的属性都是用单个参数的方式传递.
;建立窗口的函数是CreateWindowEx
invoke 	CreateWindowEx,dwExStyle,lpClassName,lpWindowName,dwStyle,\
		x,y,nWidth,nHeight,hWndParent,hMenu,hInstance,lpParam
;建立窗口口eax传回来的是窗口句柄
;ShowWindow用来显示窗口,ShowWindow也可以用在别的地方,主要用来控制窗口的显示状态(显示或隐藏),大小控制(最大化,最小化,原始大小)
;和是否激活(当前窗口还是背后的窗口),第一个参数是窗口句柄,第二个参数是显示的方式.
;updateWindow绘制客户区,实际上就是发送一个WM_PAINT消息.
