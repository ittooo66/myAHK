;Chrome
#IfWinActive, ahk_exe chrome.exe
	>^q::
	<^q::
	RControl & q::
	LControl & q::
		if LCMD() && CAPS()
			send,{Browser_back}
		else
			mbind_q()
	return

	>^w::
	<^w::
	RControl & w::
	LControl & w::
		if LCMD() && CAPS()
			send,{Browser_forward}
		else
			mbind_w()
	return
#IfWinActive

;タスクバー上
#IfWinActive,ahk_class Shell_TrayWnd
	WheelUp::Send,{Volume_Up}
	WheelDown::Send,{Volume_Down}

	XButton1::return
	XButton2::return
#IfWinActive

;デスクトップ上
#IfWinActive,ahk_class Progman
	XButton1::return
	XButton2::return
#IfWinActive

;Reader
#IfWinActive, ahk_exe AcroRd32.exe
	;スクロールの調整
	XButton2 & LButton::
		Send,{MButton down}
		While (GetKeyState("LButton", "P"))
				Sleep, 10
		Send,{MButton up}
	Return
#IfWinActive

;Excel
#IfWinActive,ahk_class XLMAIN
	LShift & WheelUp::Send, {Left}
	LShift & WheelDown::Send, {Right}
#IfWinActive

;Power Point
#IfWinActive,ahk_class PPTFrameClass
	RControl & 1::
		if GetKeyState("LControl", "P")
			;文字色変更（橙）
			Send, !{j}{d}{s}{o}{Right}{Right}{Right}{Right}{Right}{Down}{Down}{Down}{Down}{Return}
		Else
			mbind_1()
	Return
	RControl & 2::
		if GetKeyState("LControl", "P")
			;文字色変更（青）
			Send, !{j}{d}{s}{o}{Left}{Left}{Down}{Down}{Down}{Down}{Return}
		Else
			mbind_2()
	Return
	RControl & 3::
		if GetKeyState("LControl", "P")
			;文字色変更（緑）
			Send, !{j}{d}{s}{o}{Left}{Down}{Down}{Down}{Down}{Return}
		Else
			mbind_3()
	Return
	RControl & 4::
		if GetKeyState("LControl", "P")
			;文字色変更（赤）
			Send, !{j}{d}{s}{o}{Down}{Down}{Down}{Down}{Down}{Down}{Return}
		Else
			mbind_4()
	Return
	RControl & 5::
		if GetKeyState("LControl", "P")
			;文字色変更（青）
			Send, !{j}{d}{s}{o}
		Else
			mbind_5()
	Return
	RControl & q::
		if GetKeyState("LControl", "P")
			;文字色変更（橙）
			Send, !{h}{f}{c}{Left}{Left}{Left}{Left}{Left}{Down}{Down}{Down}{Down}{Return}
		else{
			;パワポの特性上Alt?刺さないと^BSで認識されるため
			Send,{Alt}
			mbind_q()
		}
	Return
	LControl & w::
	RControl & w::
		if GetKeyState("LControl", "P") && GetKeyState("RControl", "P")
			;文字色変更（青）
			Send, !{h}{f}{c}{Left}{Left}{Down}{Down}{Down}{Down}{Return}
		Else if GetKeyState("LControl", "P")
			Send, ^{l}
		Else
			mbind_w()
	Return
	RControl & e::
		if CAPS() && LCMD()
			;文字色変更（緑）
			Send, !{h}{f}{c}{Left}{Down}{Down}{Down}{Down}{Return}
		else
			mbind_e()
	Return
	RControl & r::
		if GetKeyState("LControl", "P")
			;文字色変更（赤）
			Send, !{h}{f}{c}{Down}{Down}{Down}{Down}{Down}{Down}{Return}
		Else
			mbind_r()
	Return
	RControl & t::
		if GetKeyState("LControl", "P")
			;文字色選択
			Send, !{h}{f}{c}
		Else{
			;パワポの特性上Alt?刺さないと^BSで認識されるため
			Send,{Alt}
			mbind_t()
		}
	Return
	RControl & a::
		if GetKeyState("LControl", "P")
			;箇条書き
			Send, !{h}{u}
		Else
			mbind_a()
	Return
	RControl & s::
		if GetKeyState("LControl", "P")
			;図形配置
			Send, !{n}{s}{h}
		Else
			mbind_s()
	Return
	RControl & d::
		if GetKeyState("LControl", "P")
			;図形塗り
			Send, !{j}{d}{s}{f}
		Else
			mbind_d()
	Return
	RControl & f::
		if GetKeyState("LControl", "P")
			;フォント弄り
			Send, !{h}{f}{f}
		Else
			mbind_f()
	Return
	RControl & g::
		if GetKeyState("LControl", "P")
			;図形の書式設定
			Send, !{h}{o}
		Else
			mbind_g()
	Return
	RControl & z::
		if GetKeyState("LControl", "P")
			;背面へ移動
			Send, !{j}{d}{a}{e}{b}
		Else
			mbind_z()
	Return
	RControl & x::
		if GetKeyState("LControl", "P")
			;前面へ移動
			Send, !{j}{d}{a}{f}{f}
		Else
			mbind_x()
	Return
	RControl & c::
		if GetKeyState("LControl", "P")
;???
			Send, !{}
		Else
			mbind_c()
	Return
	RControl & v::
		if GetKeyState("LControl", "P")
			;View
			Send, +{F5}
		Else
			mbind_v()
	Return
	RControl & b::
		if GetKeyState("LControl", "P")
		;枠線太さ変更
			Send, !{j}{d}{s}{o}{w}
		Else
			mbind_b()
	Return

	;文字サイズ変更
	LShift & WheelUp::Send, ^{]}
	LShift & WheelDown::Send, ^{[}

#IfWinActive

;Atom
#IfWinActive,ahk_exe atom.exe
	^Tab::Send,^{0}
#IfWinActive

;Command Prompt,Powershell
#IfWinActive,ahk_class ConsoleWindowClass
	^L::SendInput , {Esc}cls{Enter}
	LControl & q::SendInput , {Esc}exit{Enter}
#IfWinActive
