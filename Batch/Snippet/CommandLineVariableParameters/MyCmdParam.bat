::
:: �ļ���MyCmdParam.bat
:: ˵�����������ݸ�������ű��������У�������ѡ���˳��������ҵġ�
:: ʹ�ã�
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
:: �����в�������
::

set InvalidParam=
goto ParseCmdParam
:EndCmdParam

:: �������
if not '%InvalidParam%'=='' ( 
	echo ����ʶ������%InvalidParam% & color 4F & pause & goto:eof
)

echo �������������a=%a% b=%b% c="%c%"


echo.

call:ParseOptions "%c%"
echo ѡ�key1=!key1! key2=%key2% key3=%key3%

echo.
echo [ִ�����]
echo.
pause
goto:eof


::
:: �������ݸ���������������
:: Ҫʹ��GOTO����
:: 
:ParseCmdParam

	if not '%InvalidParam%'=='' goto EndCmdParam
 
	REM echo.
    REM echo ����1��%~1
	REM echo ����2��%~2
 
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
:: ���ܣ�����ѡ���ַ���
:: ������
::       %1��ѡ���ַ������磺"key1=yes key2=no key3=good"
:: 
::--------------------------------------------------
:ParseOptions
	
	if {%1}=={} exit /B 1

	set OptionString=%~1
	REM echo ���⣺%OptionString%	
		
	:ParseOptionsInternal
	for /f "tokens=1,* delims= " %%i in ("%OptionString%") do (
		REM ECHO.
		REM ECHO �ָ%%i
        REM ECHO ʣ�ࣺ%%j
		
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