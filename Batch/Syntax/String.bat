@echo off

set str=abc123ghi
::Spliting
echo %str%
echo %str:~2,3%
echo %str:~-3%
set str=%str:2=tt%
echo %str%

echo.
echo --------Lenght--------------
set count=0
set substr=%str%
:N
if not "%substr%"=="" (
set /a count+=1
set "substr=%substr:~1%"
goto N
)
echo.
echo    str:%str%
echo Lenght:%count%

echo.
echo --------Delay Expansion-----
set a=
setlocal enabledelayedexpansion
for /l %%i in (1,1,5) do (
set a=%%i
echo !a!
)
pause