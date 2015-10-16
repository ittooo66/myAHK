;Chrome
#IfWinActive, ahk_exe chrome.exe
	>^q::
	<^q::
	RControl & q::
	LControl & q::
		if LCMD() && CAPS()
			send,{Browser_back}
		else
			mbind_q()
	return

	>^w::
	<^w::
	RControl & w::
	LControl & w::
		if LCMD() && CAPS()
			send,{Browser_forward}
		else
			mbind_w()
	return

	XButton2 & LButton::
	    Send,{MButton}
	    While (GetKeyState("LButton", "P") && GetKeyState("Xbutton2","P"))
	        Sleep, 10
	    Send,{MButton}
	Return
#IfWinActive

;タスクバー上
#IfWinActive,ahk_class Shell_TrayWnd
	WheelUp::Send,{Volume_Up}
	WheelDown::Send,{Volume_Down}

	XButton1::return
	XButton2::return
#IfWinActive

;デスクトップ上
#IfWinActive,ahk_class WorkerW
	XButton1::return
	XButton2::return
#IfWinActive

;デスクトップ上(ラボPCだとこっち)
#IfWinActive,ahk_class Progman
	XButton1::return
	XButton2::return
#IfWinActive

;エクスプローラー（QTTabBar使ってます）
#IfWinActive,ahk_class CabinetWClass
	RButton & XButton1::Send,^{w}
	RButton & XButton2::Send,^+{z}
	RButton & LButton::Send,^{`;}
	RButton & MButton::Send,^{n}
	RButton & WheelUp::Send,^+{Tab}
	RButton & WheelDown::Send,^{Tab}

	RControl & s::
	LControl & s::
		if CAPS() && LCMD()
			Send,^+{Tab}
		else
			mbind_s()
	return

	RControl & f::
	LControl & f::
		if CAPS() && LCMD()
			Send,^{Tab}
		else
			mbind_s()
	return

	LControl & t::Send,{}

#IfWinActive

;Reader
#IfWinActive, ahk_exe AcroRd32.exe
	;スクロールの調整
	XButton2 & LButton::
		Send,{MButton down}
		While (GetKeyState("LButton", "P"))
				Sleep, 10
		Send,{MButton up}
	Return
#IfWinActive

;Excel
#IfWinActive,ahk_class XLMAIN
	要wheelscroll.ahk
	<+WheelUp::WheelLeft
	<+WheelDown::WheelRight

#IfWinActive

;Atom
#IfWinActive,ahk_exe atom.exe
	^Tab::Send,^{0}
#IfWinActive

;Command Prompt,Powershell
#IfWinActive,ahk_class ConsoleWindowClass
	^L::SendInput , {Esc}cls{Enter}
	LControl & q::SendInput , {Esc}exit{Enter}
#IfWinActive
