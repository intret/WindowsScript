@echo off 
:: 
:: 
:began 
set /p mystr=输入要计算长度的字符串: 
echo %mystr:~0,1% | findstr /i "q" 1>nul 2>nul && exit rem 输入q退出 
call :bflen "%mystr%" rem 这两句调用bflen，返回长度到变量ret中。 
echo 字符串: "%mystr%" 
echo 长  度: %ret% 
goto began 
:bflen rem 真麻烦，初始化要单独拿出来。 
set num= 
set str= 
set ret= 
set str=%1 
:len rem 计算字符串长度 
set str=%str:~0,-1% 
set /a num = %num% + 1 
if defined str goto len 
set /a ret = %num% - 2 
set num= 
goto :eof 