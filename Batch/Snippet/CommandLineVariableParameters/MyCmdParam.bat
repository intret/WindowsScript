::
:: 文件：MyCmdParam.bat
:: 说明：解析传递给批处理脚本的命令行，命令行选项的顺序可以是乱的。
:: 使用：
::       MyCmdParam.bat -a "111" -b 222 -c "key1=yes key2=no key3=cat"
::
::=====================================================================

@echo off 
setlocal EnableDelayedExpansion


set a=
set b=
set c=

set key1=
set key2=
set key3=

::
:: 命令行参数解析
::

set InvalidParam=
goto ParseCmdParam
:EndCmdParam

:: 解析结果
if not '%InvalidParam%'=='' ( 
	echo 不能识别的命令：%InvalidParam% & color 4F & pause & goto:eof
)

echo 参数解析结果：a=%a% b=%b% c="%c%"


echo.

call:ParseOptions "%c%"
echo 选项：key1=!key1! key2=%key2% key3=%key3%

echo.
echo [执行完毕]
echo.
pause
goto:eof


::
:: 解析传递给批处理的命令参数
:: 要使用GOTO调用
:: 
:ParseCmdParam

	if not '%InvalidParam%'=='' goto EndCmdParam
 
	REM echo.
    REM echo 参数1：%~1
	REM echo 参数2：%~2
 
	if /i '%~1'=='' goto EndCmdParam

	if '%~1'=='-a' (
		set a=%~2
		shift
		shift
		goto ParseCmdParam
	)

	if '%~1'=='-b' (
		set b=%~2
		
		shift
		shift
		goto ParseCmdParam
	)

	if '%~1'=='-c' (
		set c=%~2
		
		shift
		shift
		goto ParseCmdParam
	)

	set InvalidParam=%~1

goto EndCmdParam


::-------------------------------------------------
:: 功能：解析选项字符串
:: 参数：
::       %1，选项字符串，如："key1=yes key2=no key3=good"
:: 
::--------------------------------------------------
:ParseOptions
	
	if {%1}=={} exit /B 1

	set OptionString=%~1
	REM echo 待解：%OptionString%	
		
	:ParseOptionsInternal
	for /f "tokens=1,* delims= " %%i in ("%OptionString%") do (
		REM ECHO.
		REM ECHO 分割：%%i
        REM ECHO 剩余：%%j
		
		if '%%i'=='' goto EndParseOptions
		
		for /f "tokens=1,2 delims==" %%a in ("%%i") do (
			
			REM echo    Key:%%a
			REM echo  Value:%%b
			
			if '%%a'=='key1' set key1=%%b
			if '%%a'=='key2' set key2=%%b
			if '%%a'=='key3' set key3=%%b
		)
		
		set OptionString=%%j
		goto ParseOptionsInternal
	)
	
	:EndParseOptions
	exit /B 0
	
goto:eof

goto:eof