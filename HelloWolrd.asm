;第一个win32程序
		.386								;.386用于告诉编译器在本程序中使用的指令集
		.model flat,stdcall						;.model用来定义程序工作的模式 flatWin32程序使用的模式，代码和数据共用4GB
		option casemap:none						;定义程序中的变量和子程序名是否对大小写敏感
;Include 文件定义
include windows.inc								;头文件
include user32.inc							
includelib user32.lib								;库函数
include kernel32.inc
includelib kernel32.lib
;数据段
		.const								; .stack堆栈段 .data一些初始化过的变量定义 .data?一些没有初始化过的变量定义 .const一些常量 .code代码
szCaption	db	'hello',0						; win32汇编不必考虑堆栈，系统会为程序分配一个向下扩展、足够大的段作为堆栈段，所以.stack段定义常常被忽略。
szText 		db	'helloworld',0
;代码段
		.code
start:
		invoke MessageBox,NULL,offset szText,offset szCaption,MB_OK	; int MessageBox(
		invoke ExitProcess,NULL						;	HWND hWnd,		父窗口句柄
										;	LPCTSTR lpText,		消息框的文字
		end start							;	LPCTSTR lpCaption,	标题文字
										;	UINT uType		消息框类型
										;	);
																		
										; VOID ExitProcess(
										;	UINT uExitCode		该进程和所有线程的退出代码
										;	);
