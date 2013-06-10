@echo off


rem call the strlen subproc
set mystr=char123À²
call :strlen
echo str:%mystr%
echo len:%errorlevel%

goto END
rem string lenght function
:strlen
if not defined mystr echo strlen subproc needs the prarmeter 'mystr'
set /a len=0
setlocal enabledelayedexpansion 
for /l %%i in (0,1,1000) do if "!mystr:~%%i,1!"=="" set len=%%i && goto :break 
:break
exit /B %len%

:END
pause