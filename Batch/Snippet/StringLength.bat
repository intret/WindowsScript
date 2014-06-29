::
:: 功能：字符串长度计算
:: 说明：
:: 日期：2014年6月29日
:: 作者：intret
::
@echo off
setlocal EnableDelayedExpansion 

call:main
pause
goto:eof


::==========================================
:: 脚本入口
::==========================================
:main

	set str=Meow小姐
	call:StrLen len "%str%"
	echo str=%str%
	echo len=!len!
	
	echo.
	set str=""
	call:StrLen len "%str%"
	echo str=%str%
	echo len=!len!

	echo.
	set str=2
	call:StrLen len "%str%"
	echo str=%str%
	echo len=!len!
	
	echo.
	set str=12
	call:StrLen len "%str%"
	echo str=%str%
	echo len=!len!
	
goto:eof


::==========================================
:: 获取字符串长度
::
:: 参数%1：为返回变量名称，不能含空格或特殊字符
:: 参数%2：为字符串(如有空格，请用引号括起来)
::==========================================
:StrLen
	set _slstr=%~2
	if not defined _slstr set %1=0 & goto :eof
	
	set _sllen=0
	:CalculateStrlen
	set /a _sllen+=1
	set _slstr=%_slstr:~0,-1%
	if defined _slstr goto CalculateStrlen
	if not "%1"=="" set %1=%_sllen%
goto :eof