mbind_a(){
	if RCMD() && LCMD(){
		if !activateWindow("Chrome_WidgetWin_1","atom.exe","")
			run, C:\Users\AHK\AppData\Local\atom\update.exe	--processStart atom.exe
	}else if RCMD() || CAPS()
		press("^{LEFT}")
	else
		press("a")
}

mbind_b(){
	if (RCMD() || CAPS()) && SHIFT()
		run C:\Windows\System32\notepad.exe %A_WorkingDir%\myAHKComponents\Library\Macro.ahk
	else if RCMD() || CAPS(){
		macro()
	}else
		press("b")
}

mbind_c(){
	if ( CAPS() || RCMD() )&& SHIFT()
		copyTo("C")
	else if RCMD() || CAPS()
		pasteFrom("C")
	else if LCMD()
		HistoricalClip_stackCopy()
	else
		press("c")
}

mbind_d(){
	if RCMD() && LCMD()
		winD()
	else if LSHIFT() && RSHIFT()
		mouseMove("e","d","s","f")
	else if RCMD() || CAPS(){
		if historicalClipIsOn()
			HistoricalClip_down()
		else
			press("{DOWN}")
	}else
		press("d")
}

mbind_e(){
	if RCMD() && LCMD(){
		if !activateWindow("Notepad","","")
			run "C:\Windows\System32\notepad.exe"
	}else if CAPS() && RCMD()
		Send,#{Tab}
	else if LSHIFT() && RSHIFT()
		mouseMove("e","d","s","f")
	else if CAPS() || RCMD(){
		if historicalClipIsOn()
			HistoricalClip_up()
		else
			press("{UP}")
	}else
		press("e")
}

mbind_f(){
	if RCMD() && LCMD(){
		if !activateWindow("CabinetWClass","explorer.exe","")
			Run,"C:\Windows\explorer.exe"
	}else if RCMD() && CAPS()
		Send,^#{Right}
	else if LCMD() && CAPS()
		Send,^{PgDn}
	else if LSHIFT() && RSHIFT()
		mouseMove("e","d","s","f")
	else if CAPS() || RCMD()
		press("{RIGHT}")
	else
		press("f")
}

mbind_g(){
	if RCMD() && LCMD(){
		if !activateWindow("Chrome_WidgetWin_1","chrome.exe","")
			run, "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe"
	}else if RCMD() && CAPS()
		search()
	else if RCMD() || CAPS()
		press("^{RIGHT}")
	else
		press("g")
}

mbind_h(){
	if RCMD() && LCMD(){
		if !activateWindow("HwndWrapper","","")
			run "C:\Users\AHK\AppData\Local\GitHub\GitHub.appref-ms"
	}else if RCMD() || CAPS()
		press("{BackSpace}")
	else
		press("h")
}

mbind_i(){
	if RCMD() && LCMD(){
		if !activateWindow("OpusApp","","")
			run "C:\Program Files\Microsoft Office 15\root\office15\winword.exe"
	}else if RCMD() && CAPS()
		changeSoundDevice("0")
	else if RCMD() || CAPS()
		press("8")
	else
		press("i")
}

mbind_j(){
	if RCMD() && LCMD(){
		if !activateWindow("SunAwtFrame","idea.exe","")
			run, "C:\Program Files (x86)\JetBrains\IntelliJ IDEA Community Edition 15.0.1\bin\idea.exe"
	}else if RSHIFT() && LSHIFT()
		mouseDrag("j")
	else if CAPS() && RCMD()
		download()
	else if RCMD() || CAPS()
		press("4")
	else
		press("j")
}

mbind_k(){
	if RCMD() && LCMD(){
		if !activateWindow("SunAwtFrame","javaw.exe","")
			run, "C:\Program Files\Processing\processing-2.2.1\processing.exe"
	}else if RSHIFT() && LSHIFT()
		Send,{RButton}
	else if RCMD() || CAPS()
		press("5")
	else
		press("k")
}

mbind_l(){
	if RCMD() &&LCMD(){
		if !activateWindow("ApolloRuntimeContentWindow","",""){
			if !activateWindow("RiotWindowClass","",""){
				run "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\League of Legends\League of Legends"
			}
		}
	}else if LSHIFT() && RSHIFT()
		Send,{WheelUp}
	else if RCMD() || CAPS()
		press("6")
	else
		press("l")
}

mbind_m(){
	if RCMD() || CAPS()
		press("1")
	else if RALT()
		return ;最小化無効
	else
		press("m")
}

mbind_n(){
	if RCMD() && LCMD(){
		if !activateWindow("Notepad","","")
			run "C:\Windows\System32\notepad.exe"
	}else if RCMD() || CAPS()
		press("0")
	else
		press("n")
}

mbind_o(){
	if RCMD() && LCMD(){
		if !activateWindow("XLMAIN","","")
			run "C:\Program Files\Microsoft Office 15\root\office15\excel.exe"
	}else if RCMD() && CAPS()
		changeSoundDevice("1")
	else if RSHIFT() && LSHIFT()
		Send,{WheelLeft}
	else if RCMD() || CAPS()
		press("9")
	else
		press("o")
}

mbind_p(){
	if RCMD() && CAPS(){
		modifierBrowseToggle()
	}else if RCMD() && LCMD(){
		if !activateWindow("PPTFrameClass","","")
			run "C:\Program Files\Microsoft Office 15\root\office15\powerpnt.exe"
	}else if LSHIFT() && RSHIFT()
		Send,{WheelRight}
	else if RCMD() || CAPS()
		press("{-}")
	else
		press("p")
}

mbind_q(){
	if RCMD() && LCMD(){
		if !activateWindow("TaskManagerWindow","","")
			run "C:\Windows\System32\Taskmgr.exe"
	}else if RCMD() || CAPS()
		Send,{BackSpace}
	else if LCMD(){
		MsgBox , 1 , Confirm, Really?
		ifMsgBox, OK
			Send,!{F4}
	}else
		press("q")
}

mbind_r(){
	if RCMD() && LCMD(){
		if !activateWindow("ApplicationFrameWindow","ApplicationFrameHost.exe","Microsoft Edge")
			run "C:\Users\AHK\Dropbox\bcd\WinApp\Microsoft Edge.lnk"
	}else	if RCMD() || CAPS()
		press("{END}")
	else
		press("r")
}

mbind_s(){
	if RCMD() && LCMD(){
		if !activateWindow("tSkMainForm","","")
			run "C:\Program Files (x86)\Skype\Phone\Skype.exe"
	}else if LCMD() && CAPS()
		Send,^{PgUp}
	else if RCMD() && CAPS()
		Send,^#{Left}
	else if LSHIFT() && RSHIFT()
		mouseMove("e","d","s","f")
	else if RCMD() || CAPS()
		press("{LEFT}")
	else
		press("s")
}

mbind_t(){
	if LCMD() && RCMD(){
		if !activateWindow("ConsoleWindowClass","","")
			run, runas /user:administrator C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe
	}else if RCMD() || CAPS(){
		if historicalClipIsOn()
			HistoricalClip_return()
		else
			press("{return}")
	}else
		press("t")
}

mbind_u(){
	if RCMD() || CAPS()
		press("7")
	else
		press("u")
}

mbind_v(){
	if RCMD() || CAPS()
		HistoricalClip_openWindow()
	else
		press("v")
}

mbind_w(){
	if RCMD() || CAPS()
		press("{HOME}")
	else
		press("w")
}

mbind_x(){
	if ( CAPS() || RCMD() )&& SHIFT()
		copyTo("X")
	else if RCMD() || CAPS()
		pasteFrom("X")
	else if LCMD(){
		HistoricalClip_stackCopy()
		press("x")
	}else
		press("x")
}

mbind_y(){
	if RCMD() || CAPS()
		press("{Tab}")
	else
		press("y")
}

mbind_z(){
	if ( CAPS() || RCMD() )&& SHIFT(){
		copyTo("Z")
	}else if RCMD() || CAPS(){
		pasteFrom("Z")
	}else
		press("z")
}

mbind_1(){
	if RCMD() && LCMD() && SHIFT()
		addAlias("1")
	else if RCMD() && LCMD()
		openAlias("1")
	else if RCMD() || CAPS()
		press("{F1}")
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
	if RCMD() || CAPS()
		press("/")
	else
		press("[")
}

mbind_bracket_right(){
	if RCMD() || CAPS()
		press("=")
	else
		press("]")
}

mbind_backslash(){
	press("\")
}

mbind_semicolon(){
	if RSHIFT() && LSHIFT()
		Send,{WheelDown}
	else if RCMD() || CAPS()
		press("{+}")
	else
		press("`;")
}

mbind_quote(){
	if RSHIFT() && LSHIFT()
		Send,{MButton}
	else if RCMD() || CAPS()
		press("{*}")
	else
		press("'")
}

mbind_period(){
	if RCMD() || CAPS(){
		press("3")
	}else if RSHIFT() && LSHIFT()
		Send, {PgUp}
	else
		press(".")
}

mbind_camma(){
	if RCMD() || CAPS()
		press("2")
	else
		press(",")
}

mbind_slash(){
	if RCMD() || CAPS()
		press(".")
	else if RSHIFT() && LSHIFT()
		Send, {PgDn}
	else
		press("/")
}

;Spaceキー押し下げ時のOS時間
spaceDownTime:=0
;Spaceキー押し下げ判定（Space連打防止）
spaceDownFlag:=0
mbind_space_down(){
	global spaceDownTime
	global spaceDownFlag
	if(spaceDownFlag == 0){
		spaceDownTime := A_TickCount
		spaceDownFlag := 1
	}
}

mbind_space_up(){
	if LCMD() || RCMD()
		Send,{}
	else if CAPS()
		press("^{Space}")
	else{
		global spaceDownTime
		if(A_TickCount - spaceDownTime < 400)
			press("{Space}")
	}
	global spaceDownFlag
	spaceDownFlag := 0
}
