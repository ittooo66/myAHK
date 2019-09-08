;icon settings
Menu, Tray, Icon, %A_WinDir%\System32\inetcpl.cpl, 1

;Majinai
#InstallKeybdHook
#HotkeyInterval 100
#UseHook

;preload eventhook def
#include %A_ScriptDir%\myAHKComponents
#include Library\EventHookDef.ahk

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

;AHK Control
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

;IME
LShift Up::IME_EN()
RShift Up::IME_JP()

;MBind
#include MBindListener.ahk
#include MBindSetting.ahk
#include MBind.ahk
;Library
#include Library\_STD.ahk
#include Library\Clip.ahk
#include Library\Mouse.ahk
#include Library\Web.ahk
#include Library\IntoRemoteDesktop.ahk
#include Library\Logger.ahk
#include Library\IME.ahk
#include Library\EventHook.ahk
;TempMacro
#include Resources\TempMacro\MacroZ.ahk
#include Resources\TempMacro\MacroX.ahk
#include Resources\TempMacro\MacroC.ahk
;IfWinActives
#include IfWinActives\_HookDef.ahk
#include IfWinActives\_General.ahk
#include IfWinActives\MS_Powerpoint.ahk
#include IfWinActives\MS_Excel.ahk