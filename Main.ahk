;アイコン設定
Menu, Tray, Icon, %A_WinDir%\System32\inetcpl.cpl, 1
;おまじない
#InstallKeybdHook
;Library
#include %A_ScriptDir%\myAHKComponents\Library\IME.ahk
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
*RWin::Return
*LWin::Return
RAlt::Send,{RWin}

;一行消し（両サイド）
RWin & BackSpace::
  Send,+{HOME}
  copyTo("V")
  Send,{Backspace}
return
RWin & `::
  Send,+{END}
  copyTo("V")
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

;もろもろバインドとリスナー
#include %A_ScriptDir%\myAHKComponents\MBindListener.ahk
#include %A_ScriptDir%\myAHKComponents\MBindSetting.ahk
#include %A_ScriptDir%\myAHKComponents\MBind.ahk

;IfWinActives ここで優先で当てること
#include %A_ScriptDir%\myAHKComponents\IfWinActives\General.ahk
#include %A_ScriptDir%\myAHKComponents\IfWinActives\PowerPoint.ahk
#include %A_ScriptDir%\myAHKComponents\IfWinActives\IntelliJ.ahk
