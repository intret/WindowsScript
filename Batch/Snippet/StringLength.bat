::
:: ���ܣ��ַ������ȼ���
:: ˵����
:: ���ڣ�2014��6��29��
:: ���ߣ�intret
::
@echo off
setlocal EnableDelayedExpansion 

call:main
pause
goto:eof


::==========================================
:: �ű����
::==========================================
:main

	set str=MeowС��
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
:: ��ȡ�ַ�������
::
:: ����%1��Ϊ���ر������ƣ����ܺ��ո�������ַ�
:: ����%2��Ϊ�ַ���(���пո���������������)
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