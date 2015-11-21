#IfWinActive,ahk_class SunAwtFrame
	;タブ切り替え
	RButton & WheelUp::Send,!{Left}
	RButton & WheelDown::Send,!{Right}
	LControl & Tab::
		if SHIFT()
			Send,!{Left}
		else
			Send,!{Right}
	return
	LControl & s::
		if LCMD()
			Send,!{Left}
		else
			mbind_s()
	return
	LControl & f::
		if LCMD()
			Send,!{Right}
		else
			mbind_f()
	return

	;タブ開閉
	RButton & XButton1::
	vkEBsc07B & w::
		Send,^{F4}
	return
	RButton & XButton2::Send,^+{F11} ;非純正：Reopen Closed Tabに要追加
	LShift & t::
	vkEBsc07B & t::
		if SHIFT() && LCMD()
			Send,^+{F11}
		else
			mbind_t()
	return

	;Refactor
	LControl & r::
	vkEBsc07B & r::
		if CAPS() && LCMD()
			Send,^!+{t}
		else
			mbind_r()
	Return

	;構造選択+
	LControl & e::
	vkEBsc07B & e::
		if CAPS() && LCMD()
			Send,^{w}
		else
			mbind_e()
	Return
	;構造選択-
	LControl & d::
	vkEBsc07B & d::
		if CAPS() && LCMD()
			Send,^+{w}
		else
			mbind_d()
	Return

	;横スクロール
	XButton2 & ~WheelUp::
		Send,{WheelDown}
		sidescroll_on_intellij()
	return
	XButton2 & ~WheelDown::
		Send,{WheelUp}
		sidescroll_on_intellij()
	return
	sidescroll_on_intellij(){
		Send,{Shift Down}
		while (GetKeyState("XButton2", "P")){
			;サイドボタンとShiftの押し下げを連動
			;Wheelはチルダで活かしてShift+Wheelを入力
			sleep,100
		}
		Send,{Shift Up}
	}

	;実行
	LControl & v::
	vkEBsc07B & v::
		if CAPS() && LCMD()
			Send,+{F10}
		else
			mbind_v()
	return

	;javadoc表示
	LControl & q::
	vkEBsc07B & q::
		if CAPS() && LCMD()
			Send,^{q}
		else
			mbind_q()
	return

	;フォーマッタ
	LControl & a::
	vkEBsc07B & a::
		if CAPS() && LCMD()
			Send,^!{l}
		Else
			mbind_a()
	return

	;intelliScroll
	XButton2 & LButton::intelliScroll()

#IfWinActive
