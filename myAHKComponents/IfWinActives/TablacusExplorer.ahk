;Tablacus Explorer（ファイラ）設定
#IfWinActive,ahk_class TablacusExplorer

	;新規Window作成
	RButton & LButton::Send,!{Up}
  RButton & MButton::Send,^{n}
  RButton & WheelUp::Send,^+{Tab}
  RButton & WheelDown::Send,^{Tab}

	vkEBsc07B & l::Send,!{d}

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
