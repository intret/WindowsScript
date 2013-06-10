@echo off

set file=For.txt

for /f "tokens=1" %%i in (%file%) do (
echo %%i
)
echo.

for /f "tokens=2" %%i in (%file%) do (
echo    %%i
)
echo.

for /f "tokens=1,2,4,5" %%i in (%file%) do (
echo %%i %%j     %%k %%l
)
echo.

for /f "tokens=1-2,4-5" %%i in (%file%) do (
echo %%i %%j     %%k %%l
)
echo.

for /f "tokens=1-3,5" %%i in (%file%) do (
echo %%i %%j %%k     %%l
)
echo.

for /f "tokens=2,*" %%i in (%file%) do (
echo %%i - %%j
)
echo.
pause