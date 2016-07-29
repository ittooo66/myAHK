#IfWinActive,ahk_class TextEditorWindowW166

	;進む、戻る
	XButton2::Send,^{y}
	XButton1::Send,^{z}

	;Shift押しZですすめるようにした
	RShift & z::
	LShift & z::
	vkEBsc07B & z::
		if SHIFT() && LCMD()
			Send,^{y}
		else
			mbind_z()
	return

	LControl & d::
	vkEBsc07B & d::
		if CAPS() && LCMD()
			NippouMacro_initTime()
		else
			mbind_d()
	return

	LControl & w::
	vkEBsc07B & w::
		if CAPS() && LCMD()
			NippouMacro_reloadTime(-1, 0, 0, 0)
		else
			mbind_w()
	return

	LControl & r::
	vkEBsc07B & r::
		if CAPS() && LCMD()
			NippouMacro_reloadTime(1, 0, 0, 0)
		else
			mbind_r()
	return

	LControl & s::
	vkEBsc07B & s::
		if CAPS() && LCMD()
			NippouMacro_reloadTime(0, -15, 0, 0)
		else
			mbind_s()
	return

	LControl & f::
	vkEBsc07B & f::
		if CAPS() && LCMD()
			NippouMacro_reloadTime(0, 15, 0, 0)
		else
			mbind_f()
	return

	LControl & u::
	vkEBsc07B & u::
		if CAPS() && LCMD()
			NippouMacro_reloadTime(0, 0, -1, 0)
		else
			mbind_u()
	return

	LControl & o::
	vkEBsc07B & o::
		if CAPS() && LCMD()
			NippouMacro_reloadTime(0, 0, 1, 0)
		else
			mbind_o()
	return

	LControl & j::
	vkEBsc07B & j::
		if CAPS() && LCMD()
			NippouMacro_reloadTime(0, 0, 0, -15)
		else
			mbind_j()
	return

	LControl & l::
	vkEBsc07B & l::
		if CAPS() && LCMD()
			NippouMacro_reloadTime(0, 0, 0, 15)
		else
			mbind_l()
	return

#IfWinActive