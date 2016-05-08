;アイコン設定
Menu, Tray, Icon, %A_WinDir%\System32\inetcpl.cpl, 1
;おまじない
#InstallKeybdHook

;SetTimer有効化
#Persistent
;KeyModifier監視用
SetTimer, ModifierBrowse, 20
;JoyPadの各スティックポーリング
SetTimer, WatchXY, 20  ;実際内部的には30ms毎くらいで回ってる模様
SetTimer, WatchZ, 20   ;実際内部的には30ms毎くらいで回ってる模様
SetTimer, WatchR, 20   ;実際内部的には30ms毎くらいで回ってる模様
SetTimer, WatchPOV, 20 ;実際内部的には30ms毎くらいで回ってる模様

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
	if HistoricalClip_isDisplayed()
		HistoricalClip_return()
return

;include参照先をmyAHKComponents直下に
#include %A_ScriptDir%\myAHKComponents
;Library(バインドは持たないがグローバル変数の干渉に注意)
#include Library\HistoricalClip.ahk
#include Library\_STD.ahk
#include Library\Macro.ahk
#include Library\WinD.ahk
#include Library\IntelliScroll.ahk
#include Library\MouseControl.ahk
;KANAマウス設定
#include KANAMouse.ahk
;もろもろバインドとリスナー
#include MBindListener.ahk
#include MBindSetting.ahk
#include MBind.ahk
;IfWinActives(特定Window/App上で有効になるバインドセット)
#include IfWinActives\_General.ahk
#include IfWinActives\Excel.ahk
#include IfWinActives\Chrome.ahk
#include IfWinActives\PowerPoint.ahk
#include IfWinActives\IntelliJ.ahk
#include IfWinActives\Atom.ahk
#include IfWinActives\Explorer.ahk
;JoyPadControl
#include JoyPadControl\ButtonControl.ahk

return
;以下、GUIのラベル等、初回起動では不要なやつら。SetTimerでポーリングした対象がメイン
#include GUILabel.ahk
#include Library\ModifierBrowser.ahk
#include JoyPadControl\WheelControl.ahk
#include JoyPadControl\MouseControl.ahk
#include JoyPadControl\CrossControl.ahk

