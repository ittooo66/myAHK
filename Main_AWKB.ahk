Menu, Tray, Icon, %A_WinDir%\System32\inetcpl.cpl, 1

#InstallKeybdHook
;Library
#include %A_ScriptDir%\myAHKComponents\Library.ahk
;マウス設定（キーボードマウスとKana設定）
#include %A_ScriptDir%\myAHKComponents\Mouse.ahk

;基本配置変更,バクスラ＝＞バクスペはレジストリで弄ってる
`::Escape
\::Delete
RAlt & Backspace::send,{\}

;Reload/Suspend AHK
RAlt & ,::Reload
RAlt & .::Suspend

;位置保持改行
RShift & Return::Send,{Return}{Left}
RControl & Return::Send,{Return}{Left}

;一行消し（左）
RShift & Backspace::Send,+{HOME}{Backspace}
RControl & Backspace::Send,+{HOME}{Backspace}

;一行消し（右）
RShift & \::Send,+{END}{BackSpace}
RControl & \::Send,+{END}{BackSpace}

;IME切替え
LControl & Space::Send,!{``}

;window切り替え
LControl & Tab::AltTab

;SandS。Space押上げでSpaceキーActivateとSpace押しキャンセル用のTab
Space::Send,{Space}
Space & Tab::return

;もろもろバインドとリスナー
#include %A_ScriptDir%\myAHKComponents\MBind.ahk
#include %A_ScriptDir%\myAHKComponents\MBindListener.ahk

;IfWinActives ここで優先で当たるように
#include %A_ScriptDir%\myAHKComponents\IfWinActives\General.ahk
#include %A_ScriptDir%\myAHKComponents\IfWinActives\PowerPoint.ahk
#include %A_ScriptDir%\myAHKComponents\IfWinActives\IntelliJ.ahk
