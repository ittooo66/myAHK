;chrome設定
#IfWinActive, ahk_exe chrome.exe
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

#IfWinActive
