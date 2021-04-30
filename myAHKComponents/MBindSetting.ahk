;仮想修飾キー一覧

LCMD(){ ;HHKB_左ダイヤ
	return GetKeyState("vkEB", "P") | GetKeyState("LWin","P")
}
RCMD(){ ;HHKB_右ダイヤ
	return GetKeyState("vkFF", "P") | GetKeyState("RWin","P")
}
CAPS(){ ;HHKB_Control
	return GetKeyState("LControl","P") | GetKeyState("RControl","P") | GetKeyState("sc03a","P")
}
SHIFT(){ ;HHKB_両Shift
	return LSHIFT() | RSHIFT()
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
	return RALT() | LALT()
}
RALT(){ ;HHKB_右Alt
	return GetKeyState("RAlt","P")
}
LALT(){ ;HHKB_左Alt
	return GetKeyState("LAlt","P")
}
MLB(){ ;GPRO_左クリック
	return GetKeyState("LButton","P")
}
MRB(){ ;GPRO_右クリック
	return GetKeyState("RButton","P")
}
MMB(){ ;GPRO_中クリック
	return GetKeyState("MButton","P")
}
MSBLB(){ ;GPRO_左下サイドボタン
	return GetKeyState("XButton1","P")
}
MSBLF(){ ;GPRO_左上サイドボタン
	return GetKeyState("XButton2","P")
}
MSBRF(){ ;GPRO_右上サイドボタン
	return GetKeyState("F19","P")
}
MSBRB(){ ;GPRO_右下サイドボタン
	return GetKeyState("F20","P")
}
