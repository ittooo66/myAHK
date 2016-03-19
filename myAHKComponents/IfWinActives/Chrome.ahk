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

	;コピーして検索
	>^g::
	<^g::
	LControl & g::
	vkEBsc07B & g::
		if LCMD() && CAPS(){
			send,^{c}
			sleep, 100
			send,^{t}
			sleep, 100
			send,^{v}
			sleep, 100
			send,{return}
		}else
			mbind_g()
	return
#IfWinActive
