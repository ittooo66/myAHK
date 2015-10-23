;Chrome
#IfWinActive, ahk_exe chrome.exe
	>^q::
	<^q::
	LControl & q::
	LWin & q::
		if LCMD() && CTRL()
			send,{Browser_back}
		else
			mbind_q()
	return

	>^w::
	<^w::
	LControl & w::
	LWin & w::
		if LCMD() && CTRL()
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
;QTTabBar設定
;	表示->オプション->QTTabBarで有効化
;	タブ上右クリ->QTTabBarのオプション->ショートカットキー->現在のタブのロック／ロック解除
;		Ctrl+L　を　Ctrl+；に
#IfWinActive,ahk_class CabinetWClass
	RButton & XButton1::Send,^{w}
	RButton & XButton2::Send,^+{z}
	RButton & LButton::Send,^{`;}
	RButton & MButton::Send,^{n}
	RButton & WheelUp::Send,^+{Tab}
	RButton & WheelDown::Send,^{Tab}

	LControl & s::
	LWin & s::
		if CTRL() && LCMD()
			Send,^+{Tab}
		else
			mbind_s()
	return

	LControl & f::
	LWin & f::
		if CTRL() && LCMD()
			Send,^{Tab}
		else
			mbind_s()
	return

	LWin & t::Send,{}
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
	;要wheelscroll.ahk
	<+WheelUp::WheelLeft
	<+WheelDown::WheelRight
#IfWinActive

;Atom
#IfWinActive,ahk_exe atom.exe
	^Tab::Send,^{0}
	XButton2 & LButton::intelliScroll()
#IfWinActive

;Command Prompt,Powershell
#IfWinActive,ahk_class ConsoleWindowClass
	^L::SendInput , {Esc}cls{Enter}
	LWin & q::SendInput , {Esc}exit{Enter}
#IfWinActive
