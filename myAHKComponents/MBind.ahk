mbind_a(){
	if RCMD() && LCMD() && SHIFT()
		selectShift("Chrome_WidgetWin_1","Atom")
	else if RCMD() && LCMD(){
		if !select("Chrome_WidgetWin_1","Atom")
			run, C:\Users\AHK\AppData\Local\atom\update.exe	--processStart atom.exe
	}else if RCMD() || CAPS()
		press("^{LEFT}")
	else if SPACE()
		press("h")
	else
		press("a")
}

mbind_b(){
	if SPACE()
		press("/")
	else
		press("b")
}

mbind_c(){
	if ( CAPS() || RCMD() )&& SHIFT()
		copyTo("C")
	else if RCMD() || CAPS()
		pasteFrom("C")
	else if SPACE()
		press(",")
	else
		press("c")
}

mbind_d(){
	if RCMD() && LCMD()
		Send,#{d}
	else if RCMD() && CAPS()
		Send,!+{9}
	else if RCMD() || CAPS()
		press("{DOWN}")
	else if SPACE()
		press("k")
	else
		press("d")
}

mbind_e(){
	if RCMD() && LCMD() && SHIFT()
		selectShift("TTeraPadMainForm","")
	else if RCMD() && LCMD(){
		if !select("TTeraPadMainForm","")
			run "C:\Users\AHK\Dropbox\bcd\WinApp\TeraPad\TeraPad.exe"
	}else if CAPS() && RCMD()
		Send,!+{0}
	else if CAPS() || RCMD()
		press("{UP}")
	else if SPACE()
		press("i")
	else
		press("e")
}

mbind_f(){
	if RCMD() && LCMD() && SHIFT()
		selectShift("CabinetWClass","")
	else if RCMD() && LCMD(){
		if !select("CabinetWClass","")
			Run,explorer.exe
	}else if RCMD() && CAPS()
		Send,!+{8}
	else if LCMD() && CAPS()
		Send,^{PgDn}
	else if CAPS() || RCMD()
		press("{RIGHT}")
	else if SPACE()
		press("l")
	else
		press("f")
}

mbind_g(){
	if RCMD() && LCMD() && SHIFT()
		selectShift("Chrome_WidgetWin_1","Chrome")
	else if RCMD() && LCMD(){
		if !select("Chrome_WidgetWin_1","Chrome")
			run, "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe"
	}else if RCMD() && CAPS()
		googleSearch()
	else if RCMD() || CAPS()
		press("^{RIGHT}")
	else if SPACE()
		press(";")
	else
		press("g")
}

mbind_h(){
	if RCMD() || CAPS()
		press("*")
	else if SPACE()
		press("'")
	else
		press("h")
}

mbind_i(){
	if RCMD() && LCMD() && SHIFT()
		selectShift("OpusApp","")
	else if RCMD() && LCMD(){
		if !select("OpusApp","")
			run "C:\Program Files\Microsoft Office 15\root\office15\winword.exe"
	}else
			press("i")
}

mbind_j(){
	if RCMD() && LCMD() && SHIFT()
		selectShift("SunAwtFrame","")
	else if RCMD() && LCMD(){
		if !select("SunAwtFrame","")
			run, "C:\Program Files (x86)\JetBrains\IntelliJ IDEA Community Edition 14.0.3\bin\idea.exe"
	}else if RCMD() || CAPS()
		press("/")
	else
		press("j")
}

mbind_k(){
	if RCMD() || CAPS()
		press("{F7}")
	else
		press("k")
}

mbind_l(){
	press("l")
}

mbind_m(){
	if RCMD() && CAPS()
		download()
	else if RCMD() || CAPS()
		press("-")
	else
		press("m")
}

mbind_n(){
	if RCMD() && LCMD() && SHIFT()
		selectShift("Notepad","")
	else if RCMD() && LCMD(){
		if !select("Notepad","")
			run "C:\Windows\System32\notepad.exe"
	}else if RCMD() || CAPS()
		press("{+}")
	else
		press("n")
}

mbind_o(){
	if RCMD() && LCMD() && SHIFT()
		selectShift("XLMAIN","")
	else if RCMD() && LCMD(){
		if !select("XLMAIN","")
			run "C:\Program Files\Microsoft Office 15\root\office15\excel.exe"
	}else
		press("o")
}

mbind_p(){
	if RCMD() && LCMD() && SHIFT()
		selectShift("PPTFrameClass","")
	else if RCMD() && LCMD(){
		if !select("PPTFrameClass","")
			run "C:\Program Files\Microsoft Office 15\root\office15\powerpnt.exe"
	}else
		press("p")
}

mbind_q(){
	if RCMD() && LCMD() && SHIFT()
		selectShift("TaskManagerWindow","")
	else if RCMD() && LCMD(){
		if !select("TaskManagerWindow","")
			run "C:\Windows\System32\Taskmgr.exe"
	}else if RCMD() || CAPS()
		Send,{BackSpace}
	else if LCMD(){
		MsgBox , 1 , Confirm, Really?
		ifMsgBox, OK
			Send,!{F4}
	}else if SPACE()
		press("y")
	else
		press("q")
}

mbind_r(){
	if RCMD() && LCMD() && SHIFT()
		selectShift("AcrobatSDIWindow","")
	else if RCMD() && LCMD(){
		if !select("AcrobatSDIWindow","")
			run "C:\Program Files (x86)\Adobe\Reader 11.0\Reader\AcroRd32.exe"
	}else	if RCMD() || CAPS()
		press("{END}")
	else if SPACE()
		press("o")
	else
		press("r")
}

mbind_s(){
	if RCMD() && LCMD() && SHIFT()
		selectShift("tSkMainForm","")
	else if RCMD() && LCMD(){
		if !select("tSkMainForm","")
			run "C:\Program Files (x86)\Skype\Phone\Skype.exe"
	}else if LCMD() && CAPS()
		Send,^{PgUp}
	else if RCMD() && CAPS()
		Send,!+{7}
	else if RCMD() || CAPS()
		press("{LEFT}")
	else if SPACE()
		press("j")
	else
		press("s")
}

mbind_t(){
	if RCMD() && LCMD() && SHIFT()
		selectShift("ConsoleWindowClass","")
	else if LCMD() && RCMD(){
		if !select("ConsoleWindowClass","")
			run, runas /user:administrator C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe
	}else if RCMD() || CAPS()
		Send,{Return}
	else if SPACE()
		press("p")
	else
		press("t")
}

mbind_u(){
	if RCMD() || CAPS()
		press("``")
	else if SPACE()
		press("]")
	else
		press("u")
}

mbind_v(){
	if ( CAPS() || RCMD() )&& SHIFT()
		copyTo("V")vc
	else if RCMD() || CAPS()
		pasteFrom("V")
	else if SPACE()
		press(".")
	else
		press("v")
}

mbind_w(){
	if RCMD() || CAPS()
		press("{HOME}")
	else if SPACE()
		press("u")
	else
		press("w")
}

mbind_x(){
	if ( CAPS() || RCMD() )&& SHIFT()
		copyTo("X")
	else if RCMD() || CAPS()
		pasteFrom("X")
	else if SPACE()
		press("m")
	else
		press("x")
}

mbind_y(){
	if RCMD() || CAPS()
		press("\")
	else if SPACE()
		press("[")
	else
		press("y")
}

mbind_z(){
	if ( CAPS() || RCMD() )&& SHIFT(){
		copyTo("Z")
	}else if RCMD() || CAPS(){
		pasteFrom("Z")
	}else if SPACE()
		press("n")
	else
		press("z")
}

mbind_1(){
	if RCMD() && LCMD() && SHIFT()
		addAlias("1")
	else if RCMD() && LCMD()
		openAlias("1")
	else if RCMD() || CAPS()
		press("{F1}")
	else if SPACE()
		press("6")
	else
		press("1")
}

mbind_2(){
	if RCMD() && LCMD() && SHIFT()
		addAlias("2")
	else if RCMD() && LCMD()
		openAlias("2")
	else if RCMD() || CAPS()
		press("{F2}")
	else if SPACE()
		press("7")
	else
		press("2")
}

mbind_3(){
	if RCMD() && LCMD() && SHIFT()
		addAlias("3")
	else if RCMD() && LCMD()
		openAlias("3")
	else if LCMD() && SHIFT()
		Send,{PrintScreen}
	else if RCMD() || CAPS()
		press("{F3}")
	else if SPACE()
		press("8")
	else
		press("3")
}

mbind_4(){
	if RCMD() && LCMD() && SHIFT()
		addAlias("4")
	else if RCMD() && LCMD()
		openAlias("4")
	else if LCMD() && SHIFT()
		Send,!{PrintScreen}
	else if RCMD() || CAPS()
		press("{F4}")
	else if SPACE()
		press("9")
	else
		press("4")
}

mbind_5(){
	if RCMD() && LCMD() && SHIFT()
		addAlias("5")
	else if RCMD() && LCMD()
		openAlias("5")
	else if RCMD() || CAPS()
		press("{F5}")
	else if SPACE()
		press("0")
	else
		press("5")
}

mbind_6(){
	if RCMD() && LCMD() && SHIFT()
		addAlias("6")
	else if RCMD() && LCMD()
		openAlias("6")
	else if RCMD() || CAPS()
		press("{F6}")
	else if SPACE()
		press("-")
	else
		press("6")
}

mbind_7(){
	if RCMD() && LCMD() && SHIFT()
		addAlias("7")
	else if RCMD() && LCMD()
		openAlias("7")
	else if RCMD() || CAPS()
		press("{F7}")
	else if SPACE()
		press("=")
	else
		press("7")
}

mbind_8(){
	if RCMD() && LCMD() && SHIFT()
		addAlias("8")
	else if RCMD() && LCMD()
		openAlias("8")
	else if RCMD() || CAPS()
		press("{F8}")
	else
		press("8")
}

mbind_9(){
	if RCMD() && LCMD() && SHIFT()
		addAlias("9")
	else if RCMD() && LCMD()
		openAlias("9")
	else if RCMD() || CAPS()
		press("{F9}")
	else
		press("9")
}

mbind_0(){
	if RCMD() && LCMD() && SHIFT()
		addAlias("0")
	else if RCMD() && LCMD()
		openAlias("0")
	else if RCMD() || CAPS()
		press("{F10}")
	else
		press("0")
}

mbind_minus(){
	if RCMD() || CAPS()
		press("{F11}")
	else
		press("-")
}

mbind_equal(){
	if RCMD() || CAPS()
		press("{F12}")
	else
		press("=")
}

mbind_bracket_left(){
}

mbind_bracket_right(){
}

mbind_backslash(){
}

mbind_semicolon(){
}

mbind_quote(){
}

mbind_period(){
}

mbind_camma(){
}

mbind_slash(){
}

LCMD(){
	return GetKeyState("LControl", "P")
}
RCMD(){
	return GetKeyState("RShift", "P")
}
CAPS(){
	return GetKeyState("RControl","P")
}
SHIFT(){
	return GetKeyState("LShift","P")
}
SPACE(){
	return GetKeyState("Space","P")
}
