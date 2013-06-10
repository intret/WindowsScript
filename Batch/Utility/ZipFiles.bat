::===========================================================
:: �ļ�����ZipFiles.bat
:: ˵  ���������ļ��б�ѹ���ļ���һ��ѹ���ļ���
:: ��  �ߣ�intret
:: ��  �ڣ�2012��8��5��
:: ��  ����
::
:: ��  �ģ�
:: TODO: ѹ��������
:: 
::===========================================================

@echo off
setlocal EnableDelayedExpansion

set parentPath=%~p0
set parentFolder=

:split
FOR /F "usebackq delims=\ tokens=1,*" %%i IN (`echo %parentPath%`) DO (
	if "%%j"=="" (set parentFolder=%%i&goto endsplt) else set parentPath=%%j&goto split
)
:endsplt

echo     ��Ŀ¼��%parentPath%
echo ��Ŀ¼���ƣ�%parentFolder%

call:ZipFiles "z.7z" "%~n0.list" 7z 9
cd ..
call:ZipDir "!parentFolder!.zip" "%parentFolder%" zip 9

echo �ű�ִ�н�����

pause
goto:eof

:msg
	echo %~1
goto:eof

:msg2
	echo      %~1
goto:eof

:err
	echo      *%~1
goto:eof


::==========================================
:: ѹ��ָ���ļ��б����ļ���һ��ѹ���ļ�
:: 
:: ����%1��ѹ������ļ�·��
:: ����%2����ѹ���ļ��б�
:: ����%3��ѹ���㷨,zip,7z,rar
:: ����%4��ѹ������,zip( 0|5|9 )��7z(0|1|5|7|9)
::==========================================
:ZipFiles

	set filename=%~1
	set listfile=%~2
	set method=%3
	set xlevel=%4
	call:msg2 "[ZipFiles] ��ʼѹ���ļ���"
	call:msg2 "[ZipFiles]     �����ļ�:%filename%"
	call:msg2 "[ZipFiles]     �ļ��б�:%listfile%"
	call:msg2 "[ZipFiles]     ѹ���㷨:%method%"
	call:msg2 "[ZipFiles]     ѹ������:%xlevel%"

	:: ���ѹ�����
	set zipAppWinRAR=%ProgramFiles%\WinRAR\Rar.exe
	set zipAppHaoZip=%ProgramFiles%\HaoZip\HaoZipC.exe
	set zipApp7Zip=%ProgramFiles%\7-Zip\7z.exe

	call:msg2 "[ZipFiles] ����Ѱ�װѹ�����..."

	set bFound=0
	if not exist "%zipAppHaoZip%" (set zipAppHaoZip=) else (set bFound=1&call:msg2  "[ZipFiles]     HaoZip : %zipAppHaoZip%.")
	if not exist "%zipAppWinRAR%" (set zipAppWinRAR=) else (set bFound=1&call:msg2  "[ZipFiles]     WinRAR : %zipAppWinRAR%.")
	if not exist "%zipApp7Zip%" (set zipApp7Zip=)     else (set bFound=1&call:msg2  "[ZipFiles]     7-Zip  : %zipApp7Zip%.")

	if "%bFound%"=="0" call:err      "�Ҳ���ѹ�����"&goto :eof

	:: ѹ���㷨
	if "%method%"=="7z" (
		call:msg2 "[ZipFiles] ʹ��7z�㷨"
		if exist "%zipAppHaoZip%" (
			call:msg2 "[ZipFiles] ʹ�� HaoZip"
			"%zipAppHaoZip%" a -t7z -mx%xlevel% "%filename%" @%listfile%
			goto :eof
		)

		if exist %zipApp7Zip% (
			call:msg2 "[ZipFiles] ʹ�� 7Zip"
			"%zipApp7Zip%" a -t7z -mx%xlevel% "%filename%" @%listfile%
			goto:eof
		)
	)

	if "%method%"=="zip" (
		call:msg2 "[ZipFiles] ʹ�� HaoZip"
		if exist "%zipAppHaoZip%" (
			call:msg2 "[ZipFiles] ʹ�� HaoZip"
			"%zipAppHaoZip%" a -tzip -mx%xlevel% "%filename%" @%listfile%
			goto :eof
		)
	)

goto :eof


::==========================================
:: ѹ��Ŀ¼
:: 
:: ����%1��ѹ������ļ�·��
:: ����%2����ѹ���ļ��б�
:: ����%3��ѹ���㷨,zip,7z,rar
:: ����%4��ѹ������,zip( 0|5|9 )��7z(0|1|5|7|9)
::==========================================
:ZipDir
	set filename=%~1
	set dirname=%~2
	set method=%3
	set xlevel=%4
	call:msg2 "[ZipDir] ��ʼѹ���ļ��У�"
	call:msg2 "[ZipDir]     filename:%filename%"
	call:msg2 "[ZipDir]     dirname :%dirname%"
	call:msg2 "[ZipDir]     method  :%method%"
	call:msg2 "[ZipDir]     xlevel  :%xlevel%"

	:: ���ѹ�����
	set zipAppWinRAR=%ProgramFiles%\WinRAR\Rar.exe
	set zipAppHaoZip=%ProgramFiles%\HaoZip\HaoZipC.exe
	set zipApp7Zip=%ProgramFiles%\7-Zip\7z.exe

	call:msg2  "[ZipDir] ���ѹ�������"

	set bFound=0
	if not exist "%zipAppHaoZip%" (set zipAppHaoZip=) else (set bFound=1&call:msg2  "[ZipDir]     HaoZip : %zipAppHaoZip%.")
	if not exist "%zipAppWinRAR%" (set zipAppWinRAR=) else (set bFound=1&call:msg2  "[ZipDir]     WinRAR : %zipAppWinRAR%.")
	if not exist "%zipApp7Zip%" (set zipApp7Zip=)     else (set bFound=1&call:msg2  "[ZipDir]     7-Zip  : %zipApp7Zip%.")

	if "%bFound%"=="0" call:err      "�Ҳ���ѹ�����"&goto :eof

	:: ѹ���㷨
	if "%method%"=="7z" (
		call:msg2 [ZipDir] ʹ��7z�㷨
		if exist "%zipAppHaoZip%" (
			call:msg2 [ZipDir] ʹ�� HaoZip
			"%zipAppHaoZip%" a -t7z -mx%xlevel% "%filename%" %dirname% -r
			goto :eof
		)

		if exist %zipApp7Zip% (
			call:msg2 [ZipDir] ʹ�� 7Zip
			"%zipApp7Zip%" a -t7 -mx%xlevel% "%filename%" %dirname% -r
		)
	)

	if "%method%"=="zip" (
		call:msg2 [ZipDir] ʹ�� HaoZip
		if exist "%zipAppHaoZip%" (
			call:msg2 [ZipDir] ʹ�� HaoZip
			"%zipAppHaoZip%" a -tzip -mx%xlevel% "%filename%" %dirname% -r
			goto :eof
		)
	)

goto :eof




:GetParentPath
	pushd ..
	set %1=%cd%
	popd
goto:eof
