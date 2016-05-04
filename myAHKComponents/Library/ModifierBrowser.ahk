;押下中修飾キー表示機能（押しっぱなし現象可視化用）
ModifierBrowse:
	;表示モード検出
	global modifierBrowseIsOn
	if (modifierBrowseIsOn != 1)
		return

	;Modifier文字列生成
	mods := ""
	if RCMD()
		mods := mods . "RCMD()"
	if LCMD()
		mods := mods . "LCMD()"
	if ALT()
		mods := mods . "ALT()"
	if CAPS()
		mods := mods . "CAPS()"
	if SPACE()
		mods := mods . "SPACE()"
	if SHIFT()
		mods := mods . "SHIFT()"
	if GetKeyState("XButton1","P")
		mods := mods . "XB1()"
	if GetKeyState("XButton2","P")
		mods := mods . "XB2()"

	;Modifier出力
	Tooltip, %mods%

return

;修飾キー表示機能トグル
modifierBrowseToggle(){
	global modifierBrowseIsOn
	if (modifierBrowseIsOn != 1)
		modifierBrowseIsOn := 1
	else{
		modifierBrowseIsOn := 0
		Tooltip,
	}
}
