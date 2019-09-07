;VS Code
#IfWinActive,ahk_exe Code.exe

	;新規Tab
	RButton & MButton::Send,^{n}
	;新規Window
	RButton & LButton::Send,^+{n}

#IfWinActive