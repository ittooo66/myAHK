#IfWinActive,ahk_class IEFrame
	RButton & WheelUp::
		Send,^+{Tab}
	return
	RButton & WheelDown::
		Send,^{Tab}
	return
#IfWinActive