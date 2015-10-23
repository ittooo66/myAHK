mbind_a(){
	if RCMD() && LCMD(){
		if !select("Chrome_WidgetWin_1","Atom")
			run, C:\Users\AHK\AppData\Local\atom\update.exe	--processStart atom.exe
	}else if RCMD() || CTRL()
		press("^{LEFT}")
	else if SPACE()
		press("h")
	else
		press("a")
}

mbind_b(){
	if RCMD() || CTRL(){
		macro()
	}else if SPACE()
		press("/")
	else
		press("b")
}

mbind_c(){
	if ( CTRL() || RCMD() )&& SHIFT()
		copyTo("C")
	else if RCMD() || CTRL()
		pasteFrom("C")
	else if SPACE()
		press(",")
	else
		press("c")
}

mbind_d(){
	if RCMD() && LCMD()
		Send,#{d}
	else if RCMD() && CTRL()
		Send,!+{9}
	else if RCMD() || CTRL()
		press("{DOWN}")
	else if SPACE()
		press("k")
	else
		press("d")
}

mbind_e(){
	if RCMD() && LCMD(){
		if !select("TTeraPadMainForm","")
			run "C:\Users\AHK\Dropbox\bcd\WinApp\TeraPad\TeraPad.exe"
	}else if CTRL() && RCMD()
		Send,!+{0}
	else if CTRL() || RCMD()
		press("{UP}")
	else if SPACE()
		press("i")
	else
		press("e")
}

mbind_f(){
	if RCMD() && LCMD(){
		if !select("CabinetWClass","")
			Run,explorer.exe
	}else if RCMD() && CTRL()
		Send,!+{8}
	else if LCMD() && CTRL()
		Send,^{PgDn}
	else if CTRL() || RCMD()
		press("{RIGHT}")
	else if SPACE()
		press("l")
	else
		press("f")
}

mbind_g(){
	if RCMD() && LCMD(){
		if !select("Chrome_WidgetWin_1","Chrome")
			run, "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe"
	}else if RCMD() && CTRL()
		search()
	else if RCMD() || CTRL()
		press("^{RIGHT}")
	else if SPACE()
		press(";")
	else
		press("g")
}

mbind_h(){
	if RCMD() && LCMD(){
		if !select("HwndWrapper","")
			run "C:\Users\AHK\AppData\Local\GitHub\GitHub.appref-ms"
	}else if RCMD() || CTRL()
		press("{BackSpace}")
	else if SPACE()
		press("'")
	else
		press("h")
}

mbind_i(){
	if RCMD() && LCMD(){
		if !select("OpusApp","")
			run "C:\Program Files\Microsoft Office 15\root\office15\winword.exe"
	}else if RCMD()
		press("8")
	else
		press("i")
}

mbind_j(){
	if RCMD() && LCMD(){
		if !select("SunAwtFrame","")
			run, "C:\Program Files (x86)\JetBrains\IntelliJ IDEA Community Edition 14.1.5\bin\idea.exe"
	}else if RCMD()
		press("4")
	else if CTRL()
		press("{F6}")
	else
		press("j")
}

mbind_k(){
	if CTRL()
		press("{F7}")
	else if RCMD()
		press("5")
	else
		press("k")
}

mbind_l(){
	if RCMD() &&LCMD(){
		if !select("ApolloRuntimeContentWindow",""){
			if !select("RiotWindowClass",""){
				run "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\League of Legends\League of Legends"
			}
		}
	}else if CTRL(){
		press("{F9}")
		press("{F8}")
	}else if RCMD(){
		press("6")
	}else
		press("l")
}

mbind_m(){
	if RCMD() && CTRL()
		download()
	else if RCMD()
		press("1")
	else if CTRL(){
		;TODO
	}else
		press("m")
}

mbind_n(){
	if RCMD() && LCMD(){
		if !select("Notepad","")
			run "C:\Windows\System32\notepad.exe"
	}else if RCMD() || CTRL()
		press("{*}")
	else
		press("n")
}

mbind_o(){
	if RCMD() && LCMD(){
		if !select("XLMAIN","")
			run "C:\Program Files\Microsoft Office 15\root\office15\excel.exe"
	}else if RCMD()
		press("9")
	else
		press("o")
}

mbind_p(){
	if RCMD() && LCMD(){
		if !select("PPTFrameClass","")
			run "C:\Program Files\Microsoft Office 15\root\office15\powerpnt.exe"
	}else if RCMD()
		press("{-}")
	else
		press("p")
}

mbind_q(){
	if RCMD() && LCMD(){
		if !select("TaskManagerWindow","")
			run "C:\Windows\System32\Taskmgr.exe"
	}else if RCMD() || CTRL()
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
	if RCMD() && LCMD(){
		if !select("AcrobatSDIWindow","")
			run "C:\Program Files (x86)\Adobe\Reader 11.0\Reader\AcroRd32.exe"
	}else	if RCMD() || CTRL()
		press("{END}")
	else if SPACE()
		press("o")
	else
		press("r")
}

mbind_s(){
	if RCMD() && LCMD(){
		if !select("tSkMainForm","")
			run "C:\Program Files (x86)\Skype\Phone\Skype.exe"
	}else if LCMD() && CTRL()
		Send,^{PgUp}
	else if RCMD() && CTRL()
		Send,!+{7}
	else if RCMD() || CTRL()
		press("{LEFT}")
	else if SPACE()
		press("j")
	else
		press("s")
}

mbind_t(){
	if LCMD() && RCMD(){
		if !select("ConsoleWindowClass","")
			run, runas /user:administrator C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe
	}else if RCMD() || CTRL()
		Send,{Return}
	else if SPACE()
		press("p")
	else
		press("t")
}

mbind_u(){
	if CTRL()
		press("``")
	else if RCMD()
		press("7")
	else if SPACE()
		press("]")
	else
		press("u")
}

mbind_v(){
	if ( CTRL() || RCMD() )&& SHIFT()
		copyTo("V")
	else if RCMD() || CTRL()
		pasteFrom("V")
	else if SPACE()
		press(".")
	else
		press("v")
}

mbind_w(){
	if RCMD() || CTRL()
		press("{HOME}")
	else if SPACE()
		press("u")
	else
		press("w")
}

mbind_x(){
	if ( CTRL() || RCMD() )&& SHIFT()
		copyTo("X")
	else if RCMD() || CTRL()
		pasteFrom("X")
	else if SPACE()
		press("m")
	else
		press("x")
}

mbind_y(){
	if RCMD() || CTRL()
		press("\")
	else if SPACE()
		press("[")
	else
		press("y")
}

mbind_z(){
	if ( CTRL() || RCMD() )&& SHIFT(){
		copyTo("Z")
	}else if RCMD() || CTRL(){
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
	else if RCMD() || CTRL()
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
	else if RCMD() || CTRL()
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
	else if RCMD() || CTRL()
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
	else if RCMD() || CTRL()
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
	else if RCMD() || CTRL()
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
	else if RCMD() || CTRL()
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
	else if RCMD() || CTRL()
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
	else if RCMD() || CTRL()
		press("{F8}")
	else
		press("8")
}

mbind_9(){
	if RCMD() && LCMD() && SHIFT()
		addAlias("9")
	else if RCMD() && LCMD()
		openAlias("9")
	else if RCMD() || CTRL()
		press("{F9}")
	else
		press("9")
}

mbind_0(){
	if RCMD() && LCMD() && SHIFT()
		addAlias("0")
	else if RCMD() && LCMD()
		openAlias("0")
	else if RCMD() || CTRL()
		press("{F10}")
	else
		press("0")
}

mbind_minus(){
	if RCMD() || CTRL()
		press("{F11}")
	else
		press("-")
}

mbind_equal(){
	if RCMD() || CTRL()
		press("{F12}")
	else
		press("=")
}

mbind_bracket_left(){
	press("[")
}

mbind_bracket_right(){
	press("]")
}

mbind_backslash(){
	press("\")
}

mbind_semicolon(){
	if RCMD()
		press("{+}")
	else
		press("`;")
}

mbind_quote(){
	if RCMD()
		press("{=}")
	else
		press("'")
}

mbind_period(){
	if RCMD(){
		press("3")
	}else
		press(".")
}

mbind_camma(){
	if RCMD()
		press("2")
	else
		press(",")
}

mbind_slash(){
	press("/")
}

mbind_space(){
	if RCMD()
		press("0")
	else if CTRL()
		press("^{Space}")
	else
		press("{Space}")
}
