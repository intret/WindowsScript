::
:: 文 件 名 : classify.bat
:: 说    明 ：将一个文件夹里面的文件进行分类整理。
:: 用    例 ：将本批处理文件放在桌面上，将桌面文件进行分类。
:: 作    者 : intret
:: 版    本 : ver 1.4
:: 最后修改 : 2012-05-27
:: 版本历史 : 
:: ver 1.4 by intret 2013/6/9
::    - 重新分类，目标文件夹不使用“**Files”的格式。
:: ver 1.3 by intret 
::    - 增加目标文件夹设置
:: ver 1.2 by intret
::    - 添加源码文件
::    -
:: ver 1.1 by intret 
::    - 添加压缩文件
:: ver 1.0 by intret
::    - 首次创建。
::    - 可以对常见快捷方式、文档、可执行程序、电子书、图片分类。
::    
::

@echo off

if '%1'=='' (
  set folder=Docs
) else (
  set folder=%1
)


::
:: 快捷方式
::
call :classify "%folder%\Shortcuts" "lnk url"
call :classify "%folder%\Documents" "doc docx ppt pptx xls xlsx pdf chm txt"
call :classify "%folder%\Exes" "exe msi dll sys"
call :classify "%folder%\Pictures" "jpg gif png tif bmp ico"
call :classify "%folder%\ZipFiles" "rar zip 7z"
call :classify "%folder%\Code" "c cpp hpp h hxx cxx java php xml"
goto END
pause
 
::
:: 文件分类子程序
::
:classify
set fExts=%~2
set fDstDir=%~1

echo.
echo ^> 调用文件分类子程序（%fExts%,%fDstDir%) 
setlocal EnableDelayedExpansion
if not exist "%fDstDir%" md "%fDstDir%"
:floop
FOR /F "usebackq tokens=1,* delims= " %%i IN (`echo %fExts%`) DO (
	REM echo ^| 正在处理扩展名.%%i ...
	if not "%%j"=="" (
		if exist *.%%i (
			REM echo ^| 开始移动文件...
			move *.%%i "%fDstDir%"
		) else (
			echo ^| WARN:不存在.%%i文件。
		)
		set fExts=%%j
		REM echo ^| 处理完毕。
		goto floop
	) else (
		REM echo ^| NOTE:最后一个扩展名.%%i
		if exist *.%%i (
			REM echo ^| 开始移动文件...
			move *.%%i "%fDstDir%"
		) else (
			echo ^| WARN:不存在.%%i文件。
		)
		REM echo ^| 处理完毕。
		goto fendloop
	)
)
:fendloop
echo ^> 文件分类子程序执行完毕。
goto :eof

:END
echo END.&pause>nul