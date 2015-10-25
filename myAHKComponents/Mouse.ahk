;Default
RButton::Send,{RButton}
XButton2::Send,{XButton2}
XButton1::Send,{XButton1}
;Window catalog(need Dexpot)
MButton::!+0

;ウィンドウ変更
XButton1 & WheelUp::ShiftAltTab
XButton1 & WheelDown::AltTab
;横スクロール
XButton2 & WheelUp::Send,{WheelLeft}
XButton2 & WheelDown::Send,{WheelRight}
;ウィンドウ選択画面(need Dexpot)
XButton1 & Xbutton2::Send,!+{9}
XButton2 & XButton1::Send,!+{9}
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
XButton1 & LButton::Run, "C:\Users\AHK\Dropbox\"
;MButton
XButton2 & RButton::Send,{MButton}

;------------------------------
;キーボードマウスエミュレーション
;------------------------------
RAlt & q::Send,{WheelUp}
RAlt & t::Send,{WheelDown}
RAlt & w::Send,{LButton}
RAlt & r::Send,{RButton}
RAlt & e::
RAlt & s::
RAlt & d::
RAlt & f::
	val := 1
	slp := 10
	if(GetKeyState("LControl","P"))
		Send,{LButton Down}
	While (GetKeyState("RAlt", "P")){
		MoveX := 0, MoveY := 0
		MoveY += GetKeyState("e", "P") ? -val : 0
		MoveX += GetKeyState("s", "P") ? -val : 0
		MoveY += GetKeyState("d", "P") ? val : 0
		MoveX += GetKeyState("f", "P") ? val : 0
		MouseMove, %MoveX%, %MoveY%, 1, R
		Sleep, %slp%
		val++
		if( !GetKeyState("e", "P") && !GetKeyState("d", "P") && !GetKeyState("s", "P") && !GetKeyState("f", "P"))
			val := 1
		if( !GetKeyState("RControl","P") )
			Send,{LButton Up}
	}
	Send,{LButton Up}
Return
