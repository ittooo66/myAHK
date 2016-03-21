;GUI:Escape入力時
GuiEscape:
 historicalClip_closeWindow()
return

;修飾キーブラウザ
modifierBrowseIsOn := 0
;押しっぱなし現象可視化用
ModifierBrowse:
	global modifierBrowseIsOn
	if (modifierBrowseIsOn == 0 )
		return

	commands := ""
	if RCMD()
		commands := commands . "RCMD()"
	if LCMD()
		commands := commands . "LCMD()"
	if ALT()
		commands := commands . "ALT()"
	if CAPS()
		commands := commands . "CAPS()"
	if SPACE()
		commands := commands . "SPACE()"
	if SHIFT()
		commands := commands . "SHIFT()"
	if GetKeyState("XButton1","P")
		commands := commands . "XB1()"
	if GetKeyState("XButton2","P")
		commands := commands . "XB2()"

	Tooltip, %commands%
return

modifierBrowseToggle(){
	global modifierBrowseIsOn
	if (modifierBrowseIsOn == 0)
		modifierBrowseIsOn := 1
	else{
		modifierBrowseIsOn := 0
		Tooltip,
	}
}
