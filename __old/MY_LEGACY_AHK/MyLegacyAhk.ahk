;Legacy AHK置き場。
;自分が書いてるので参考として使おう
;SetTimerを用いるAHKたち。使い方は以下のような感じ
;Main.ahk に下記のように書いていた。

;SetTimer有効化
#Persistent
;JoyPadの各スティックポーリング
SetTimer, WatchXY, 20  ;実際内部的には30ms毎くらいで回ってる模様
SetTimer, WatchZ, 20   ;実際内部的には30ms毎くらいで回ってる模様
SetTimer, WatchR, 20   ;実際内部的には30ms毎くらいで回ってる模様
SetTimer, WatchPOV, 20 ;実際内部的には30ms毎くらいで回ってる模様
;各機能用のTimer
SetTimer, ModifierBrowser_CheckMods, 100 ;修飾キーブラウザ(ModifierBrowser.ahk)

;JoyPad設定
#include JoyPadControl\ButtonControl.ahk




return
;以下、初回起動では不要なやつら。SetTimerでポーリングした対象がメイン
#include Library\ModifierBrowser.ahk
#include JoyPadControl\WheelControl.ahk
#include JoyPadControl\MouseControl.ahk
#include JoyPadControl\CrossControl.ahk

