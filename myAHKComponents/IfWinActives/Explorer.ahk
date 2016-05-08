;Windows Explorer（ファイラ）設定
#IfWinActive,ahk_class CabinetWClass
	RButton & MButton::Send,^{n}
#IfWinActive