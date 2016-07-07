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

#IfWinActive