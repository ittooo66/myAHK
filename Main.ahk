;アイコン設定
Menu, Tray, Icon, %A_WinDir%\System32\inetcpl.cpl, 1
;おまじない
#InstallKeybdHook
;Library
#include %A_ScriptDir%\myAHKComponents\Library\IME.ahk
#include %A_ScriptDir%\myAHKComponents\Library\HistoricalClip.ahk
#include %A_ScriptDir%\myAHKComponents\Library.ahk
;マウス設定
#include %A_ScriptDir%\myAHKComponents\Mouse.ahk

;基本配置変更
`::Delete
Delete::Send,{``}
+Delete::Send,+{``}
RAlt & Backspace::send,{\}
LControl & Esc::Send,{Delete}

;RCMDテンキー用
RWin & Tab::Send,{Tab}
RWin & Return::Send,{Return}
LControl & Tab::Send,^{Tab}

;Winキー周り
RShift & RWin::Return
RWin & RShift::return
RWin::Return
LWin::Return
RAlt::Send,{RWin}

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

;IME切替え
LWin & Space::Send,!{``}
LControl & BackSpace::IME_SET("0")
LControl & Return::IME_SET("1")

;window切り替え
LWin & Tab::AltTab

;SandS。Space押上げでSpaceキーActivateとSpace押しキャンセル用のTab
*Space::mbind_space()
Space & Tab::return

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

return
;ここからGUI周りのラベル記述
GuiEscape:
 Gui, show, Hide
return
