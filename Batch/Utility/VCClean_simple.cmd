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

::.opt ���̹��ڿ��������Ĳ����ļ����繤����λ�õ���Ϣ��   
::.aps (AppStudio File),��Դ�����ļ�,�����Ƹ�ʽ,һ�㲻��ȥ����.   
::.clw ClassWizard��Ϣ�ļ�,ʵ������INI�ļ��ĸ�ʽ,
::     ����Ȥ�����о�һ��.��ʱ��ClassWizard������,
::     �ֹ��޸�CLW�ļ����Խ��.������ļ������ڵĻ�,
::     ÿ����ClassWizard��ʱ�����ʾ���Ƿ��ؽ�.   
::.dsp (DeveloperStudio Project):��Ŀ�ļ�,�ı���ʽ,
::     ��������Ϥ�Ļ���Ҫ�ֹ��޸�.DSW(DeveloperStudio
::     Workspace)�ǹ������ļ�,�����ص��DSP���.   
::.plg �Ǳ�����Ϣ�ļ�,����ʱ��error��warning��Ϣ�ļ�
::     ��ʵ������һ��html�ļ���,һ���ô�����.��Tools->Options
::     �����и�ѡ����Կ�������ļ�������.   
::.hpj (Help Project)�����ɰ����ļ��Ĺ���,��microsfot 
::     Help Compiler���Դ���.   
::.mdp (Microsoft DevStudio Project)�Ǿɰ汾����Ŀ�ļ�,
::     ���Ҫ�򿪴��ļ��Ļ�,����ʾ���Ƿ�ת�����µ�DSP��ʽ.   
::.bsc �����������Ŀ��Ϣ��,�����Source Brower�Ļ��ͱ�������
::     ���ļ�.�������������ܵĻ�,������Project Options����
::     ȥ��Generate Browse Info File,���Լӿ�����ٶ�.   
::.map ��ִ���ļ���ӳ����Ϣ��¼�ļ�,���Ƕ�ϵͳ�ײ�ǳ���Ϥ,
::     ����ļ�һ���ò���.   
::.pch (Pre-Compiled File)��Ԥ�����ļ�,���Լӿ�����ٶ�,������
::     ���ǳ���.   
::.pdb (Program Database)��¼�˳����йص�һЩ���ݺ͵�����Ϣ,
::     �ڵ��Ե�ʱ���������.   
::.exp ֻ���ڱ���DLL��ʱ��Ż�����,��¼��DLL�ļ��е�һЩ��Ϣ.
::     һ��Ҳûʲô��.   
::.ncb �ޱ�������ļ�(no compile browser)�����Զ���ɹ��ܳ���
::     ��ʱ����ɾ�����ļ���build����Զ����ɡ� 