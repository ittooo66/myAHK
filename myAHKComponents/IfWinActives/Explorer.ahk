;エクスプローラー（QTTabBar使ってます）
;QTTabBar設定
;  表示->オプション->QTTabBarで有効化
;  タブ上右クリ->QTTabBarのオプション->ショートカットキー->現在のタブのロック／ロック解除
;  Ctrl+L　を　Ctrl+；に
#IfWinActive,ahk_class CabinetWClass
	RButton & XButton1::Send,^{w}
	RButton & XButton2::Send,^+{z}
	RButton & LButton::Send,^{`;}
	RButton & MButton::Send,^{n}
	RButton & WheelUp::Send,^+{Tab}
	RButton & WheelDown::Send,^{Tab}

	LControl & s::
	vkEBsc07B & s::
		if CAPS() && LCMD()
			Send,^+{Tab}
		else
			mbind_s()
	return

	LControl & f::
	vkEBsc07B & f::
		if CAPS() && LCMD()
			Send,^{Tab}
		else
			mbind_f()
	return

	vkEBsc07B & t::Send,{}
#IfWinActive
