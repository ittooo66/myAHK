@echo off

rem �T�[�o�ꎮ�̕\��
setlocal enabledelayedexpansion
set index=0
FOR /F %%i in ('"C:\Program Files\Oracle\VirtualBox\VBoxManage.exe" list vms') do (
	set /a index=index+1
	set SVNAME=%%i
	echo   !index!:!SVNAME:~1,-1!
)

rem �T�[�o�ԍ��̎擾
set /P SVNUM="�ڑ�����T�[�o�ԍ�����͂��Ă�������: "

rem �ԍ��ɑΉ�����T�[�o���̎擾
set SVNAME=""
set index=0
FOR /F %%i in ('"C:\Program Files\Oracle\VirtualBox\VBoxManage.exe" list vms') do (
	set /a index=index+1
	if !index! == %SVNUM% (
		set SVNAME=%%i
		set SVNAME=!SVNAME:~1,-1!
	)
)

rem �T�[�o�����擾�ł��Ȃ��ꍇ�A�I��
if %SVNAME% == "" (
	echo ���͂��ꂽ�ԍ��ɑΉ�����T�[�o���擾�ł��܂���B�ڑ��������I�����܂��B
	exit /B 0
)

echo %SVNAME%��SSH�ڑ������{���܂�
set SSH_BAT="C:\Users\ittoo\3D Objects\VirtualboxSFs\%SVNAME%\scripts\Server_SSH.bat"

rem SSH�ڑ��o�b�`�̑��݊m�F
if not exist %SSH_BAT% (
	echo �ȉ���SSH�ڑ��p�o�b�`�t�@�C�������݂��܂���B�ڑ��������I�����܂��B
	echo %SSH_BAT%
	exit /B 0
) 

rem SSH�ڑ��o�b�`�̎��s
%SSH_BAT%