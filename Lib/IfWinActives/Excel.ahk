;Excel
#IfWinActive,ahk_class XLMAIN
	XButton2 & WheelUp::ComObjActive("Excel.Application").ActiveWindow.SmallScroll(0,0,0,1)
	XButton2 & WheelDown::ComObjActive("Excel.Application").ActiveWindow.SmallScroll(0,0,1,0)
#IfWinActive
