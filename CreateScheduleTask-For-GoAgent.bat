
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

title ��GoAgent���������мƻ�����

REM echo %~x1
REM echo %~nx1

if /i '%~1' == '' echo [����] ���goagent.exe��ִ���ļ��϶����ļ�"%~dpnx0"�ϡ�& echo. & pause & goto:eof
if /i not '%~x1' == '.exe' echo [����] ���.exe�ļ��϶����ļ�"%~dpnx0"�ϡ�& echo. & pause & goto:eof
if /i not '%~nx1' == 'goagent.exe' echo [����]����ļ���"%~nx1"�����goagent.exe�ļ��϶����ļ�"%~dpnx0"�ϡ�& echo. & pause & goto:eof

echo ���������ƻ����� GoAgent���������û���¼ʱ�Թ���ԱȨ�����г���
echo     GoAgent:"%1"

SCHTASKS /Create /SC ONLOGON /TN "GoAgent" /RL HIGHEST /TR "'"%~1"'"

:END
pause