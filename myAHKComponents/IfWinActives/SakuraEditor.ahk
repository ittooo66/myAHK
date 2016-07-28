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


	LControl & w::
	vkEBsc07B & w::
		if CAPS() && LCMD()
			NippouMacro_downStartHour()
		else
			mbind_w()
	return

	LControl & r::
	vkEBsc07B & r::
		if CAPS() && LCMD()
			NippouMacro_upStartHour()
		else
			mbind_r()
	return

	LControl & s::
	vkEBsc07B & s::
		if CAPS() && LCMD()
			NippouMacro_downStartMinute()
		else
			mbind_s()
	return

	LControl & d::
	vkEBsc07B & d::
		if CAPS() && LCMD()
			NippouMacro_initTime()
		else
			mbind_d()
	return

	LControl & g::
	vkEBsc07B & g::
		if CAPS() && LCMD()
			NippouMacro_selectTime()
		else
			mbind_g()
	return

	LControl & f::
	vkEBsc07B & f::
		if CAPS() && LCMD()
			NippouMacro_upStartMinute()
		else
			mbind_f()
	return

	LControl & u::
	vkEBsc07B & u::
		if CAPS() && LCMD()
			NippouMacro_downEndHour()
		else
			mbind_u()
	return

	LControl & o::
	vkEBsc07B & o::
		if CAPS() && LCMD()
			NippouMacro_upEndHour()
		else
			mbind_o()
	return

	LControl & j::
	vkEBsc07B & j::
		if CAPS() && LCMD()
			NippouMacro_downEndMinute()
		else
			mbind_j()
	return

	LControl & l::
	vkEBsc07B & l::
		if CAPS() && LCMD()
			NippouMacro_upEndMinute()
		else
			mbind_l()
	return

#IfWinActive