;アイコン設定
Menu, Tray, Icon, %A_WinDir%\System32\inetcpl.cpl, 1
;おまじない
#InstallKeybdHook
#HotkeyInterval 100
#UseHook

;disable CAPSLOCK
SetCapsLockState, AlwaysOff

;Change Base Bindings
Delete::`
RAlt::RWin

;Disable WindowsKey
LWin & RWin Up::return
RWin & LWin Up::return
RWin::return
LWin::return
RWin Up::return
LWin Up::return

;Reload/Suspend/Exit AHK
RAlt & ,::
XButton2 & MButton::
	Suspend, Permit
	reloadAHK()
return
RAlt & .::
XButton1 & MButton::
	Suspend, Permit
	suspendAHK()
return
RAlt & /::
F20 & MButton::
	Suspend, Permit
	exitAHK()
return

;AltTab
XButton1 & WheelUp::ShiftAltTab
XButton1 & WheelDown::AltTab

;IME切替
LShift Up::IME_EN()
RShift Up::IME_JP()

;include参照先をmyAHKComponents直下に
#include %A_ScriptDir%\myAHKComponents
;もろもろバインド
#include MBindListener.ahk
#include MBindSetting.ahk
#include MBind.ahk
;Library(バインドは持たないがグローバル変数の干渉に注意)
#include Library\_STD.ahk
#include Library\Clip.ahk
#include Library\Mouse.ahk
#include Library\Web.ahk
#include Library\IntoRemoteDesktop.ahk
#include Library\Logger.ahk
#include Library\IME.ahk
;TempMacroのInclude
#include Resources\TempMacro\MacroZ.ahk
#include Resources\TempMacro\MacroX.ahk
#include Resources\TempMacro\MacroC.ahk
;IfWinActives(特定Window/App上で有効になるバインドセット)
#include IfWinActives\_General.ahk
#include IfWinActives\MS_Code.ahk
#include IfWinActives\MS_Outlook.ahk
#include IfWinActives\MS_Excel.ahk
#include IfWinActives\IntelliJ.ahk
#include IfWinActives\MPC.ahk
#include IfWinActives\TTM.ahk