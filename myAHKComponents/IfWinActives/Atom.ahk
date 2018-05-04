;Atom
#IfWinActive,ahk_exe atom.exe

	RButton & LButton::Send,^+{o}

	^Tab::Send,^{0}

	RButton & MButton::
		Send,^{n}
	return
#IfWinActive
