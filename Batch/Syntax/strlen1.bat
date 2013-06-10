@echo off & setlocal EnableDelayedExpansion 
:: ¼ÆËã×Ö·û´®µÄ³¤¶È 
:: 
:: 
:began 
set mystr= 
set /p mystr=×Ö·û´®: 
if not defined mystr goto :eof 
for /l %%i in (0,1,1000) do if "!mystr:~%%i,1!"=="" set strlen=%%i && goto :_endfor 
:_endfor 
::echo ×Ö·û´®: "%mystr%" 
echo ³¤ ¶È: %strlen% 
set strlen= 
goto began 