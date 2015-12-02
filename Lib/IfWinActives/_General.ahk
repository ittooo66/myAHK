;タスクバー上
#IfWinActive,ahk_class Shell_TrayWnd
	WheelUp::Send,{Volume_Up}
	WheelDown::Send,{Volume_Down}

	XButton1::return
	XButton2::return
#IfWinActive

;Win+Tab時の画面上
#IfWinActive,ahk_class MultitaskingViewFrame
	WheelUp::Send,{Left}
	WheelDown::Send,{Right}
	MButton::Send,{Return}
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

;Command Prompt,Powershell
#IfWinActive,ahk_class ConsoleWindowClass
	^L::SendInput , {Esc}cls{Enter}
	vkEBsc07B & q::SendInput , {Esc}exit{Enter}
#IfWinActive
