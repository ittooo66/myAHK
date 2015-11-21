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

;Reader
#IfWinActive, ahk_exe AcroRd32.exe
	;スクロールの調整
	XButton2 & LButton::
		Send,{MButton down}
		while (GetKeyState("LButton", "P"))
				Sleep, 10
		Send,{MButton up}
	Return
#IfWinActive

;Atom
#IfWinActive,ahk_exe atom.exe
	^Tab::Send,^{0}
	XButton2 & LButton::intelliScroll()
#IfWinActive

;Command Prompt,Powershell
#IfWinActive,ahk_class ConsoleWindowClass
	^L::SendInput , {Esc}cls{Enter}
	vkEBsc07B & q::SendInput , {Esc}exit{Enter}
#IfWinActive
