;Windows Explorer（ファイラ）設定
#IfWinActive,ahk_class CabinetWClass

	;新規Window作成
	RButton & MButton::Send,^{n}
	;上へ戻る
	RButton & LButton::Send,!{Up}

	;ショートカット作成
	vkEBsc07B & a::
	LControl & a::
		if CAPS() && LCMD()
			Send,{AppsKey}{UP}{UP}{UP}{UP}{Return}
		else
			mbind_a()
	return

	;表示
	vkEBsc07B & q::
	LControl & q::
		if CAPS() && LCMD(){
			Send,^{NumpadAdd}
		}else
			mbind_q()
	return

#IfWinActive
