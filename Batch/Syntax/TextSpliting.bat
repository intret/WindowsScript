@echo off
setlocal enabledelayedexpansion

set str="abcde"
set a=
:l
if "!str!"=="" goto end
set a=!str:~0,1!
echo !a!
set str=!str:~1!
goto l
:end

pause
set str=".txt;.doc;.docx;.ppt;.pptx;.pdf;.rtf"
for /f "delims=; tokens=1,5*" %%i in (%str%) do (
echo %%i  %%j  %%k  %%l %%m
)
pause