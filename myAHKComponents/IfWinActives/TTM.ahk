#IfWinActive,ahk_class VTWin32

	;FONT SIZE 変更
  vkEBsc07B & d::
	LControl & d::
		if CAPS() && LCMD(){
			Send, !{s}{f}!{s}
      directInput("10")
      Send, {Return}
		}else
			mbind_d()
	return

  vkEBsc07B & e::
	LControl & e::
		if CAPS() && LCMD(){
			Send, !{s}{f}!{s}
      directInput("17")
      Send, {Return}
		}else
			mbind_e()
	return

#IfWinActive