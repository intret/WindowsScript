@echo off & setlocal EnableDelayedExpansion 
:: �����ַ����ĳ��� 
:: 
:: 
:began 
set mystr= 
set /p mystr=�ַ���: 
if not defined mystr goto :eof 
for /l %%i in (0,1,1000) do if "!mystr:~%%i,1!"=="" set strlen=%%i && goto :_endfor 
:_endfor 
::echo �ַ���: "%mystr%" 
echo �� ��: %strlen% 
set strlen= 
goto began 