::
:: written by intret
:: 通过 Win+R 快捷启动某个程序。
::
@echo off&mode con cols=67 lines=10
title WIN+Run 运行安装工具

echo.
echo.
if '%1'=='' (
echo 使用：请把文件拖动到批处理文件上！
echo.&pause&goto end
)
echo 默认="%~d1%~p1%~n1%~x1"
echo Path="%~d1%~p1"
set /p key=请输入开始-运行启动字符：
echo "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\%key%%~x1"
::默认值
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\%key%%~x1" /ve /t REG_SZ /d "%~d1%~p1%~n1%~x1"
::Path
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\%key%%~x1" /v Path /t REG_SZ /d "%~d1%~p1"/f
pause

:end
exit