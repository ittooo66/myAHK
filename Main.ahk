;icon settings
Menu, Tray, Icon, %A_WinDir%\System32\inetcpl.cpl, 1

;super global variable
global A_AppDir := A_WorkingDir . "\myAHKComponents\Resources\Apps"
global A_ResDir := A_WorkingDir . "\myAHKComponents\Resources"
global A_SpaceDownTime := 0
global A_SpaceDownFlag := 0
global A_SpaceConsumeFlag := 0
global A_HUE_BRI := getEnv("A_HUE_BRI") ;0~762
global A_HUE_CT := getEnv("A_HUE_CT") ;150~450

;MouseCursor Setting
execScripts("mouseCursor_black.ps1")

;Majinai
#InstallKeybdHook
#HotkeyInterval 100
#UseHook

;Components Root Directory
#include %A_ScriptDir%\myAHKComponents

;Preload settimer
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

;IME
LShift Up::IME_EN()
RShift Up::IME_JP()

;AHK Control
RAlt & ,::
XButton2 & MButton::
	Suspend, Permit
	splash("AHK reloading...",300)
	logger("ahk","AHK RELOADED")
	Reload
return
RAlt & .::
XButton1 & MButton::
	Suspend, Permit
	splash("AHK shutting down...",500)
	execScripts("mouseCursor_standard.ps1")
	logger("ahk","AHK EXIT")
	ExitApp
return

;MBind
#include MBindListener.ahk
#include MBindSetting.ahk
#include MBind.ahk
;Library
#include Library\_STD.ahk
#include Library\Clip.ahk
#include Library\IME.ahk
#include Library\Mouse.ahk
#include Library\Web.ahk
;IfWinActives
#include IfWinActives\HookDef.ahk
#include IfWinActives\General.ahk
#include IfWinActives\MS_Powerpoint.ahk
#include IfWinActives\MS_Excel.ahk

;TempMacro
#include Resources\TempMacro\MacroZ.ahk
#include Resources\TempMacro\MacroX.ahk
#include Resources\TempMacro\MacroC.ahk
#include Resources\TempMacro\MacroBRL.ahk
#include Resources\TempMacro\MacroBRR.ahk
#include Resources\TempMacro\MacroSLS.ahk
#include Resources\TempMacro\MacroSMC.ahk
#include Resources\TempMacro\MacroYEN.ahk
