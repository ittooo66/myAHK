mbind_a(){
	if (SPACE() && CAPS()){
		launch("A",SHIFT())
	}else if LSHIFT() && RSHIFT()
		mouseMoveFast("w","r","a","g")
	else if CAPS() && ALT()
		Send,{Volume_Down}
	else if LCMD() && CAPS(){
		;Chromeの画面縮小。Q側の拡大バインドと対応
		Send,^{NumpadSub}
	}else if RCMD() || CAPS()
		press("^{LEFT}")
	else if SPACE() && SHIFT()
		ClipExt_copyTo("SA")
	else if SPACE()
		ClipExt_pasteFrom("SA")
	else
		press("a")
}

mbind_b(){
	if SPACE() && SHIFT()
		ClipExt_copyTo("SB")
	else if SPACE()
		ClipExt_pasteFrom("SB")
	else if RCMD() || CAPS()
		press("{PgDn}")
	else
		press("b")
}

mbind_c(){
	if (SPACE() && CAPS()){
		launch("C",SHIFT())
	}else if ( CAPS() || RCMD() )&& SHIFT()
		run notepad.exe %A_WorkingDir%\myAHKComponents\Resources\TempMacro\MacroC.ahk
	else if RCMD() || CAPS()
		MacroC()
	else if LCMD()
		ClipExt_copy()
	else if SPACE() && SHIFT()
		ClipExt_copyTo("SC")
	else if SPACE()
		ClipExt_pasteFrom("SC")
	else
		press("c")
}

mbind_d(){
	if (SPACE() && CAPS()){
		launch("D",SHIFT())
	}else if LSHIFT() && RSHIFT()
		mouseMove("e","d","s","f")
	else if CAPS() && ALT(){
		Send, ^l
		clipboard =
		Send, ^c
		ClipWait
		execScripts("youtube-dl-mp3.ps1")
		msgBox, Queued. URL:%Clipboard%
	}else if RCMD() || CAPS(){
		press("{DOWN}")
	}else if SPACE() && SHIFT()
		ClipExt_copyTo("SD")
	else if SPACE()
		ClipExt_pasteFrom("SD")
	else
		press("d")
}

mbind_e(){
	if (SPACE() && CAPS()){
		launch("E",SHIFT())
	}else if LSHIFT() && RSHIFT()
		mouseMove("e","d","s","f")
	else if CAPS() || RCMD(){
		press("{UP}")
	}else if SPACE() && SHIFT()
		ClipExt_copyTo("SE")
	else if SPACE()
		ClipExt_pasteFrom("SE")
	else
		press("e")
}

mbind_f(){
	if (SPACE() && CAPS() && SHIFT()){
		activateWindow("CabinetWClass","explorer.exe","", 1 )
	}else	if (SPACE() && CAPS()){
		if !activateWindow("CabinetWClass","explorer.exe","")
			Send,#{e}
	}else if LCMD() && CAPS()
		Send,^{PgDn}
	else if LSHIFT() && RSHIFT()
		mouseMove("e","d","s","f")
	else if CAPS() || RCMD()
		press("{RIGHT}")
	else if SPACE() && SHIFT()
		ClipExt_copyTo("SF")
	else if SPACE()
		ClipExt_pasteFrom("SF")
	else
		press("f")
}

mbind_g(){
	if (SPACE() && CAPS()){
		launch("G",SHIFT())
	}else if LSHIFT() && RSHIFT()
		mouseMoveFast("w","r","a","g")
	else if RCMD() || CAPS()
		press("^{RIGHT}")
	else if SPACE() && SHIFT()
		ClipExt_copyTo("SG")
	else if SPACE()
		ClipExt_pasteFrom("SG")
	else
		press("g")
}

mbind_h(){
	if LSHIFT() && RSHIFT()
		moveWindow()
	else if RCMD() || CAPS()
		press("{BackSpace}")
	else if SPACE() && SHIFT()
		ClipExt_copyTo("SH")
	else if SPACE()
		ClipExt_pasteFrom("SH")
	else
		press("h")
}

mbind_i(){
	if LSHIFT() && RSHIFT()
		Send,{MButton}
	else if RCMD() || (CAPS() && SHIFT())
		press("8")
	else if CAPS() & SPACE(){
		consumeSpace()
		addTaskToTrello()
	}else if CAPS()
		press("{numpad8}")
	else if SPACE() && SHIFT()
		ClipExt_copyTo("SI")
	else if SPACE()
		ClipExt_pasteFrom("SI")
	else
		press("i")
}

mbind_j(){
	if LSHIFT() && RSHIFT()
		mousePress("j")
	else if RCMD() || (CAPS() && SHIFT())
		press("4")
	else if CAPS()
		press("{numpad4}")
	else if SPACE() && SHIFT()
		ClipExt_copyTo("SJ")
	else if SPACE()
		ClipExt_pasteFrom("SJ")
	else
		press("j")
}

mbind_k(){
	if LSHIFT() && RSHIFT()
		Send,{RButton}
	else if RCMD() || (CAPS() && SHIFT())
		press("5")
	else if CAPS()
		press("{numpad5}")
	else if SPACE() && SHIFT()
		ClipExt_copyTo("SK")
	else if SPACE()
		ClipExt_pasteFrom("SK")
	else
		press("k")
}

mbind_l(){
	if LSHIFT() && RSHIFT()
		Send,{WheelUp}
	else if RCMD() || (CAPS() && SHIFT())
		press("6")
	else if CAPS() & LCMD()
		Send,^{l}
	else if CAPS()
		press("{numpad6}")
	else if SPACE() && SHIFT()
		ClipExt_copyTo("SL")
	else if SPACE()
		ClipExt_pasteFrom("SL")
	else if LCMD(){
		;Win+L問題のため無効化。Lキーと組み合わせたとたんダメになる。
		;上で書いてる通り、CAPS付きで入力すること。
	}else
		press("l")
}

mbind_m(){
	if RCMD() || (CAPS() && SHIFT())
		press("1")
	else if CAPS()
		press("{numpad1}")
	else if SPACE() && SHIFT()
		ClipExt_copyTo("SM")
	else if SPACE()
		ClipExt_pasteFrom("SM")
	else
		press("m")
}

mbind_n(){
	if LSHIFT() && RSHIFT()
		changeWindowSize()
	else if RCMD() || (CAPS() && SHIFT())
		press("0")
	else if CAPS()
		press("{numpad0}")
	else if SPACE() && SHIFT()
		ClipExt_copyTo("SN")
	else if SPACE()
		ClipExt_pasteFrom("SN")
	else
		press("n")
}

mbind_o(){
	if RCMD() || (CAPS() && SHIFT())
		press("9")
	else if CAPS()
		press("{numpad9}")
	else if SPACE() && SHIFT()
		ClipExt_copyTo("SO")
	else if SPACE()
		ClipExt_pasteFrom("SO")
	else
		press("o")
}

mbind_p(){
	if RCMD() || CAPS()
		press("{PrintScreen}")
	else if SPACE() && SHIFT()
		ClipExt_copyTo("SP")
	else if SPACE()
		ClipExt_pasteFrom("SP")
	else
		press("p")
}

mbind_q(){
	if (SPACE() && CAPS()){
		launch("Q",SHIFT())
	}else if LSHIFT() && RSHIFT()
		mouseCursorResetToCenter()
	else if CAPS() && ALT()
		Send,{Volume_Up}
	else if LCMD() && CAPS(){
		;Chromeの画面拡大。A側の拡大バインドと対応
		;Explorerの表示整理バインドでもある
		Send,^{NumpadAdd}
	}else if RCMD() || CAPS()
		Send,{BackSpace}
	else if LCMD(){
		;セーフティ付きのAltF4

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
		ClipExt_copyTo("SQ")
	else if SPACE()
		ClipExt_pasteFrom("SQ")
	else
		press("q")
}

mbind_r(){
	if CAPS() && ALT(){
		execScripts("explorer_restart.bat")
	}else if SPACE() && CAPS(){
		launch("R",SHIFT())
	}else if LSHIFT() && RSHIFT()
		mouseMoveFast("w","r","a","g")
	else if RCMD() || CAPS()
		press("{END}")
	else if SPACE() && SHIFT()
		ClipExt_copyTo("SR")
	else if SPACE()
		ClipExt_pasteFrom("SR")
	else
		press("r")
}

mbind_s(){
	if SPACE() && CAPS(){
		launch("S",SHIFT())
	}else if LCMD() && CAPS()
		Send,^{PgUp}
	else if LSHIFT() && RSHIFT()
		mouseMove("e","d","s","f")
	else if CAPS() & ALT()
		Send,#+{s}
	else if RCMD() || CAPS()
		press("{LEFT}")
	else if SPACE() && SHIFT()
		ClipExt_copyTo("SS")
	else if SPACE()
		ClipExt_pasteFrom("SS")
	else
		press("s")
}

mbind_t(){
	if RCMD() || CAPS(){
		press("{return}")
	}else if SPACE() && SHIFT()
		ClipExt_copyTo("ST")
	else if SPACE()
		ClipExt_pasteFrom("ST")
	else
		press("t")
}

mbind_u(){
	if RCMD() || (CAPS() && SHIFT())
		press("7")
	else if CAPS()
		press("{numpad7}")
	else if SPACE() && SHIFT()
		ClipExt_copyTo("SU")
	else if SPACE()
		ClipExt_pasteFrom("SU")
	else
		press("u")
}

mbind_v(){
	if (SPACE() && CAPS() && SHIFT()){
		run , "C:\Program Files\TrueCrypt\TrueCrypt.exe" /q /dr
	}else if (SPACE() && CAPS()){
		run , "C:\Program Files\TrueCrypt\TrueCrypt.exe" /q /v \Device\Harddisk1\Partition0 /lr
	}else if RCMD() || CAPS()
		ClipExt_openLog()
	else if SPACE() && SHIFT()
		ClipExt_copyTo("SV")
	else if SPACE()
		ClipExt_pasteFrom("SV")
	else if LCMD() && LALT(){
		;テキスト形式にして貼り付け
		arg = %clipboard%
		directInput(arg)
	}else
		press("v")
}

mbind_w(){
	if (SPACE() && CAPS())
		launch("W",SHIFT())
	else if LSHIFT() && RSHIFT()
		mouseMoveFast("w","r","a","g")
	else if RCMD() || CAPS()
		press("{HOME}")
	else if SPACE() && SHIFT()
		ClipExt_copyTo("SW")
	else if SPACE()
		ClipExt_pasteFrom("SW")
	else
		press("w")
}

mbind_x(){
	if SPACE() && CAPS()
		launch("X",SHIFT())
	else if ( CAPS() || RCMD() )&& SHIFT()
		run notepad.exe %A_WorkingDir%\myAHKComponents\Resources\TempMacro\MacroX.ahk
	else if RCMD() || CAPS()
		MacroX()
	else if LCMD()
		ClipExt_cut()
	else if SPACE() && SHIFT()
		ClipExt_copyTo("SX")
	else if SPACE()
		ClipExt_pasteFrom("SX")
	else
		press("x")
}

mbind_y(){
	if SPACE() && SHIFT()
		ClipExt_copyTo("SY")
	else if SPACE()
		ClipExt_pasteFrom("SY")
	else if RCMD() || CAPS()
		press("{PgUp}")
	else
		press("y")
}

mbind_z(){
	if SPACE() && CAPS()
		launch("Z",SHIFT())
	else if ( CAPS() || RCMD() )&& SHIFT()
		run notepad.exe %A_WorkingDir%\myAHKComponents\Resources\TempMacro\MacroZ.ahk
	else if RCMD() || CAPS()
		MacroZ()
	else if SPACE() && SHIFT()
		ClipExt_copyTo("SZ")
	else if SPACE()
		ClipExt_pasteFrom("SZ")
	else if SHIFT() && LCMD()
		;Shift押しで「進む」
		Send,^{y}
	else
		press("z")
}

mbind_1(){
	if CAPS() && ALT(){
		;表示Window制御：左画面のみ(EIZO 27 4K 150%)に表示
		Send,{RWin Down}{p}{RWin Up}
		Sleep 200
		Send,{End}{Return}{Esc}
		Reload	;GrabWindowの挙動がおかしくなるのでReloadしてみる
	}else if SPACE() && CAPS() && SHIFT(){
		ClipExt_addAlias("1")
		consumeSpace()
	}else if SPACE() && CAPS(){
		ClipExt_openAlias("1")
		consumeSpace()
	}else if RCMD() || CAPS(){
		;F1無効化
	}else if SPACE() && SHIFT()
		ClipExt_copyTo("S1")
	else if SPACE()
		ClipExt_pasteFrom("S1")
	else
		press("1")
}

mbind_2(){
	if CAPS() && ALT(){
		;表示Window制御：全画面に表示
		Send,{RWin Down}{p}{RWin Up}
		Sleep 200
		Send,{End}{Up}{Return}{Esc}
		Reload	;GrabWindowの挙動がおかしくなるのでReloadしてみる
	}else if SPACE() && CAPS() && SHIFT(){
		ClipExt_addAlias("2")
		consumeSpace()
	}else if SPACE() && CAPS(){
		ClipExt_openAlias("2")
		consumeSpace()
	}else if RCMD() || CAPS()
		press("{F2}")
	else if SPACE() && SHIFT()
		ClipExt_copyTo("S2")
	else if SPACE()
		ClipExt_pasteFrom("S2")
	else
		press("2")
}

mbind_3(){
	if CAPS() && ALT(){
		;表示Window制御：右画面のみ(BenQ 24 FHD 100%)に表示
		Send,{RWin Down}{p}{RWin Up}
		Sleep 200
		Send,{Home}{Return}{Esc}
		Reload	;GrabWindowの挙動がおかしくなるのでReloadしてみる
	}else if SPACE() && CAPS() && SHIFT(){
		ClipExt_addAlias("3")
		consumeSpace()
	}else if SPACE() && CAPS(){
		ClipExt_openAlias("3")
		consumeSpace()
	}else if RCMD() || CAPS()
		press("{F3}")
	else if SPACE() && SHIFT()
		ClipExt_copyTo("S3")
	else if SPACE()
		ClipExt_pasteFrom("S3")
	else
		press("3")
}

mbind_4(){
	if SPACE() && CAPS() && SHIFT(){
		ClipExt_addAlias("4")
		consumeSpace()
	}else if SPACE() && CAPS(){
		ClipExt_openAlias("4")
		consumeSpace()
	}else if RCMD() || CAPS()
		press("{F4}")
	else if SPACE() && SHIFT()
		ClipExt_copyTo("S4")
	else if SPACE()
		ClipExt_pasteFrom("S4")
	else
		press("4")
}

mbind_5(){
	if SPACE() && CAPS() && SHIFT(){
		ClipExt_addAlias("5")
		consumeSpace()
	}else if SPACE() && CAPS(){
		ClipExt_openAlias("5")
		consumeSpace()
	}else if RCMD() || CAPS()
		press("{F5}")
	else if SPACE() && SHIFT()
		ClipExt_copyTo("S5")
	else if SPACE()
		ClipExt_pasteFrom("S5")
	else
		press("5")
}

mbind_6(){
	if RCMD() || CAPS()
		press("{F6}")
	else if SPACE() && CAPS() && SHIFT(){
		ClipExt_addAlias("6")
		consumeSpace()
	}else if SPACE() && CAPS(){
		ClipExt_openAlias("6")
		consumeSpace()
	}else if SPACE() && SHIFT()
		ClipExt_copyTo("S6")
	else if SPACE()
		ClipExt_pasteFrom("S6")
	else
		press("6")
}

mbind_7(){
	if RCMD() || CAPS()
		press("{F7}")
	else if SPACE() && CAPS() && SHIFT()
		ClipExt_addAlias("7")
	else if SPACE() && CAPS()
		ClipExt_openAlias("7")
	else if SPACE() && SHIFT()
		ClipExt_copyTo("S7")
	else if SPACE()
		ClipExt_pasteFrom("S7")
	else
		press("7")
}

mbind_8(){
	if RCMD() || CAPS()
		press("{F8}")
	else if SPACE() && CAPS() && SHIFT(){
		ClipExt_addAlias("8")
		consumeSpace()
	}else if SPACE() && CAPS(){
		ClipExt_openAlias("8")
		consumeSpace()
	}else if SPACE() && SHIFT()
		ClipExt_copyTo("S8")
	else if SPACE()
		ClipExt_pasteFrom("S8")
	else
		press("8")
}

mbind_9(){
	if SPACE() && CAPS() && SHIFT(){
		ClipExt_addAlias("9")
		consumeSpace()
	}else if SPACE() && CAPS(){
		ClipExt_openAlias("9")
		consumeSpace()
	}else if SPACE() && SHIFT()
		ClipExt_copyTo("S9")
	else if SPACE()
		ClipExt_pasteFrom("S9")
	else if SHIFT()
		Send,{(}{)}{Left}
	else if RCMD() || CAPS()
		press("{F9}")
	else
		press("9")
}

mbind_0(){
	if SPACE() && CAPS() && SHIFT(){
		ClipExt_addAlias("0")
		consumeSpace()
	}else if SPACE() && CAPS(){
		ClipExt_openAlias("0")
		consumeSpace()
	}else if SPACE() && SHIFT()
		ClipExt_copyTo("S0")
	else if SPACE()
		ClipExt_pasteFrom("S0")
	else if RCMD() || CAPS()
		press("{F10}")
	else
		press("0")
}

mbind_minus(){
	if RCMD() || CAPS()
		press("{F11}")
	else if SPACE() && SHIFT()
		ClipExt_copyTo("SMinus")
	else if SPACE()
		ClipExt_pasteFrom("SMinus")
	else
		press("-")
}

mbind_equal(){
	if RCMD() || CAPS()
		press("{F12}")
	else if SPACE() && SHIFT()
		ClipExt_copyTo("SEqual")
	else if SPACE()
		ClipExt_pasteFrom("SEqual")
	else
		press("=")
}

mbind_bracket_left(){
	if ( CAPS() || RCMD() )&& SHIFT()
		run notepad.exe %A_WorkingDir%\myAHKComponents\Resources\TempMacro\MacroBRL.ahk
	else if RCMD() || CAPS()
		MacroBRL()
	else if SPACE() && SHIFT()
		ClipExt_copyTo("SLBracket")
	else if SPACE()
		ClipExt_pasteFrom("SLBracket")
	else{
		press("[")
		press("]")
		send,{Left}
	}
}

mbind_bracket_right(){
	if ( CAPS() || RCMD() )&& SHIFT()
		run notepad.exe %A_WorkingDir%\myAHKComponents\Resources\TempMacro\MacroBRR.ahk
	else if RCMD() || CAPS()
		MacroBRR()
	else if SPACE() && SHIFT()
		ClipExt_copyTo("SRBracket")
	else if SPACE()
		ClipExt_pasteFrom("SRBracket")
	else
		press("]")
}

mbind_backslash(){
	if ( CAPS() || RCMD() )&& SHIFT()
		run notepad.exe %A_WorkingDir%\myAHKComponents\Resources\TempMacro\MacroYEN.ahk
	else if RCMD() || CAPS()
		MacroYEN()
	else if SPACE() && SHIFT()
		ClipExt_copyTo("SBackslash")
	else if SPACE()
		ClipExt_pasteFrom("SBackslash")
	else
		press("\")
}

mbind_semicolon(){
	if ( CAPS() || RCMD() )&& SHIFT()
		run notepad.exe %A_WorkingDir%\myAHKComponents\Resources\TempMacro\MacroSMC.ahk
	else if RCMD() || CAPS()
		MacroSMC()
	else if LSHIFT() && RSHIFT()
		Send,{WheelDown}
	else if SPACE() && SHIFT()
		ClipExt_copyTo("SSemicolon")
	else if SPACE()
		ClipExt_pasteFrom("SSemicolon")
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
	}else if SHIFT()
		Send,{:}
	else
		press("`;")
}

mbind_quote(){
	if RCMD() || CAPS()
		press("{*}")
	else if SPACE() && SHIFT()
		ClipExt_copyTo("SQuote")
	else if SPACE()
		ClipExt_pasteFrom("SQuote")
	else
		press("'")
}

mbind_period(){
	if RCMD() || (CAPS() && SHIFT())
		press("3")
	else if CAPS()
		press("{numpad3}")
	else if SPACE() && SHIFT()
		ClipExt_copyTo("SPeriod")
	else if SPACE()
		ClipExt_pasteFrom("SPeriod")
	else
		press(".")
}

mbind_camma(){
	if RCMD() || (CAPS() && SHIFT())
		press("2")
	else if CAPS()
		press("{numpad2}")
	else if SPACE() && SHIFT()
		ClipExt_copyTo("SCamma")
	else if SPACE()
		ClipExt_pasteFrom("SCamma")
	else
		press(",")
}

mbind_slash(){
	if ( CAPS() || RCMD() )&& SHIFT()
		run notepad.exe %A_WorkingDir%\myAHKComponents\Resources\TempMacro\MacroSLS.ahk
	else if RCMD() || CAPS()
		MacroSLS()
	else if SPACE() && SHIFT()
		ClipExt_copyTo("SSlash")
	else if SPACE()
		ClipExt_pasteFrom("SSlash")
	else
		press("/")
}

mbind_backspace(){
	if RCMD(){
		;一行消し
		Send,+{Home}
		ClipExt_copy()
		Send,{BackSpace}
	}else if SPACE() && SHIFT()
		ClipExt_copyTo("SBackspace")
	else if SPACE()
		ClipExt_pasteFrom("SBackspace")
	else
		press("{BackSpace}")
}

mbind_return(){
	CMD_HOME_DIR := getEnv("CMD_HOME_DIR") 
	if (SPACE() && CAPS() && SHIFT()) 
		run, C:\WINDOWS\system32\cmd.exe e /k doskey && cd %CMD_HOME_DIR% && ssh ManagementServer
	else if (SPACE() && CAPS()){
		if !activateWindow("ConsoleWindowClass","cmd.exe","")
			run, C:\WINDOWS\system32\cmd.exe e /k doskey && cd %CMD_HOME_DIR% && ssh ManagementServer
	}else if CAPS() || RCMD() {
		Send,^{Return}
	}else{
		press("{Return}")
	}
}

mbind_delete(){
	if RCMD(){
		;一行消し
		Send,+{End}
		ClipExt_copy()
		Send,{BackSpace}
	}else if SPACE() && SHIFT()
		ClipExt_copyTo("SDelete")
	else if SPACE()
		ClipExt_pasteFrom("SDelete")
	else
		press("{Delete}")
}

mbind_escape(){
	if CAPS(){
		send,{Delete}
	}else if SPACE() && SHIFT()
		ClipExt_copyTo("SEscape")
	else if SPACE()
		ClipExt_pasteFrom("SEscape")
	else
		press("{Esc}")
}

mbind_mlb(){
	if MRB(){
		Send,!{Up}
	}else if MMB(){
		Send,#{Tab}
	}else if MSBRB(){
		execScripts("PhilipsHueOn.bat " . A_HUE_BRI . " " . A_HUE_CT )
	}else if MSBLF(){
		intelliScroll()
	}else if MSBLB(){
		if !activateWindow("CabinetWClass","explorer.exe","")
			Send,#{e}
	}else if MSBRF(){
		; 要EarTrunpetショートカット設定
		Send,^+{q}
	}else{
		Send,{LButton}
	}
}

mbind_mrb(){
	if MMB(){
		Send,^{n}
	}else if MSBRB(){
		execScripts("PhilipsHueOff.bat")
	}else if MSBLB(){
		Send,{RWin}
	}else if MSBLF(){
		MouseGetPos,mx,my
		WinGetPos,wx,wy,,,a
		mx+=wx
		my+=wy
		while(GetKeyState("RButton","P")){
			FormatTime,month,,M
			FormatTime,daily,,d
			FormatTime,yb,,ddd
			FormatTime,hour,,H
			FormatTime,minute,,mm
			FormatTime,second,,ss
			SplashImage,,CW000000 CT66cdaa B1 FM18 W180 X%mx% Y%my% ,,%month%/%daily%(%yb%)  %hour%:%minute%:%second% ,,MS Gothic
			sleep , 1000
		}
		SplashImage,off
	}else if MSBRF(){
		muteNMin()
	}else{
		Send,{RButton}
	}
}

mbind_mmb(){
	if MRB(){
		Send,^{t}
	}else if MSBRB(){
		InputBox, ct , SELECTCOLOR , choose color temp (150-450) ,, 200, 130,,,,,300
		if ErrorLevel <> 0
			return
		else {
			If ct is integer
			{
				A_HUE_CT := ct
				execScripts("PhilipsHueOn.bat " . A_HUE_BRI . " " . A_HUE_CT )
				setEnv("A_HUE_CT", A_HUE_CT)
			}else
				msgbox, Invalid Input Number
		}
	}else{
		moveWindow()
	}
}

mbind_msblb(){
	if MRB(){
		Send,^{w}
	}else if MMB(){
		WinMinimize, A
	}else if MSBLF(){
		changeWindowSize()
	}else if MSBRF(){
		changeSoundDevice("2")
	}else{
		Send,{XButton1}
	}
}

mbind_msblf(){
	if MRB(){
		Send,^+{t}
	}else if MSBRF(){
		changeSoundDevice("0")
	}else if MSBLB(){
		changeWindowSize()
	}else if MSBLF(){
		activeAllWindow()
	}else{
		Send,{XButton2}
	}
}

mbind_msbrb(){
}

mbind_msbrf(){
}

mbind_wheelup(){
	if MRB()
		Send,^{PgUp}
	else if MSBLF()
		Send,{WheelLeft}
	else if MSBRF()
		Send,#^{Volume_Up}
	else if MSBRB() {
		if ( A_HUE_BRI <= 762 ){
			A_HUE_BRI := A_HUE_BRI + 40
		} else {
			A_HUE_BRI := 762
		}
		execScripts("PhilipsHueOn.bat " . A_HUE_BRI . " " . A_HUE_CT )
		setEnv("A_HUE_BRI", A_HUE_BRI)
	}else if MMB()
		Send,#^{Left}
	else
		Send,{WheelUp}
}

mbind_wheeldown(){
	if MRB()
		Send,^{PgDn}
	else if MSBLF()
		Send,{WheelRight}
	else if MSBRF()
		Send,#^{Volume_Down}
	else if MSBRB() {
		if ( A_HUE_BRI >= 0 ){
			A_HUE_BRI := A_HUE_BRI - 40
		} else {
			A_HUE_BRI := 0
		}
		execScripts("PhilipsHueOn.bat " . A_HUE_BRI . " " . A_HUE_CT )
		setEnv("A_HUE_BRI", A_HUE_BRI)
	}else if MMB()
		Send,#^{Right}
	else
		Send,{WheelDown}
}

consumeSpace(){
	A_SpaceConsumeFlag := 1
}

mbind_space_down(){
	;Spaceキー押し下げ判定がない場合（初回入力）
	if (A_SpaceDownFlag == 0){
		;押し下げ判定付与
		A_SpaceDownFlag := 1
		;初回押し下げ時間の記録
		A_SpaceDownTime := A_TickCount
		;Spaceバインド未消費判定付与
		A_SpaceConsumeFlag := 0
	}

	;IME切り替え（即時発動）
	if LCMD() || RCMD(){
		Send,!{``}
		consumeSpace()
	}
}

mbind_space_up(){
	;Spaceキー押下げ判定を解除
	A_SpaceDownFlag := 0
	;Spaceバインドが消費済みならば、各バインド判定を無効にして終了
	if (A_SpaceConsumeFlag != 0)
		return
	;各種Spaceバインド
	;　一定時間経過後のスペースキーを修飾キー(入力なし)として扱う
	if CAPS()
		press("^{Space}")
	else if(A_TickCount - A_SpaceDownTime < 400){
		press("{Space}")
	}
}
