;アイコン設定
Menu, Tray, Icon, %A_WinDir%\System32\inetcpl.cpl, 1
;おまじない
#InstallKeybdHook
;Library
#include %A_ScriptDir%\myAHKComponents\ExtLibs\IME.ahk
#include %A_ScriptDir%\myAHKComponents\Library.ahk
;マウス設定
#include %A_ScriptDir%\myAHKComponents\Mouse.ahk

;基本配置変更,chgkey.exeに注意
`::Delete
Delete::Send,{``}
+Delete::Send,+{``}
RWin & Backspace::send,{\}
RWin & `::Send,{``}
RControl & Esc::Send,{Delete}

;Reload/Suspend AHK
RWin & ,::Reload
RWin & .::Suspend

;一行消し（両サイド）
RShift & BackSpace::
  Send,+{HOME}
  copyTo("V")
  Send,{Backspace}
return
RShift & `::
  Send,+{END}
  copyTo("V")
  Send,{BackSpace}
return

;IME切替え
LControl & Space::Send,!{``}
RControl & BackSpace::IME_SET("0")
RControl & Return::IME_SET("1")

;window切り替え
LControl & Tab::AltTab

;SandS。Space押上げでSpaceキーActivateとSpace押しキャンセル用のTab
*Space::mbind_space()
Space & Tab::return

;もろもろバインドとリスナー
#include %A_ScriptDir%\myAHKComponents\MBind.ahk
#include %A_ScriptDir%\myAHKComponents\MBindListener.ahk

;IfWinActives ここで優先で当てること
#include %A_ScriptDir%\myAHKComponents\IfWinActives\General.ahk
#include %A_ScriptDir%\myAHKComponents\IfWinActives\PowerPoint.ahk
#include %A_ScriptDir%\myAHKComponents\IfWinActives\IntelliJ.ahk
