;アイコン設定
Menu, Tray, Icon, %A_WinDir%\System32\inetcpl.cpl, 1
;おまじない
#InstallKeybdHook

;SetTimer有効化
;#Persistent
;JoyPadの各スティックポーリング
;SetTimer, WatchXY, 20  ;実際内部的には30ms毎くらいで回ってる模様
;SetTimer, WatchZ, 20   ;実際内部的には30ms毎くらいで回ってる模様
;SetTimer, WatchR, 20   ;実際内部的には30ms毎くらいで回ってる模様
;SetTimer, WatchPOV, 20 ;実際内部的には30ms毎くらいで回ってる模様
;各機能用のTimer
;SetTimer, ModifierBrowser_CheckMods, 100 ;修飾キーブラウザ(ModifierBrowser.ahk)

;Base Bindings
Delete::`
RAlt::RWin
;Reload/Suspend AHK
RAlt & ,::Reload
RAlt & .::Suspend
;AltTab
RAlt & ]::AltTab
RAlt & [::ShiftAltTab

;include参照先をmyAHKComponents直下に
#include %A_ScriptDir%\myAHKComponents
;もろもろバインド
#include MBindListener.ahk
#include MBindSetting.ahk
#include MBind.ahk
;Library(バインドは持たないがグローバル変数の干渉に注意)
#include Library\HistoricalClip.ahk
#include Library\_STD.ahk
#include Library\Macro.ahk
#include Library\WinD.ahk
#include Library\IntelliScroll.ahk
#include Library\MouseControl.ahk
#include Library\NippouMacro.ahk
;IfWinActives(特定Window/App上で有効になるバインドセット)
#include IfWinActives\_General.ahk
#include IfWinActives\Explorer.ahk
#include IfWinActives\InternetExplorer.ahk
#include IfWinActives\Outlook.ahk
#include IfWinActives\Word.ahk
#include IfWinActives\Excel.ahk
#include IfWinActives\PowerPoint.ahk
#include IfWinActives\Chrome.ahk
#include IfWinActives\IntelliJ.ahk
#include IfWinActives\Atom.ahk
;Mouse設定
#include MouseBindings.ahk
;JoyPad設定
;#include JoyPadControl\ButtonControl.ahk

;初回起動の実行、ここまで。
return

;以下、GUIのラベル等、初回起動では不要なやつら。SetTimerでポーリングした対象がメイン
#include GUILabel.ahk
;#include Library\ModifierBrowser.ahk
;#include JoyPadControl\WheelControl.ahk
;#include JoyPadControl\MouseControl.ahk
;#include JoyPadControl\CrossControl.ahk

