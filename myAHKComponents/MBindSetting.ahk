FUNC(){
	;myAHKComponents/Library/FuncLock.ahk
	global myFuncPressed
	if(myFuncPressed == 1){
		return true
	}
}
LCMD(){
	return GetKeyState("vkEBsc07B", "P")
}
RCMD(){
	if FUNC()
		return true

	return GetKeyState("vkFFsc079", "P")
}
CAPS(){
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
	if LCMD()
		modifiers = %modifiers%^
	if SHIFT()
		modifiers = %modifiers%+
	if LALT()
		modifiers = %modifiers%!
	if RALT()
		modifiers = %modifiers%`#
	Send,%modifiers%%key%
}
