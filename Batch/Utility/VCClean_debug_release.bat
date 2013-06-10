@echo off
dir /b /s debug>>files.txt
dir /b /s release>>files.txt
pause
for /f "usebackq delims==" %%i in (files.txt) do rd /s /q "%%i"
del /q files.txt
@echo on 