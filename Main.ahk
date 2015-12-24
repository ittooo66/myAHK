;アイコン設定
Menu, Tray, Icon, %A_WinDir%\System32\inetcpl.cpl, 1
;おまじない
#InstallKeybdHook
;Library(バインドは持たないがグローバル変数の干渉に注意。
#include %A_ScriptDir%\myAHKComponents\Library\HistoricalClip.ahk
#include %A_ScriptDir%\myAHKComponents\Library\_STD.ahk
#include %A_ScriptDir%\myAHKComponents\Library\Macro.ahk
#include %A_ScriptDir%\myAHKComponents\Library\WinD.ahk
#include %A_ScriptDir%\myAHKComponents\Library\IntelliScroll.ahk
#include %A_ScriptDir%\myAHKComponents\Library\MyFuncLock.ahk
;KANAマウス設定
#include %A_ScriptDir%\myAHKComponents\KANAMouse.ahk

;基本配置変更
`::Delete
Delete::`
RAlt::RWin

;Lock解除
vkFFsc079::
	global myFuncPressed
	if myFuncPressed = 1
		MyFuncLock()
return

;Reload/Suspend AHK
RAlt & ,::Reload
RAlt & .::Suspend

;IME
vkEBsc07B & Space::Send,!{``}

;諸々微調整
LControl & Esc::Send,{Delete}

;一行消し（両サイド）
vkFFsc079 & BackSpace::
	Send,+{HOME}
	HistoricalClip_stackCopy()
	Send,{BackSpace}
return
vkFFsc079 & `::
	Send,+{END}
	HistoricalClip_stackCopy()
	Send,{BackSpace}
return

;SandS。Space押上げでSpaceキーActivateとSpace押しキャンセル用のTab
*Space::mbind_space()
Space & Tab::return
;Spaceでのマウスキーボードのスロー化に寄与
>+<+Space::Return

;ReturnにGUIフック
~Return::
	if guiIsOn()
		HistoricalClip_return()
return

;もろもろバインドとリスナー
#include %A_ScriptDir%\myAHKComponents\MBindListener.ahk
#include %A_ScriptDir%\myAHKComponents\MBindSetting.ahk
#include %A_ScriptDir%\myAHKComponents\MBind.ahk

;IfWinActives
#include %A_ScriptDir%\myAHKComponents\IfWinActives\_General.ahk
#include %A_ScriptDir%\myAHKComponents\IfWinActives\Explorer.ahk
#include %A_ScriptDir%\myAHKComponents\IfWinActives\Excel.ahk
#include %A_ScriptDir%\myAHKComponents\IfWinActives\Chrome.ahk
#include %A_ScriptDir%\myAHKComponents\IfWinActives\PowerPoint.ahk
#include %A_ScriptDir%\myAHKComponents\IfWinActives\IntelliJ.ahk
#include %A_ScriptDir%\myAHKComponents\IfWinActives\Atom.ahk

return
;以下、GUIのラベル等、初回起動では不要なやつら
#include %A_ScriptDir%\myAHKComponents\GUILabel.ahk
