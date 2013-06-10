:: [Purpose]
::    Clean the MS VC++ Project's temp files ...
:: [Author]
::    intret
:: [Date]
::    2011.04.08 YMD
:: [Version]
::    V1.3
:: [Revision]
::   1.2011-07-06 增加中间文件扩展名，来自VC工程属性页，配置属性/常规/常规/清除时要删除的扩展名
::   2.2011-07-10 增加删除隐藏的.user文件
::   
::---------------------------------------------------------------------------------------------
@echo off
color 2f
title VC++ Project Clean run at %DATE%_%TIME% 
::mode con:cols=70 lines=30

echo [1] Cleaning files.
del /S *.ncb *.user *.ncb *.opt *.obj *.ilk *.pdb *.plg *.aps *.bsc *.tmp *.trc *.pch *.idb *.exp *.sbr *.tlb *.tli *.tlh *.rsp *.pgc *.pgd *.meta *.sdf *.*log *.suo *.ipch
echo [2] Command complected.
:Exit
color 4f
pause>nul