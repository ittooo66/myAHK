;SteelSeries:KANAマウス設定

;Default
RButton::Send,{RButton}
XButton2::Send,{XButton2}
XButton1::Send,{XButton1}
MButton::winD()

;ウィンドウ変更
XButton1 & WheelUp::windowChange("Left")
XButton1 & WheelDown::windowChange("Right")
;横スクロール
XButton2 & WheelUp::Send,{WheelLeft}
XButton2 & WheelDown::Send,{WheelRight}
;ウィンドウ選択画面
XButton1 & XButton2::Send,#{Tab}
XButton2 & XButton1::Send,#{Tab}
;Reload/Suspend bindings(for gaming)
XButton1 & MButton::Suspend
XButton2 & MButton::Reload

;Chrome系（タブ持ちApp系）でよく機能するバインド
;タブ変更
RButton & WheelUp::Send,^{PgUp}
RButton & WheelDown::Send,^{PgDn}
;タブ消去
RButton & XButton1::Send,^{w}
;前に使ったタブ
RButton & XButton2::Send,^+{t}
;New tab
RButton & MButton::Send,^{t}
;Pin tab
RButton & LButton::Send,!{p}


;ホイールクリック
XButton2 & LButton::intelliScroll()
;Winキー
XButton1 & RButton::Send,{RWin}
;Explorer起動
XButton1 & LButton::
	openApp("Entrance")
return
;MButton
XButton2 & RButton::
	Send,{MButton Down}
	while(GetKeyState("XButton2","P")&&GetKeyState("RButton","P")){
		sleep,30
	}
	Send,{MButton Up}
return
