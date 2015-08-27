
@echo off

:: BatchGotAdmin
:-------------------------------------
REM  --> Check for permissions
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    echo UAC.ShellExecute "%~0", "%~1", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    if exist "%temp%\getadmin.vbs" ( del "%temp%\getadmin.vbs" )
    pushd "%CD%"
    CD /D "%~dp0"
:--------------------------------------

title 给GoAgent添加随机运行计划任务

REM echo %~x1
REM echo %~nx1

if /i '%~1' == '' echo [错误] 请把goagent.exe可执行文件拖动到文件"%~dpnx0"上。& echo. & pause & goto:eof
if /i not '%~x1' == '.exe' echo [错误] 请把.exe文件拖动到文件"%~dpnx0"上。& echo. & pause & goto:eof
if /i not '%~nx1' == 'goagent.exe' echo [错误]你的文件是"%~nx1"，请把goagent.exe文件拖动到文件"%~dpnx0"上。& echo. & pause & goto:eof

echo 即将创建计划任务 GoAgent，任务将在用户登录时以管理员权限运行程序：
echo     GoAgent:"%1"

SCHTASKS /Create /SC ONLOGON /TN "GoAgent" /RL HIGHEST /TR "'"%~1"'"

:END
pause