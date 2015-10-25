LCMD(){
	return GetKeyState("LWin", "P")
}
RCMD(){
	return GetKeyState("RWin", "P")
}
CTRL(){
	return GetKeyState("LControl","P")
}
SHIFT(){
	return LSHIFT() || RSHIFT()
}
LSHIFT(){
	return GetKeyState("LShift","P")
}
RSHIFT(){
	return GetKeyState("RShift","P")
}
SPACE(){
	return GetKeyState("Space","P")
}
ALT(){
	return RALT() || LALT()
}
RALT(){
	return GetKeyState("RAlt","P")
}
LALT(){
	return GetKeyState("LAlt","P")
}

;修飾キー付きのkeypress
press(key){
	modifiers := ""
	if GetKeyState("LWin", "P")
		modifiers = %modifiers%^
	if GetKeyState("Shift", "P")
		modifiers = %modifiers%+
	if GetKeyState("LAlt", "P")
		modifiers = %modifiers%!
	if GetKeyState("RAlt", "P")
		modifiers = %modifiers%`#
	Send,%modifiers%%key%
}
