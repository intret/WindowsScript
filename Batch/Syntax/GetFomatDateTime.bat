:: �����ӳ���
:: GetDateStr
:: GetTimeStr
:: StrLen

@echo off
setlocal EnableDelayedExpansion

::
:: �򵥷������ַ�����ȡ
::


::
:: ���𷽷����ַ����ָ�
::

set datestr=
set timestr=

call:GetDateStr datestr "-"
call:GetTimeStr timestr ":"

echo ���ڣ�%datestr%-%timestr%

pause
exit


::==========================================
:: ��ȡ��ʽ���������ַ���
:: ����%1�������ַ���
:: ����%2���ָ���
:: ������
::    set datestr=
::    call:GetDateStr datestr " "
::    echo %datestr%
::==========================================
:GetDateStr

set dateDelim=%~2
set retstr=
FOR /F "usebackq delims= " %%i IN (`echo %DATE%`) DO (
FOR /F "usebackq delims=-/ tokens=1,2,3" %%I IN (`echo %%i`) DO (
set %1=%%I%dateDelim%%%J%dateDelim%%%K
)
)
goto :eof

::==========================================
:: ��ȡ��ʽ����ʱ���ַ���
:: ����%1�������ַ���
:: ����%2���ָ���
:: ������
::    set timestr=
::    call:GetTimeStr timestr " "
::    echo %timestr%
::==========================================
:GetTimeStr
set timeDelim=%~2

FOR /F "usebackq delims= " %%i IN (`echo %TIME%`) DO (
FOR /F "usebackq delims=: tokens=1,2,3" %%I IN (`echo %%i`) DO (
set hour=%%I
set second=%%J
call:StrLen len "!hour!" 
if !len!==1 set hour=0!hour!

call:StrLen len "!second!" 
if !len!==1 set second=0!second!

set %1=!hour!%timeDelim%!second!
)
)
goto :eof


::==========================================
:: ��ȡ�ַ�������
::
:: ����%1��Ϊ���ر������ƣ����ܺ��ո�������ַ�
:: ����%2��Ϊ�ַ���(���пո���������������)
::==========================================
:StrLen
set str=%~2
if not defined str goto :eof
set Return=0
:CALC_STRLEN
set /a Return+=1
set str=%str:~0,-1%
if defined str goto CALC_STRLEN
if not "%1"=="" set %1=%Return%
goto :eof