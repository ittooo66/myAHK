;icon settings
Menu, Tray, Icon, %A_WinDir%\System32\inetcpl.cpl, 1

;super global variable
global A_AppDir := A_WorkingDir . "\myAHKComponents\Resources\Apps"
global A_ResDir := A_WorkingDir . "\myAHKComponents\Resources"
global A_SpaceDownTime := 0
global A_SpaceDownFlag := 0
global A_SpaceConsumeFlag := 0
global A_HUE_BRI := 0 ;0~254

;Majinai
#InstallKeybdHook
#HotkeyInterval 100
#UseHook

;preload eventhookdef/settimer
#include %A_ScriptDir%\myAHKComponents
#include Library\SetTimer.ahk

;Disable CAPSLOCK
sc03a::return

;Disable VKs
vkFF::return
vkEB::return

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

;AltTab
XButton1 & WheelUp::ShiftAltTab
XButton1 & WheelDown::AltTab
RWin & ]::AltTab
RWin & [::ShiftAltTab

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
#include Library\Logger.ahk
#include Library\IME.ahk
;TempMacro
#include Resources\TempMacro\MacroZ.ahk
#include Resources\TempMacro\MacroX.ahk
#include Resources\TempMacro\MacroC.ahk
;IfWinActives
#include IfWinActives\_HookDef.ahk
#include IfWinActives\_General.ahk
#include IfWinActives\MS_Powerpoint.ahk
#include IfWinActives\MS_Excel.ahk

;AHK Control
RAlt & ,::
XButton2 & MButton::
	Suspend, Permit
	tooltip, AHK reloading
	sleep 300
	tooltip
	logger_info("AHK RELOADED")
	Reload
return
RAlt & .::
XButton1 & MButton::
	Suspend, Permit
	tooltip, AHK shutting down
	sleep 800
	logger_info("AHK EXIT")
	ExitApp
return