#IfWinActive, ahk_class OpusApp

	;進む、戻る
	XButton2::Send,^{y}
	XButton1::Send,^{z}

#IfWinActive