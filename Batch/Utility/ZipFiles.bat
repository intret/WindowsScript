::===========================================================
:: 文件名：ZipFiles.bat
:: 说  明：根据文件列表压缩文件到一个压缩文件。
:: 作  者：intret
:: 日  期：2012年8月5日
:: 用  法：
::
:: 修  改：
:: TODO: 压缩软件检测
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

echo     父目录：%parentPath%
echo 父目录名称：%parentFolder%

call:ZipFiles "z.7z" "%~n0.list" 7z 9
cd ..
call:ZipDir "!parentFolder!.zip" "%parentFolder%" zip 9

echo 脚本执行结束。

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
:: 压缩指定文件列表里文件成一个压缩文件
:: 
:: 参数%1：压缩后的文件路径
:: 参数%2：待压缩文件列表
:: 参数%3：压缩算法,zip,7z,rar
:: 参数%4：压缩级别,zip( 0|5|9 )、7z(0|1|5|7|9)
::==========================================
:ZipFiles

	set filename=%~1
	set listfile=%~2
	set method=%3
	set xlevel=%4
	call:msg2 "[ZipFiles] 开始压缩文件："
	call:msg2 "[ZipFiles]     生成文件:%filename%"
	call:msg2 "[ZipFiles]     文件列表:%listfile%"
	call:msg2 "[ZipFiles]     压缩算法:%method%"
	call:msg2 "[ZipFiles]     压缩级别:%xlevel%"

	:: 检测压缩软件
	set zipAppWinRAR=%ProgramFiles%\WinRAR\Rar.exe
	set zipAppHaoZip=%ProgramFiles%\HaoZip\HaoZipC.exe
	set zipApp7Zip=%ProgramFiles%\7-Zip\7z.exe

	call:msg2 "[ZipFiles] 检测已安装压缩软件..."

	set bFound=0
	if not exist "%zipAppHaoZip%" (set zipAppHaoZip=) else (set bFound=1&call:msg2  "[ZipFiles]     HaoZip : %zipAppHaoZip%.")
	if not exist "%zipAppWinRAR%" (set zipAppWinRAR=) else (set bFound=1&call:msg2  "[ZipFiles]     WinRAR : %zipAppWinRAR%.")
	if not exist "%zipApp7Zip%" (set zipApp7Zip=)     else (set bFound=1&call:msg2  "[ZipFiles]     7-Zip  : %zipApp7Zip%.")

	if "%bFound%"=="0" call:err      "找不到压缩软件"&goto :eof

	:: 压缩算法
	if "%method%"=="7z" (
		call:msg2 "[ZipFiles] 使用7z算法"
		if exist "%zipAppHaoZip%" (
			call:msg2 "[ZipFiles] 使用 HaoZip"
			"%zipAppHaoZip%" a -t7z -mx%xlevel% "%filename%" @%listfile%
			goto :eof
		)

		if exist %zipApp7Zip% (
			call:msg2 "[ZipFiles] 使用 7Zip"
			"%zipApp7Zip%" a -t7z -mx%xlevel% "%filename%" @%listfile%
			goto:eof
		)
	)

	if "%method%"=="zip" (
		call:msg2 "[ZipFiles] 使用 HaoZip"
		if exist "%zipAppHaoZip%" (
			call:msg2 "[ZipFiles] 使用 HaoZip"
			"%zipAppHaoZip%" a -tzip -mx%xlevel% "%filename%" @%listfile%
			goto :eof
		)
	)

goto :eof


::==========================================
:: 压缩目录
:: 
:: 参数%1：压缩后的文件路径
:: 参数%2：待压缩文件列表
:: 参数%3：压缩算法,zip,7z,rar
:: 参数%4：压缩级别,zip( 0|5|9 )、7z(0|1|5|7|9)
::==========================================
:ZipDir
	set filename=%~1
	set dirname=%~2
	set method=%3
	set xlevel=%4
	call:msg2 "[ZipDir] 开始压缩文件夹："
	call:msg2 "[ZipDir]     filename:%filename%"
	call:msg2 "[ZipDir]     dirname :%dirname%"
	call:msg2 "[ZipDir]     method  :%method%"
	call:msg2 "[ZipDir]     xlevel  :%xlevel%"

	:: 检测压缩软件
	set zipAppWinRAR=%ProgramFiles%\WinRAR\Rar.exe
	set zipAppHaoZip=%ProgramFiles%\HaoZip\HaoZipC.exe
	set zipApp7Zip=%ProgramFiles%\7-Zip\7z.exe

	call:msg2  "[ZipDir] 检测压缩软件："

	set bFound=0
	if not exist "%zipAppHaoZip%" (set zipAppHaoZip=) else (set bFound=1&call:msg2  "[ZipDir]     HaoZip : %zipAppHaoZip%.")
	if not exist "%zipAppWinRAR%" (set zipAppWinRAR=) else (set bFound=1&call:msg2  "[ZipDir]     WinRAR : %zipAppWinRAR%.")
	if not exist "%zipApp7Zip%" (set zipApp7Zip=)     else (set bFound=1&call:msg2  "[ZipDir]     7-Zip  : %zipApp7Zip%.")

	if "%bFound%"=="0" call:err      "找不到压缩软件"&goto :eof

	:: 压缩算法
	if "%method%"=="7z" (
		call:msg2 [ZipDir] 使用7z算法
		if exist "%zipAppHaoZip%" (
			call:msg2 [ZipDir] 使用 HaoZip
			"%zipAppHaoZip%" a -t7z -mx%xlevel% "%filename%" %dirname% -r
			goto :eof
		)

		if exist %zipApp7Zip% (
			call:msg2 [ZipDir] 使用 7Zip
			"%zipApp7Zip%" a -t7 -mx%xlevel% "%filename%" %dirname% -r
		)
	)

	if "%method%"=="zip" (
		call:msg2 [ZipDir] 使用 HaoZip
		if exist "%zipAppHaoZip%" (
			call:msg2 [ZipDir] 使用 HaoZip
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
