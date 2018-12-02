;アイコン設定
Menu, Tray, Icon, %A_WinDir%\System32\inetcpl.cpl, 1
;おまじない
#InstallKeybdHook
#HotkeyInterval 100
#UseHook

;Base Bindings
Delete::`
RAlt::RWin
;Disable WindowsKey
LWin & RWin Up::return
RWin & LWin Up::return
RWin::return
LWin::return
RWin Up::return
LWin Up::return
RWin & Return::Send,{Return}{Left}
LWin & Return::Send,^{Return}

;Reload/Suspend AHK
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

;AltTab
XButton1 & WheelUp::ShiftAltTab
XButton1 & WheelDown::AltTab

;IME Change
RAlt & LAlt::Send,#{Space}
LShift::IME_SET(0)
RShift::IME_SET(1)

;include参照先をmyAHKComponents直下に
#include %A_ScriptDir%\myAHKComponents
;もろもろバインド
#include MBindListener.ahk
#include MBindSetting.ahk
#include MBind.ahk
;Library(バインドは持たないがグローバル変数の干渉に注意)
#include Library\HistoricalClip.ahk
#include Library\_STD.ahk
#include Library\_STRING.ahk
#include Library\IntelliScroll.ahk
#include Library\MouseControl.ahk
#include Library\FileLauncher.ahk
#include Library\IntoRemoteDesktop.ahk
#include Library\Logger.ahk
#include Library\IME.ahk
;TempMacroのInclude
#include Library\TempMacro.ahk
#include Resources\TempMacro\MacroZ.ahk
#include Resources\TempMacro\MacroX.ahk
#include Resources\TempMacro\MacroC.ahk
;IfWinActives(特定Window/App上で有効になるバインドセット)
#include IfWinActives\_General.ahk
#include IfWinActives\Explorer.ahk
#include IfWinActives\InternetExplorer.ahk
#include IfWinActives\Chrome.ahk
#include IfWinActives\IntelliJ.ahk
#include IfWinActives\Atom.ahk
#include IfWinActives\SakuraEditor.ahk
#include IfWinActives\MPC.ahk
#include IfWinActives\MS_Outlook.ahk
#include IfWinActives\MS_Word.ahk
#include IfWinActives\MS_Excel.ahk
#include IfWinActives\MS_PowerPoint.ahk
#include IfWinActives\MS_Visio.ahk
#include IfWinActives\Trello.ahk

;GuiEscape:GUI画面において、Escが入力された時に実行
GuiEscape:
	HistoricalClip_closeWindow()
	FileLauncher_closeWindow()
return
