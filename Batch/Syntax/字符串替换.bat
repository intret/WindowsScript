@echo off


set str="202.22.22.1"

:: 把双引号替换为空
set str2=%str:"=%

:: 把双引号替换为单引号
set str3=%str:"='%

set set4=%str:.=:%


echo str:%str%
echo str2:%str2%
echo str3:%str3%
echo str4:%str4%

pause