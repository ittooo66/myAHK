;アイコン設定
Menu, Tray, Icon, %A_WinDir%\System32\inetcpl.cpl, 1
;おまじない
#InstallKeybdHook

;SetTimer有効化
#Persistent
;KeyModifier監視用
SetTimer, ModifierBrowse, 20
;JoyPadの各スティックポーリング
SetTimer, WatchX, 20  ;実際内部的には30ms毎くらいで回ってる模様
SetTimer, WatchY, 20  ;実際内部的には30ms毎くらいで回ってる模様
SetTimer, WatchZ, 20  ;実際内部的には30ms毎くらいで回ってる模様
SetTimer, WatchR, 20  ;実際内部的には30ms毎くらいで回ってる模様

;Reload/Suspend AHK
RWin & ,::Reload
RWin & .::Suspend
;AltTab
RWin & ]::AltTab
RWin & [::ShiftAltTab
;IME
vkEBsc07B & Space::Send,!{``}
;delete
LControl & Esc::Send,{Delete}

;一行消し（両サイド）
vkFFsc079 & BackSpace::lineDel("HOME")
vkFFsc079 & Delete::lineDel("END")

;ReturnにGUIフック
~Return::
	if (historicalClipIsOn = 1)
		HistoricalClip_return()
return

;Library(バインドは持たないがグローバル変数の干渉に注意。
#include %A_ScriptDir%\myAHKComponents\Library\HistoricalClip.ahk
#include %A_ScriptDir%\myAHKComponents\Library\_STD.ahk
#include %A_ScriptDir%\myAHKComponents\Library\Macro.ahk
#include %A_ScriptDir%\myAHKComponents\Library\WinD.ahk
#include %A_ScriptDir%\myAHKComponents\Library\IntelliScroll.ahk
#include %A_ScriptDir%\myAHKComponents\Library\MouseControl.ahk
;KANAマウス設定
#include %A_ScriptDir%\myAHKComponents\KANAMouse.ahk
;もろもろバインドとリスナー
#include %A_ScriptDir%\myAHKComponents\MBindListener.ahk
#include %A_ScriptDir%\myAHKComponents\MBindSetting.ahk
#include %A_ScriptDir%\myAHKComponents\MBind.ahk
;IfWinActives
#include %A_ScriptDir%\myAHKComponents\IfWinActives\_General.ahk
#include %A_ScriptDir%\myAHKComponents\IfWinActives\Excel.ahk
#include %A_ScriptDir%\myAHKComponents\IfWinActives\Chrome.ahk
#include %A_ScriptDir%\myAHKComponents\IfWinActives\PowerPoint.ahk
#include %A_ScriptDir%\myAHKComponents\IfWinActives\IntelliJ.ahk
#include %A_ScriptDir%\myAHKComponents\IfWinActives\Atom.ahk
;JoyPadControl
#include %A_ScriptDir%\myAHKComponents\JoyPadControl\ButtonControl.ahk

return
;以下、GUIのラベル等、初回起動では不要なやつら。SetTimerでポーリングした対象がメイン
#include %A_ScriptDir%\myAHKComponents\GUILabel.ahk
#include %A_ScriptDir%\myAHKComponents\Library\ModifierBrowser.ahk
#include %A_ScriptDir%\myAHKComponents\JoyPadControl\WheelControl.ahk
#include %A_ScriptDir%\myAHKComponents\JoyPadControl\MouseControl.ahk

