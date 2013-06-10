@echo off
reg add HKCR\.h\ShellNew /v nullfile /f >nul
reg add HKCR\hfile /ve /d "cpp header file." /f >nul

reg add HKCR\.cpp\ShellNew /v nullfile /f >nul
reg add HKCR\cppfile /ve /d "cpp source file." /f >nul
pause