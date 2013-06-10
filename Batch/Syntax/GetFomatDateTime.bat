:: 几个子程序：
:: GetDateStr
:: GetTimeStr
:: StrLen

@echo off
setlocal EnableDelayedExpansion

::
:: 简单方法：字符串截取
::


::
:: 负责方法；字符串分割
::

set datestr=
set timestr=

call:GetDateStr datestr "-"
call:GetTimeStr timestr ":"

echo 日期：%datestr%-%timestr%

pause
exit


::==========================================
:: 获取格式化的日期字符串
:: 参数%1：返回字符串
:: 参数%2：分隔符
:: 用例：
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
:: 获取格式化的时间字符串
:: 参数%1：返回字符串
:: 参数%2：分隔符
:: 用例：
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
:: 获取字符串长度
::
:: 参数%1：为返回变量名称，不能含空格或特殊字符
:: 参数%2：为字符串(如有空格，请用引号括起来)
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