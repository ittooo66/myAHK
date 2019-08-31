;押下中修飾キー表示機能（押しっぱなし現象可視化用）
ModifierBrowser_CheckMods:
	;表示モード検出
	if (!ModifierBrowser_isEnabled())
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

;ModifierBrowser機能の有効化、無効化
ModifierBrowser_toggle(){
	if (ModifierBrowser_isEnabled()){
		setStringWriter("ModifierBrowser_isEnabled","false")
		msgBox, disabled ModifierBrowser
	}else{
		setStringWriter("ModifierBrowser_isEnabled","true")
		msgBox, enabled ModifierBrowser
	}
}

;ModifierBrowser機能の有効・無効の確認
ModifierBrowser_isEnabled(){
	state := getStringWriter("ModifierBrowser_isEnabled")
	if(state == "true"){
		return true
	}
	return false
}
