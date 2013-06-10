::---------------------------------------------------------------------------------------
:: [Purpose]
::    使用该批处理文件来压缩文件夹，以达到备份源码工程的目的。
::    (可以把批处理放在工程或者解决方案目录里面)
:: [Author]
::    intret
:: [Date]
::    2011.04.07 YMD
:: [Version]
::    V2.0
:: [Revision]
::   1.[2011.04.08] 检查批处理文件是否在分区根目录中运行. 
::   2.[2011.04.14] 支持 HaoZip和7Zip.
::   3.[2011.04.19] 支持压缩文件中仅包含一个文件夹.
::   4.[2011.04.26] 修改压缩文件的命名方式，命令行RAR不支持压缩为.zip文件.
::   5.[2011.05.07] 修复Windows7上%date%的时间格式分隔符'/'引起分割失败的问题.
::   6.[2011.05.15] 1）修改压缩软件选择优先级，顺序HaoZip->WinRAR->7Zip.
::                      2）修复常见压缩文件搜索失败的处理.
::   7.[2011.07.09] 修改目标文件命名格式.
::   8.[2011.09.07] 修改文件名中的小时、分钟改为2个字符的宽度，
::                      如：2011-09-07-118 -> 2011-09-07-0118
::                      [NOTE] 使用了延迟展开 setlocal EnableDelayedExpansion
::   9.[2012.08.05] 更改所有过程为子过程调用，call:label
::---------------------------------------------------------------------------------------
@echo off
setlocal EnableDelayedExpansion

title 文件夹打包批处理 %DATE%_%TIME%
color 3f
::mode con:cols=70 lines=30

if "%~p0"=="\" (color 4f&echo [Error] This bat file can't run at a drive's root folder!&goto Exit)


:: 构造压缩文件名称
set dateStr=
set timeStr=
set folderName=

call:GetDateStr dateStr ""
call:GetTimeStr timeStr ""
call:GetFolderName folderName

set finalName=%folderName%-%dateStr%-%timeStr%

:: 进入上一级别目录，压缩当前目录
pushd %cd%
cd ..
call :ZipDir "%finalName%.7z" "%folderName%" 7z 9
popd

echo [执行完毕]
pause 
exit

::==========================================
:: 获取文件所在文件夹名称
::==========================================
:GetFolderName
set parentPath=%~p0
:split
FOR /F "usebackq delims=\ tokens=1,*" %%i IN (`echo %parentPath%`) DO (
if "%%j"=="" (set %1=%%i&goto endsplt) else set parentPath=%%j&goto split
)
:endsplt
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
echo [ZipDir] 参数列表：
echo [ZipDir]     输出文件:%filename%
echo [ZipDir]     目录名称:%dirname%
echo [ZipDir]     压缩算法:%method%
echo [ZipDir]     压缩级别:%xlevel%

:: 检测压缩软件
set zipAppWinRAR=%ProgramFiles%\WinRAR\Rar.exe
set zipAppHaoZip=%ProgramFiles%\HaoZip\HaoZipC.exe
set zipApp7Zip=%ProgramFiles%\7-Zip\7z.exe

echo [ZipDir] 检测已安装压缩软件...

set bFound=0
if not exist "%zipAppHaoZip%" (set zipAppHaoZip=) else (set bFound=1&echo [ZipDir]     HaoZip : %zipAppHaoZip%.)
if not exist "%zipAppWinRAR%" (set zipAppWinRAR=) else (set bFound=1&echo [ZipDir]     WinRAR : %zipAppWinRAR%.)
if not exist "%zipApp7Zip%" (set zipApp7Zip=)     else (set bFound=1&echo [ZipDir]     7-Zip  : %zipApp7Zip%.)

if "%bFound%"=="0" echo     Can't found the compression application.&goto :eof

:: 压缩算法

if "%method%"=="7z" (
if exist "%zipAppHaoZip%" (
echo [ZipDir] 使用 HaoZip 压缩为 7z
"%zipAppHaoZip%" a -t7z -mx%xlevel% "%filename%" %dirname% -r
goto :eof
)

if exist %zipApp7Zip% (
echo [ZipDir] 使用 7Zip
"%zipApp7Zip%" a -t7 -mx%xlevel% "%filename%" %dirname% -r
)
)

if "%method%"=="zip" (
if exist "%zipAppHaoZip%" (
echo [ZipDir] 使用 HaoZip 压缩为 zip
"%zipAppHaoZip%" a -tzip -mx%xlevel% "%filename%" %dirname% -r
goto :eof
)
)

goto :eof


::==========================================
:: 按照文件列表压缩文件
:: 
:: 参数%1：压缩后的文件路径
:: 参数%2：待压缩文件列表
:: 参数%3：压缩算法,zip,7z,rar
:: 参数%4：压缩级别,zip( 0|5|9 )、7z(0|1|5|7|9)
::==========================================
:ZipFileList

set filename=%~1
set listfile=%~2
set method=%3
set xlevel=%4
echo [ZipFileList] 参数列表：
echo [ZipFileList]     filename:%filename%
echo [ZipFileList]     listfile:%listfile%
echo [ZipFileList]     method  :%method%
echo [ZipFileList]     xlevel  :%xlevel%

:: 检测压缩软件
set zipAppWinRAR=%ProgramFiles%\WinRAR\Rar.exe
set zipAppHaoZip=%ProgramFiles%\HaoZip\HaoZipC.exe
set zipApp7Zip=%ProgramFiles%\7-Zip\7z.exe

echo [ZipFileList] 检测已安装压缩软件...

set bFound=0
if not exist "%zipAppHaoZip%" (set zipAppHaoZip=) else (set bFound=1&echo [ZipFileList]     HaoZip : %zipAppHaoZip%.)
if not exist "%zipAppWinRAR%" (set zipAppWinRAR=) else (set bFound=1&echo [ZipFileList]     WinRAR : %zipAppWinRAR%.)
if not exist "%zipApp7Zip%" (set zipApp7Zip=)     else (set bFound=1&echo [ZipFileList]     7-Zip  : %zipApp7Zip%.)

if "%bFound%"=="0" echo     Can't found the compression application.&goto :eof

:: 压缩算法

if "%method%"=="7z" (
echo [ZipFileList] 使用7z算法
if exist "%zipAppHaoZip%" (
echo [ZipFileList] 使用 HaoZip
"%zipAppHaoZip%" a -t7z -mx%xlevel% "%filename%" @%listfile%
goto :eof
)

if exist %zipApp7Zip% (
echo [ZipFileList] 使用 7Zip
"%zipApp7Zip%" a -t7 -mx%xlevel% "%filename%" @%listfile%
)
)

if "%method%"=="zip" (
echo [ZipFileList] 使用 HaoZip
if exist "%zipAppHaoZip%" (
echo [ZipFileList] 使用 HaoZip
"%zipAppHaoZip%" a -tzip -mx%xlevel% "%filename%" @%listfile%
goto :eof
)
)

goto :eof

::==========================================
:: 获取格式化的日期字符串
:: 参数%1：返回字符串
:: 参数%2：分隔符
:: 用例：
::    set datestr=
::    call:GetDateStr datestr " "
::    echo %datestr%
::==========================================
:GetDateStr

set dateDelim=%~2
set retstr=
FOR /F "usebackq delims= " %%i IN (`echo %DATE%`) DO (
FOR /F "usebackq delims=-/ tokens=1,2,3" %%I IN (`echo %%i`) DO (
set %1=%%I%dateDelim%%%J%dateDelim%%%K
)
)
goto :eof

::==========================================
:: 获取格式化的时间字符串
:: 参数%1：返回字符串
:: 参数%2：分隔符
:: 用例：
::    set timestr=
::    call:GetTimeStr timestr " "
::    echo %timestr%
::==========================================
:GetTimeStr
set timeDelim=%~2

FOR /F "usebackq delims= " %%i IN (`echo %TIME%`) DO (
FOR /F "usebackq delims=: tokens=1,2,3" %%I IN (`echo %%i`) DO (
set hour=%%I
set second=%%J
call:StrLen len "!hour!" 
if !len!==1 set hour=0!hour!

call:StrLen len "!second!" 
if !len!==1 set second=0!second!

set %1=!hour!%timeDelim%!second!
)
)
goto :eof


::==========================================
:: 获取字符串长度
::
:: 参数%1：为返回变量名称，不能含空格或特殊字符
:: 参数%2：为字符串(如有空格，请用引号括起来)
::==========================================
:StrLen
set str=%~2
if not defined str goto :eof
set Return=0
:CALC_STRLEN
set /a Return+=1
set str=%str:~0,-1%
if defined str goto CALC_STRLEN
if not "%1"=="" set %1=%Return%
goto :eof
