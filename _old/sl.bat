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
ssh %SVNAME%

if %ERRORLEVEL% NEQ 0 (
	echo SSH�ڑ��G���[�ł��B�[����SSH�ڑ��ݒ�i~/.ssh/config�j���m�F���Ă�������
	exit /B 0
)

