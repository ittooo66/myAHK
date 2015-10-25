;アイコン設定
Menu, Tray, Icon, %A_WinDir%\System32\inetcpl.cpl, 1
;おまじない
#InstallKeybdHook
;Library(グローバル変数持ちが一人(HistoricalClip)いるだけでフック力はなく無害)
#include %A_ScriptDir%\myAHKComponents\Library\IME.ahk
#include %A_ScriptDir%\myAHKComponents\Library\HistoricalClip.ahk
#include %A_ScriptDir%\myAHKComponents\Library\myLibrary.ahk
;マウス設定
#include %A_ScriptDir%\myAHKComponents\Mouse.ahk
;Winキー周り封印
#include %A_ScriptDir%\myAHKComponents\WinKeyKiller.ahk

;基本配置変更
`::Delete
Delete::`

;Reload/Suspend AHK
RAlt & ,::Reload
RAlt & .::Suspend

;諸々微調整
RWin & Tab::Send,{Tab}
RWin & Return::Send,{Return}
LControl & Tab::Send,^{Tab}
LControl & Esc::Send,{Delete}
RAlt::Send,{RWin}
LWin & Tab::AltTab

;一行消し（両サイド）
RWin & BackSpace::
	Send,+{HOME}
	HistoricalClip_stackCopy()
	Send,{Backspace}
return
RWin & `::
	Send,+{END}
	HistoricalClip_stackCopy()
	Send,{BackSpace}
return

;IME
LWin & Space::Send,!{``}
LControl & BackSpace::IME_SET("0")
LControl & Return::IME_SET("1")

;SandS。Space押上げでSpaceキーActivateとSpace押しキャンセル用のTab
*Space::mbind_space()
Space & Tab::return

;ReturnにGUIフック
~Return::
	if guiIsOn()
		HistoricalClip_return()
return

;もろもろバインドとリスナー
#include %A_ScriptDir%\myAHKComponents\MBindListener.ahk
#include %A_ScriptDir%\myAHKComponents\MBindSetting.ahk
#include %A_ScriptDir%\myAHKComponents\MBind.ahk

;IfWinActives ここで優先で当てること
#include %A_ScriptDir%\myAHKComponents\IfWinActives\General.ahk
#include %A_ScriptDir%\myAHKComponents\IfWinActives\Explorer.ahk
#include %A_ScriptDir%\myAHKComponents\IfWinActives\Excel.ahk
#include %A_ScriptDir%\myAHKComponents\IfWinActives\Chrome.ahk
#include %A_ScriptDir%\myAHKComponents\IfWinActives\PowerPoint.ahk
#include %A_ScriptDir%\myAHKComponents\IfWinActives\IntelliJ.ahk

Return
;以下、GUIのラベル等、初回起動では不要なやつら
#include %A_ScriptDir%\myAHKComponents\GUILabel.ahk
