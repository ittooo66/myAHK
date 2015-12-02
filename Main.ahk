;アイコン設定
Menu, Tray, Icon, %A_WinDir%\System32\inetcpl.cpl, 1
;おまじない
#InstallKeybdHook
;Library(バインドは持たないがグローバル変数の干渉に注意。特にHistoricalClipとWheelScroll)
#include %A_ScriptDir%\Lib\Library\HistoricalClip.ahk
#include %A_ScriptDir%\Lib\Library\_STD.ahk
#include %A_ScriptDir%\Lib\Library\Macro.ahk
#include %A_ScriptDir%\Lib\Library\WinD.ahk
#include %A_ScriptDir%\Lib\Library\IntelliScroll.ahk
;KANAマウス設定
#include <KANAMouse>

;基本配置変更
`::Delete
Delete::`
RAlt::RWin

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
#include <MBindListener>
#include <MBindSetting>
#include <MBind>

;IfWinActives
#include %A_ScriptDir%\Lib\IfWinActives\_General.ahk
#include %A_ScriptDir%\Lib\IfWinActives\Explorer.ahk
#include %A_ScriptDir%\Lib\IfWinActives\Excel.ahk
#include %A_ScriptDir%\Lib\IfWinActives\Chrome.ahk
#include %A_ScriptDir%\Lib\IfWinActives\PowerPoint.ahk
#include %A_ScriptDir%\Lib\IfWinActives\IntelliJ.ahk
#include %A_ScriptDir%\Lib\IfWinActives\Atom.ahk

return
;以下、GUIのラベル等、初回起動では不要なやつら
#include <GUILabel>
