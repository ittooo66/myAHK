;Windows Explorer（ファイラ）設定
#IfWinActive,ahk_class CabinetWClass

	;新規Window作成
	RButton & MButton::Send,^{n}

	;ショートカット作成
	vkEBsc07B & a::
	LControl & a::
		if CAPS() && LCMD()
			Send,{AppsKey}{UP}{UP}{UP}{UP}{Return}
		else
			mbind_a()
	return

	vkEBsc07B & l::Send,!{d}

	;Need　QTTB
	RButton & WheelUp::Send,^+{Tab}
	RButton & WheelDown::Send,^{Tab}
	RButton & XButton2::Send,^+{z}
	RButton & LButton::Send,{}

	;TAB切り替え
	vkEBsc07B & s::
	LControl & s::
		if CAPS() && LCMD()
			Send,^+{Tab}
		else
			mbind_s()
	return

	;TAB切り替え
	vkEBsc07B & f::
	LControl & f::
		if CAPS() && LCMD()
			Send,^{Tab}
		else
			mbind_f()
	return

#IfWinActive