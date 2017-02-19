;仮想修飾キー一覧

LCMD(){ ;HHKB_左ダイヤ
	return GetKeyState("vkEBsc07B", "P")
}
RCMD(){ ;HHKB_右ダイヤ
	return GetKeyState("vkFFsc079", "P")
}
CAPS(){ ;HHKB_Control
	return GetKeyState("LControl","P")
}
SHIFT(){ ;HHKB_両Shift
	return LSHIFT() || RSHIFT()
}
LSHIFT(){ ;HHKB_左シフト
	return GetKeyState("LShift","P")
}
RSHIFT(){ ;HHKB_右シフト
	return GetKeyState("RShift","P")
}
SPACE(){ ;HHKB_スペース
	return GetKeyState("Space","P")
}
ALT(){ ;HHKB_両Alt
	return RALT() || LALT()
}
RALT(){ ;HHKB_右Alt
	return GetKeyState("RAlt","P")
}
LALT(){ ;HHKB_左Alt
	return GetKeyState("LAlt","P")
}

;修飾キー付きのkeypress
press(key){
	modifiers := ""
	if LCMD()
		modifiers = %modifiers%^
	if SHIFT()
		modifiers = %modifiers%+
	if LALT()
		modifiers = %modifiers%!
	if RALT()
		Send,{RWin down}%modifiers%%key%{RWin up}
	else
		Send,%modifiers%%key%
}
