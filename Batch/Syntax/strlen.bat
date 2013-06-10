@echo off 
:: Based on willsort's codes code by JM 2006-10-9 CMD@XP 
:: 出处：http://www.cn-dos.net/forum/viewthread.php?tid=19819 
set mystr= 
set /p mystr=字符串: 
if not defined mystr goto :eof 
set count=0 
setlocal enabledelayedexpansion 
:intercept 
set /a count+=1 
for /f %%i in ("%count%") do if not "!mystr:~%%i,1!"=="" goto intercept 
echo 长 度: %count% 
pause 
goto 
:eof 
