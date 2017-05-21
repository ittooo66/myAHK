;Atom
#IfWinActive,ahk_exe atom.exe
	^Tab::Send,^{0}

	RButton & MButton::
		Send,^{n}
	return
#IfWinActive
