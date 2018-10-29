;仮想修飾キー一覧

LCMD(){ ;HHKB_左ダイヤ
	return GetKeyState("vkEBsc07B", "P") | GetKeyState("LWin","P")
}
RCMD(){ ;HHKB_右ダイヤ
	return GetKeyState("vkFFsc079", "P") | GetKeyState("RWin","P")
}
CAPS(){ ;HHKB_Control
	return GetKeyState("LControl","P")
}
SHIFT(){ ;HHKB_両Shift
	return LSHIFT() || RSHIFT()
}
LSHIFT(){ ;HHKB_左シフト
	return GetKeyState("LShift","P")
}
RSHIFT(){ ;HHKB_右シフト
	return GetKeyState("RShift","P")
}
SPACE(){ ;HHKB_スペース
	return GetKeyState("Space","P")
}
ALT(){ ;HHKB_両Alt
	return RALT() || LALT()
}
RALT(){ ;HHKB_右Alt
	return GetKeyState("RAlt","P")
}
LALT(){ ;HHKB_左Alt
	return GetKeyState("LAlt","P")
}

MLB(){ ;Mouse_LeftButton
	return GetKeyState("LButton","P")
}
MRB(){ ;Mouse_RightButton
	return GetKeyState("RButton","P")
}
MMB(){ ;Mouse_MidButton
	return GetKeyState("MButton","P")
}
MSBLB(){ ;Mouse_SideButton_LeftBack
	return GetKeyState("XButton1","P")
}
MSBLF(){ ;Mouse_SideButton_LeftFront
	return GetKeyState("XButton2","P")
}
MSBRF(){ ;Mouse_SideButton_RightForward
	return GetKeyState("Appskey","P")
}
MSBRB(){ ;Mouse_SideButton_RightBack
	return GetKeyState("F20","P")
}
