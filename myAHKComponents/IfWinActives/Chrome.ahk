;chrome設定
#IfWinActive, ahk_exe chrome.exe

	;Pin Tab
	RButton & LButton::Send,!{p}

	>^q::
	<^q::
	LControl & q::
	vkEBsc07B & q::
		if LCMD() && CAPS()
			send,{Browser_back}
		else
			mbind_q()
	return

	>^w::
	<^w::
	LControl & w::
	vkEBsc07B & w::
		if LCMD() && CAPS()
			send,{Browser_forward}
		else
			mbind_w()
	return

	;Fav
	>^e::
	<^e::
	LControl & e::
	vkEBsc07B & e::
		if LCMD() && CAPS(){
			send,^{t}
			sleep, 250
			send,!+{b}
		}else
			mbind_e()
	return
#IfWinActive
