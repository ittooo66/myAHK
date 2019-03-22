;タスクバー上
#IfWinActive,ahk_class Shell_TrayWnd
#IfWinActive

;デスクトップ上
#IfWinActive,ahk_class WorkerW
#IfWinActive

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