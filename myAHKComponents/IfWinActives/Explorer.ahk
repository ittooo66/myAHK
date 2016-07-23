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



#IfWinActive