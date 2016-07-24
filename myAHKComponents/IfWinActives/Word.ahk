#IfWinActive, ahk_class OpusApp

	;Shift押しZですすめるようにした
	RShift & z::
	LShift & z::
	vkEBsc07B & z::
		if SHIFT() && LCMD()
			Send,^{y}
		else
			mbind_z()
	return

	;進む、戻る
	XButton2::Send,^{y}
	XButton1::Send,^{z}

	vkEBsc07B & c::
	LControl & c::
		if CAPS() && LCMD()
			;印刷
			Send,!{f}{p}{Alt}
		else
			mbind_c()
	return

#IfWinActive