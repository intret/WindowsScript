@echo off 
:: 
:: 
:began 
set /p mystr=����Ҫ���㳤�ȵ��ַ���: 
echo %mystr:~0,1% | findstr /i "q" 1>nul 2>nul && exit rem ����q�˳� 
call :bflen "%mystr%" rem ���������bflen�����س��ȵ�����ret�С� 
echo �ַ���: "%mystr%" 
echo ��  ��: %ret% 
goto began 
:bflen rem ���鷳����ʼ��Ҫ�����ó����� 
set num= 
set str= 
set ret= 
set str=%1 
:len rem �����ַ������� 
set str=%str:~0,-1% 
set /a num = %num% + 1 
if defined str goto len 
set /a ret = %num% - 2 
set num= 
goto :eof 