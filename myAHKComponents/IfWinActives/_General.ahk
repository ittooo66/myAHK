;Command Prompt,Powershell
#IfWinActive,ahk_class ConsoleWindowClass
	^L::SendInput , {Esc}cls{Enter}
	vkEBsc07B & q::SendInput , {Esc}exit{Enter}
#IfWinActive

;ファイル保存ウィンドウ
#IfWinActive,ahk_class #32770
	;上へ戻る
	RButton & LButton::Send,!{Up}
#IfWinActive

;InternetExplorer
#IfWinActive,ahk_class IEFrame
	RButton & WheelUp::
		Send,^+{Tab}
	return
	RButton & WheelDown::
		Send,^{Tab}
	return
#IfWinActive