;Excel
#IfWinActive,ahk_class XLMAIN
	XButton2 & WheelUp::WheelRedirect(1)
	XButton2 & WheelDown::WheelRedirect(1)
#IfWinActive
