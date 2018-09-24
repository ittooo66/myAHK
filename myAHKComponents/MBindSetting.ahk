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
MB1(){ ;Mouse_LeftSideButton1
	return GetKeyState("XButton1","P")
}
MB2(){ ;Mouse_LeftSideButton2
	return GetKeyState("XButton2","P")
}
MB3(){ ;Mouse_RightSideButton1
	return GetKeyState("Appskey","P")
}
MB4(){ ;Mouse_RightSideButton2
	return GetKeyState("F20","P")
}
