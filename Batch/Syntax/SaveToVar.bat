@echo off

set var=

:: 通过for命令把执行结果截取出来
for /f "tokens=*" %%i in ('echo VALUE X') do set var=%%i
echo %var%

 

pause