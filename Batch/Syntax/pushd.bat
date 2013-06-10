@echo off 

:: pushd 切换到指定目录，可以指定相对路径。
:: 与cd命令不同的是，会把当前路径保持起来，然后执行popd的时候然后
:: 效果与cd到原来的目录一样

echo                cd=%cd%
pushd .. 
echo pushd .. 之后，cd=%cd%
popd
echo popd     之后，cd=%cd%

echo.
echo.
echo.

pushd D:\ 
echo pushd D:\之后，cd=%cd%
pushd E:\
echo pushd E:\之后，cd=%cd%

popd
echo pop      之后，cd=%cd%
popd
echo pop      之后，cd=%cd%

set myParentPath=

echo.
echo.

call:GetParentPath myParentPath
echo         父目录：%myParentPath%

call:GetParentPath2 myParentPath
echo 父目录的父目录：%myParentPath%

pause

:GetParentPath2
	pushd ..
	pushd ..
	set %1=%cd%
	popd
	popd
goto:eof

:GetParentPath
	pushd ..
	set %1=%cd%
	popd
goto:eof


::
:: 功能：获取指定目录的父目录
:: 参数：
::       %1, 返回保持父目录的变量
::       %2, 指定要获取父目录的路径 
::
:GetPathParent
	currDir=%~2
	if /i '%currDir%'=='' exit /B 1
	
	
	
goto:eof

pause