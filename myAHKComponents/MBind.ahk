mbind_a(){
	if (RCMD() && LCMD()) || (SPACE() && LALT()){
		if !activateWindow("Chrome_WidgetWin_1","atom.exe","")
			openApp("Atom")
	}else if RCMD() && CAPS()
		Send,{Volume_Down}
	else if RCMD() || CAPS()
		press("^{LEFT}")
	else if SPACE() && SHIFT()
		copyTo("SA")
	else if SPACE()
		pasteFrom("SA")
	else
		press("a")
}

mbind_b(){
	if SPACE() && SHIFT()
		copyTo("SB")
	else if SPACE()
		pasteFrom("SB")
	else
		press("b")
}

mbind_c(){
	if (RCMD() && LCMD()) || (SPACE() && LALT()){
		if !activateWindow("PPTFrameClass","","")
			openApp("PowerPoint")
	}else if ( CAPS() || RCMD() )&& SHIFT()
		TempMacro_open("C")
	else if RCMD() || CAPS()
		TempMacro_do("C")
	else if LCMD() && LSHIFT()
		Send,^{c}
	else if LCMD()
		HistoricalClip_copy()
	else if SPACE() && SHIFT()
		copyTo("SC")
	else if SPACE()
		pasteFrom("SC")
	else
		press("c")
}

mbind_d(){
	if (RCMD() && LCMD()) || (SPACE() && LALT())
		openApp("")
	else if LSHIFT() && RSHIFT()
		mouseMove("e","d","s","f")
	else if CAPS() && RCMD()
		IoT_keikouOff()
	else if RCMD() || CAPS(){
		if HistoricalClip_isDisplayed()
			HistoricalClip_down()
		else
			press("{DOWN}")
	}else if SPACE() && SHIFT()
		copyTo("SD")
	else if SPACE()
		pasteFrom("SD")
	else
		press("d")
}

mbind_e(){
	if (RCMD() && LCMD()) || (SPACE() && LALT()){
		if !activateWindow("TextEditorWindowW166","","")
			openApp("SakuraEditor")
	}else if CAPS() && RCMD()
		IoT_keikouOn()
	else if LSHIFT() && RSHIFT()
		mouseMove("e","d","s","f")
	else if CAPS() || RCMD(){
		if HistoricalClip_isDisplayed()
			HistoricalClip_up()
		else
			press("{UP}")
	}else if SPACE() && SHIFT()
		copyTo("SE")
	else if SPACE()
		pasteFrom("SE")
	else
		press("e")
}

mbind_f(){
	if (RCMD() && LCMD()) || (SPACE() && LALT()){
		if !activateWindow("CabinetWClass","explorer.exe","")
			openApp("Entrance")
	}else if CAPS() && RCMD()
		IoT_keikouChoukou()
	else if LCMD() && CAPS()
		Send,^{PgDn}
	else if LSHIFT() && RSHIFT()
		mouseMove("e","d","s","f")
	else if CAPS() || RCMD()
		press("{RIGHT}")
	else if SPACE() && SHIFT()
		copyTo("SF")
	else if SPACE()
		pasteFrom("SF")
	else
		press("f")
}

mbind_g(){
	if (RCMD() && LCMD()) || (SPACE() && LALT()){
		if !activateWindow("Chrome_WidgetWin_1","chrome.exe","")
			openApp("Google Chrome")
	}else if RCMD() && CAPS()
		search()
	else if RCMD() || CAPS()
		press("^{RIGHT}")
	else if SPACE() && SHIFT()
		copyTo("SG")
	else if SPACE()
		pasteFrom("SG")
	else
		press("g")
}

mbind_h(){
	if (RCMD() && LCMD()) || (SPACE() && LALT()){
		if !activateWindow("HwndWrapper","","")
			run "C:\Users\ittoo\AppData\Local\GitHub\GitHub.appref-ms"
	}else if RCMD() || CAPS()
		press("{BackSpace}")
	else if SPACE() && SHIFT()
		copyTo("SH")
	else if SPACE()
		pasteFrom("SH")
	else
		press("h")
}

mbind_i(){
	if RCMD() && CAPS()
		changeSoundDevice("1")
	else if RCMD() || (CAPS() && SHIFT())
		press("8")
	else if CAPS()
		press("{numpad8}")
	else if SPACE() && SHIFT()
		copyTo("SI")
	else if SPACE()
		pasteFrom("SI")
	else
		press("i")
}

mbind_j(){
	if (RCMD() && LCMD()) || (SPACE() && LALT()){
		if !activateWindow("SunAwtFrame","idea.exe","")
			openApp("IntelliJ IDEA")
	}else if RSHIFT() && LSHIFT()
		mouseDrag("j")
	else if CAPS() && RCMD()
		download()
	else if RCMD() || (CAPS() && SHIFT())
		press("4")
	else if CAPS()
		press("{numpad4}")
	else if SPACE() && SHIFT()
		copyTo("SJ")
	else if SPACE()
		pasteFrom("SJ")
	else
		press("j")
}

mbind_k(){
	if RSHIFT() && LSHIFT()
		Send,{RButton}
	else if RCMD() || (CAPS() && SHIFT())
		press("5")
	else if CAPS()
		press("{numpad5}")
	else if SPACE() && SHIFT()
		copyTo("SK")
	else if SPACE()
		pasteFrom("SK")
	else
		press("k")
}

mbind_l(){
	if LSHIFT() && RSHIFT()
		Send,{WheelUp}
	else if RCMD() || (CAPS() && SHIFT())
		press("6")
	else if CAPS()
		press("{numpad6}")
	else if SPACE() && SHIFT()
		copyTo("SL")
	else if SPACE()
		pasteFrom("SL")
	else
		press("l")
}

mbind_m(){
	if RCMD() || (CAPS() && SHIFT())
		press("1")
	else if CAPS()
		press("{numpad1}")
	else if SPACE() && SHIFT()
		copyTo("SM")
	else if SPACE()
		pasteFrom("SM")
	else
		press("m")
}

mbind_n(){
	if RCMD() || (CAPS() && SHIFT())
		press("0")
	else if CAPS()
		press("{numpad0}")
	else if SPACE() && SHIFT()
		copyTo("SN")
	else if SPACE()
		pasteFrom("SN")
	else
		press("n")
}

mbind_o(){
	if RCMD() && CAPS()
		changeSoundDevice("0")
	else if RSHIFT() && LSHIFT()
		Send,{WheelLeft}
	else if RCMD() || (CAPS() && SHIFT())
		press("9")
	else if CAPS()
		press("{numpad9}")
	else if SPACE() && SHIFT()
		copyTo("SO")
	else if SPACE()
		pasteFrom("SO")
	else
		press("o")
}

mbind_p(){
	if LSHIFT() && RSHIFT()
		Send,{WheelRight}
	else if RCMD() || CAPS()
		press("{-}")
	else if SPACE() && SHIFT()
		copyTo("SP")
	else if SPACE()
		pasteFrom("SP")
	else
		press("p")
}

mbind_q(){
	if (RCMD() && LCMD()) || (SPACE() && LALT()){
		if !activateWindow("TaskManagerWindow","","")
			run "C:\Windows\System32\Taskmgr.exe"
	}else if RCMD() && CAPS()
		Send,{Volume_Up}
	else if RCMD() || CAPS()
		Send,{BackSpace}
	else if LCMD(){
		;遅延時間の定義
		static CLOSE_TIME_DELAY := 400
		;変数初期化
		static windowCloseDownTime := A_TickCount - CLOSE_TIME_DELAY
		;前回押し下げが遅延時間(ms)以内に行われていた場合
		if (A_TickCount - windowCloseDownTime < CLOSE_TIME_DELAY){
			Send,!{F4}
			;今回の押し下げ時間を記録(暴発防止で遅延時間も加算)
			windowCloseDownTime := A_TickCount - CLOSE_TIME_DELAY
		}else{
			;今回の押し下げ時間を記録
			windowCloseDownTime := A_TickCount
		}
	}else if SPACE() && SHIFT()
		copyTo("SQ")
	else if SPACE()
		pasteFrom("SQ")
	else
		press("q")
}

mbind_r(){
	if (RCMD() && LCMD()) || (SPACE() && LALT()){
		if !activateWindow("IEFrame","","")
			openApp("Internet Explorer")
	}else if RCMD() && CAPS()
		IoT_coolerOn()
	else if RCMD() || CAPS()
		press("{END}")
	else if SPACE() && SHIFT()
		copyTo("SR")
	else if SPACE()
		pasteFrom("SR")
	else
		press("r")
}

mbind_s(){
	if (RCMD() && LCMD()) || (SPACE() && LALT()){
		if !activateWindow("rctrl_renwnd32","OUTLOOK.EXE","")
			openApp("Outlook")
	}else if CAPS() && RCMD()
		IoT_keikouJouya()
	else if LCMD() && CAPS()
		Send,^{PgUp}
	else if LSHIFT() && RSHIFT()
		mouseMove("e","d","s","f")
	else if RCMD() || CAPS()
		press("{LEFT}")
	else if SPACE() && SHIFT()
		copyTo("SS")
	else if SPACE()
		pasteFrom("SS")
	else
		press("s")
}

mbind_t(){
	if ( RCMD() && SHIFT() )|| (CAPS() && SHIFT() ){
		if HistoricalClip_isDisplayed(){
			HistoricalClip_closeWindow()
			HistoricalClip_paste(0,"txt")
		}
	}else if CAPS() && RCMD()
		IoT_keikouTimer30()
	else if RCMD() || CAPS(){
		if HistoricalClip_isDisplayed(){
			HistoricalClip_closeWindow()
			HistoricalClip_paste()
		}else
			press("{return}")
	}else if SPACE() && SHIFT()
		copyTo("ST")
	else if SPACE()
		pasteFrom("ST")
	else
		press("t")
}

mbind_u(){
	if RCMD() || (CAPS() && SHIFT())
		press("7")
	else if CAPS()
		press("{numpad7}")
	else if SPACE() && SHIFT()
		copyTo("SU")
	else if SPACE()
		pasteFrom("SU")
	else
		press("u")
}

mbind_v(){
	if (RCMD() && LCMD()) || (SPACE() && LALT()){
		if !activateWindow("VISIOA","VISIO.EXE","")
			openApp("Visio")
	}else if RCMD() || CAPS()
		HistoricalClip_openWindow()
	else if SPACE() && SHIFT()
		copyTo("SV")
	else if SPACE()
		pasteFrom("SV")
	else if LCMD() && LSHIFT()
		Send,^{v}
	else if LCMD() && LALT()
		IntoRemoteDesktop()
	else if LCMD()
		HistoricalClip_paste(1)
	else
		press("v")
}

mbind_w(){
	if (RCMD() && LCMD()) || (SPACE() && LALT()){
		if !activateWindow("","mstsc.exe","")
			openApp("RemoteDesktop")
	}else if RCMD() && CAPS()
		IoT_coolerOff()
	else if RCMD() || CAPS()
		press("{HOME}")
	else if SPACE() && SHIFT()
		copyTo("SW")
	else if SPACE()
		pasteFrom("SW")
	else
		press("w")
}

mbind_x(){
	if (RCMD() && LCMD()) || (SPACE() && LALT()){
		if !activateWindow("XLMAIN","","")
			openApp("Excel")
	}else if ( CAPS() || RCMD() )&& SHIFT()
		TempMacro_open("X")
	else if RCMD() || CAPS()
		TempMacro_do("X")
	else if LCMD()
		HistoricalClip_cut()
	else if SPACE() && SHIFT()
		copyTo("SX")
	else if SPACE()
		pasteFrom("SX")
	else
		press("x")
}

mbind_y(){
	if RCMD() || CAPS()
		press("{Tab}")
	else if SPACE() && SHIFT()
		copyTo("SY")
	else if SPACE()
		pasteFrom("SY")
	else
		press("y")
}

mbind_z(){
	if (RCMD() && LCMD()) || (SPACE() && LALT()){
		if !activateWindow("OpusApp","","")
			openApp("Word")
	}else if ( CAPS() || RCMD() )&& SHIFT()
		TempMacro_open("Z")
	else if RCMD() || CAPS()
		TempMacro_do("Z")
	else if SPACE() && SHIFT()
		copyTo("SZ")
	else if SPACE()
		pasteFrom("SZ")
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
	else if SPACE() && SHIFT()
		copyTo("S1")
	else if SPACE()
		pasteFrom("S1")
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
	else if SPACE() && SHIFT()
		copyTo("S2")
	else if SPACE()
		pasteFrom("S2")
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
	else if SPACE() && SHIFT()
		copyTo("S3")
	else if SPACE()
		pasteFrom("S3")
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
	else if SPACE() && SHIFT()
		copyTo("S4")
	else if SPACE()
		pasteFrom("S4")
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
	else if SPACE() && SHIFT()
		copyTo("S5")
	else if SPACE()
		pasteFrom("S5")
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
	else if SPACE() && SHIFT()
		copyTo("S6")
	else if SPACE()
		pasteFrom("S6")
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
	else if SPACE() && SHIFT()
		copyTo("S7")
	else if SPACE()
		pasteFrom("S7")
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
	else if SPACE() && SHIFT()
		copyTo("S8")
	else if SPACE()
		pasteFrom("S8")
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
	else if SPACE() && SHIFT()
		copyTo("S9")
	else if SPACE()
		pasteFrom("S9")
	else if SHIFT(){
		press("9")
		press("0")
		send,{Left}
	}else
		press("9")
}

mbind_0(){
	if RCMD() && LCMD() && SHIFT()
		addAlias("0")
	else if RCMD() && LCMD()
		openAlias("0")
	else if RCMD() || CAPS()
		press("{F10}")
	else if SPACE() && SHIFT()
		copyTo("S0")
	else if SPACE()
		pasteFrom("S0")
	else
		press("0")
}

mbind_minus(){
	if RCMD() || CAPS()
		press("{F11}")
	else if SPACE() && SHIFT()
		copyTo("SMinus")
	else if SPACE()
		pasteFrom("SMinus")
	else
		press("-")
}

mbind_equal(){
	if RCMD() || CAPS()
		press("{F12}")
	else if SPACE() && SHIFT()
		copyTo("SEqual")
	else if SPACE()
		pasteFrom("SEqual")
	else
		press("=")
}

mbind_bracket_left(){
	if RCMD() || CAPS()
		press("/")
	else if SPACE() && SHIFT()
		copyTo("SLBracket")
	else if SPACE()
		pasteFrom("SLBracket")
	else{
		press("[")
		press("]")
		send,{Left}
	}
}

mbind_bracket_right(){
	if RCMD() || CAPS()
		press("=")
	else if SPACE() && SHIFT()
		copyTo("SRBracket")
	else if SPACE()
		pasteFrom("SRBracket")
	else
		press("]")
}

mbind_backslash(){
	if SPACE() && SHIFT()
		copyTo("SBackslash")
	else if SPACE()
		pasteFrom("SBackslash")
	else
		press("\")
}

mbind_semicolon(){
	if RSHIFT() && LSHIFT()
		Send,{WheelDown}
	else if RCMD() || CAPS()
		press("{+}")
	else if SPACE() && SHIFT()
		copyTo("SSemicolon")
	else if SPACE()
		pasteFrom("SSemicolon")
	else if LCMD() && SHIFT(){
		FormatTime,hour,,HH
		FormatTime,minute,,mm
		time := hour . ":" . minute
		directInput(time)
	}else if LCMD(){
		FormatTime,year,,yyyy
		FormatTime,month,,MM
		FormatTime,day,,dd
		date := year . "/" . month . "/" . day
		directInput(date)
	}else
		press("`;")
}

mbind_quote(){
	if RSHIFT() && LSHIFT()
		Send,{MButton}
	else if RCMD() || CAPS()
		press("{*}")
	else if SPACE() && SHIFT()
		copyTo("SQuote")
	else if SPACE()
		pasteFrom("SQuote")
	else
		press("'")
}

mbind_period(){
	if RCMD() || (CAPS() && SHIFT())
		press("3")
	else if CAPS()
		press("{numpad3}")
	else if RSHIFT() && LSHIFT()
		Send, {PgUp}
	else if SPACE() && SHIFT()
		copyTo("SPeriod")
	else if SPACE()
		pasteFrom("SPeriod")
	else
		press(".")
}

mbind_camma(){
	if RCMD() || (CAPS() && SHIFT())
		press("2")
	else if CAPS()
		press("{numpad2}")
	else if SPACE() && SHIFT()
		copyTo("SCamma")
	else if SPACE()
		pasteFrom("SCamma")
	else
		press(",")
}

mbind_slash(){
	if RCMD() || CAPS()
		press(".")
	else if RSHIFT() && LSHIFT()
		Send, {PgDn}
	else if SPACE() && SHIFT()
		copyTo("SSlash")
	else if SPACE()
		pasteFrom("SSlash")
	else
		press("/")
}

mbind_backspace(){
	if RCMD(){
		;一行消し
		lineDel("HOME")
	}else if SPACE() && SHIFT()
		copyTo("SBackspace")
	else if SPACE()
		pasteFrom("SBackspace")
	else
		press("{BackSpace}")
}

mbind_delete(){
	if RCMD(){
		;一行消し
		lineDel("END")
	}else if SPACE() && SHIFT()
		copyTo("SDelete")
	else if SPACE()
		pasteFrom("SDelete")
	else
		press("{Delete}")
}

mbind_escape(){
	if CAPS(){
		send,{Delete}
	}else if SPACE() && SHIFT()
		copyTo("SEscape")
	else if SPACE()
		pasteFrom("SEscape")
	else
		press("{Esc}")
}

;Spaceキーバインド消費判定(拡張ClipboardのSpace消費フラグ)
spaceConsumed := 0
consumeSpace(){
	global spaceConsumed
	spaceConsumed := 1
}
;Spaceキー押し下げ時のOS時間
spaceDownTime := 0
;Spaceキー押し下げ判定（Space連打防止）
spaceDownFlag := 0
mbind_space_down(){
	global spaceConsumed
	global spaceDownTime
	global spaceDownFlag

	;Spaceキー押し下げ判定がない場合（初回入力）
	if(spaceDownFlag == 0){
		;初回押し下げ時間の記録
		spaceDownTime := A_TickCount
		;押し下げ判定付与
		spaceDownFlag := 1
		;Spaceバインド未消費判定付与
		spaceConsumed := 0
	}

	;IME切り替え（即時発動）
	if LCMD() || RCMD(){
		Send,!{``}
		spaceConsumed := 1
	}
}

mbind_space_up(){
	global spaceDownFlag
	global spaceDownTime
	global spaceConsumed

	;Spaceキー押下げ判定を解除
	spaceDownFlag := 0
	;Spaceバインドが消費済みならば、各バインド判定を無効にして終了
	if (spaceConsumed == 1){
		if HistoricalClip_isDisplayed(){
			HistoricalClip_closeWindow()
			if SHIFT(){
				HistoricalClip_paste(0,"txt")
			}else{
				HistoricalClip_paste()
			}
		}
		return
	}

	;各種Spaceバインド
	if CAPS()
		press("^{Space}")
	else if LALT()
		Send,{}
	else if(A_TickCount - spaceDownTime < 400){
			press("{Space}")
	}
}
