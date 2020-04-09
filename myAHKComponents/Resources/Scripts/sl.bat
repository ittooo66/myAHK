@echo off

rem サーバ一式の表示
setlocal enabledelayedexpansion
set index=0
FOR /F %%i in ('"C:\Program Files\Oracle\VirtualBox\VBoxManage.exe" list vms') do (
	set /a index=index+1
	set SVNAME=%%i
	echo   !index!:!SVNAME:~1,-1!
)

rem サーバ番号の取得
set /P SVNUM="接続するサーバ番号を入力してください: "

rem 番号に対応するサーバ名の取得
set SVNAME=""
set index=0
FOR /F %%i in ('"C:\Program Files\Oracle\VirtualBox\VBoxManage.exe" list vms') do (
	set /a index=index+1
	if !index! == %SVNUM% (
		set SVNAME=%%i
		set SVNAME=!SVNAME:~1,-1!
	)
)

rem サーバ名を取得できない場合、終了
if %SVNAME% == "" (
	echo 入力された番号に対応するサーバを取得できません。接続処理を終了します。
	exit /B 0
)

echo %SVNAME%にSSH接続を実施します
ssh %SVNAME%

if %ERRORLEVEL% NEQ 0 (
	echo SSH接続エラーです。端末のSSH接続設定（~/.ssh/config）を確認してください
	exit /B 0
)

