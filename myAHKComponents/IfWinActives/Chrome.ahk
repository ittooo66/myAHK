;chrome設定
#IfWinActive, ahk_exe chrome.exe
	>^q::
	<^q::
	LControl & q::
	LWin & q::
		if LCMD() && CTRL()
			send,{Browser_back}
		else
			mbind_q()
	return

	>^w::
	<^w::
	LControl & w::
	LWin & w::
		if LCMD() && CTRL()
			send,{Browser_forward}
		else
			mbind_w()
	return

	XButton2 & LButton::
		Send,{MButton}
		While (GetKeyState("LButton", "P") && GetKeyState("Xbutton2","P"))
			Sleep, 10
		Send,{MButton}
	Return
#IfWinActive
