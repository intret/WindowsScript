@echo off 

:: pushd �л���ָ��Ŀ¼������ָ�����·����
:: ��cd���ͬ���ǣ���ѵ�ǰ·������������Ȼ��ִ��popd��ʱ��Ȼ��
:: Ч����cd��ԭ����Ŀ¼һ��

echo                cd=%cd%
pushd .. 
echo pushd .. ֮��cd=%cd%
popd
echo popd     ֮��cd=%cd%

echo.
echo.
echo.

pushd D:\ 
echo pushd D:\֮��cd=%cd%
pushd E:\
echo pushd E:\֮��cd=%cd%

popd
echo pop      ֮��cd=%cd%
popd
echo pop      ֮��cd=%cd%

set myParentPath=

echo.
echo.

call:GetParentPath myParentPath
echo         ��Ŀ¼��%myParentPath%

call:GetParentPath2 myParentPath
echo ��Ŀ¼�ĸ�Ŀ¼��%myParentPath%

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
:: ���ܣ���ȡָ��Ŀ¼�ĸ�Ŀ¼
:: ������
::       %1, ���ر��ָ�Ŀ¼�ı���
::       %2, ָ��Ҫ��ȡ��Ŀ¼��·�� 
::
:GetPathParent
	currDir=%~2
	if /i '%currDir%'=='' exit /B 1
	
	
	
goto:eof

pause