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