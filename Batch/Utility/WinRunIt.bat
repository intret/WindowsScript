::
:: written by intret
:: ͨ�� Win+R �������ĳ������
::
@echo off&mode con cols=67 lines=10
title WIN+Run ���а�װ����

echo.
echo.
if '%1'=='' (
echo ʹ�ã�����ļ��϶����������ļ��ϣ�
echo.&pause&goto end
)
echo Ĭ��="%~d1%~p1%~n1%~x1"
echo Path="%~d1%~p1"
set /p key=�����뿪ʼ-���������ַ���
echo "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\%key%%~x1"
::Ĭ��ֵ
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\%key%%~x1" /ve /t REG_SZ /d "%~d1%~p1%~n1%~x1"
::Path
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\%key%%~x1" /v Path /t REG_SZ /d "%~d1%~p1"/f
pause

:end
exit