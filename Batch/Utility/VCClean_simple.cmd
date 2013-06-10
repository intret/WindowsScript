:: intret
:: Revision : 2010.11.4 
@echo off
del /S *.ncb
del /S *.opt
del /S *.obj
del /S *.ilk
del /S *.pdb
del /S *.plg
del /S *.aps
del /S *.bsc
del /S *.tmp
del /S *.trc
del /S *.pch
del /S *.idb
del /S *.exp
del /S *.sbr
::.res files are useful in C# project
::del /S *.res
::vs2010
del /S *.sdf
del /s *.user
del /s *.*log
del /s *.suo
del /s *.ipch

::.opt 工程关于开发环境的参数文件。如工具条位置等信息；   
::.aps (AppStudio File),资源辅助文件,二进制格式,一般不用去管他.   
::.clw ClassWizard信息文件,实际上是INI文件的格式,
::     有兴趣可以研究一下.有时候ClassWizard出问题,
::     手工修改CLW文件可以解决.如果此文件不存在的话,
::     每次用ClassWizard的时候绘提示你是否重建.   
::.dsp (DeveloperStudio Project):项目文件,文本格式,
::     不过不熟悉的话不要手工修改.DSW(DeveloperStudio
::     Workspace)是工作区文件,其他特点和DSP差不多.   
::.plg 是编译信息文件,编译时的error和warning信息文件
::     （实际上是一个html文件）,一般用处不大.在Tools->Options
::     里面有个选项可以控制这个文件的生成.   
::.hpj (Help Project)是生成帮助文件的工程,用microsfot 
::     Help Compiler可以处理.   
::.mdp (Microsoft DevStudio Project)是旧版本的项目文件,
::     如果要打开此文件的话,会提示你是否转换成新的DSP格式.   
::.bsc 是用于浏览项目信息的,如果用Source Brower的话就必须有这
::     个文件.如果不用这个功能的话,可以在Project Options里面
::     去掉Generate Browse Info File,可以加快编译速度.   
::.map 是执行文件的映像信息纪录文件,除非对系统底层非常熟悉,
::     这个文件一般用不着.   
::.pch (Pre-Compiled File)是预编译文件,可以加快编译速度,但是文
::     件非常大.   
::.pdb (Program Database)记录了程序有关的一些数据和调试信息,
::     在调试的时候可能有用.   
::.exp 只有在编译DLL的时候才会生成,记录了DLL文件中的一些信息.
::     一般也没什么用.   
::.ncb 无编译浏览文件(no compile browser)。当自动完成功能出问
::     题时可以删除此文件。build后会自动生成。 