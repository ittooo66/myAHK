#IfWinActive,ahk_class PPTFrameClass
	LControl & 1::
		if GetKeyState("LWin", "P")
			;文字色変更（橙）
			Send, !{j}{d}{s}{o}{Right}{Right}{Right}{Right}{Right}{Down}{Down}{Down}{Down}{Return}
		Else
			mbind_1()
	Return
	LControl & 2::
		if GetKeyState("LWin", "P")
			;文字色変更（青）
			Send, !{j}{d}{s}{o}{Left}{Left}{Down}{Down}{Down}{Down}{Return}
		Else
			mbind_2()
	Return
	LControl & 3::
		if GetKeyState("LWin", "P")
			;文字色変更（緑）
			Send, !{j}{d}{s}{o}{Left}{Down}{Down}{Down}{Down}{Return}
		Else
			mbind_3()
	Return
	LControl & 4::
		if GetKeyState("LWin", "P")
			;文字色変更（赤）
			Send, !{j}{d}{s}{o}{Down}{Down}{Down}{Down}{Down}{Down}{Return}
		Else
			mbind_4()
	Return
	LControl & 5::
		if GetKeyState("LWin", "P")
			;文字色変更（青）
			Send, !{j}{d}{s}{o}
		Else
			mbind_5()
	Return
	LControl & q::
		if GetKeyState("LWin", "P")
			;文字色変更（橙）
			Send, !{h}{f}{c}{Left}{Left}{Left}{Left}{Left}{Down}{Down}{Down}{Down}{Return}
		else{
			;パワポの特性上Alt?刺さないと^BSで認識されるため
			Send,{Alt}
			mbind_q()
		}
	Return
	LWin & w::
	LControl & w::
		if GetKeyState("LWin", "P") && GetKeyState("LControl", "P")
			;文字色変更（青）
			Send, !{h}{f}{c}{Left}{Left}{Down}{Down}{Down}{Down}{Return}
		Else if GetKeyState("LWin", "P")
			Send, ^{l}
		Else
			mbind_w()
	Return
	LControl & e::
		if CAPS() && LCMD()
			;文字色変更（緑）
			Send, !{h}{f}{c}{Left}{Down}{Down}{Down}{Down}{Return}
		else
			mbind_e()
	Return
	LControl & r::
		if GetKeyState("LWin", "P")
			;文字色変更（赤）
			Send, !{h}{f}{c}{Down}{Down}{Down}{Down}{Down}{Down}{Return}
		Else
			mbind_r()
	Return
	LControl & t::
		if GetKeyState("LWin", "P")
			;文字色選択
			Send, !{h}{f}{c}
		Else{
			;パワポの特性上Alt?刺さないと^BSで認識されるため
			Send,{Alt}
			mbind_t()
		}
	Return
	LControl & a::
		if GetKeyState("LWin", "P")
			;箇条書き
			Send, !{h}{u}
		Else
			mbind_a()
	Return
	LControl & s::
		if GetKeyState("LWin", "P")
			;図形配置
			Send, !{n}{s}{h}
		Else
			mbind_s()
	Return
	LControl & d::
		if GetKeyState("LWin", "P")
			;図形塗り
			Send, !{j}{d}{s}{f}
		Else
			mbind_d()
	Return
	LControl & f::
		if GetKeyState("LWin", "P")
			;フォント弄り
			Send, !{h}{f}{f}
		Else
			mbind_f()
	Return
	LControl & g::
		if GetKeyState("LWin", "P")
			;図形の書式設定
			Send, !{h}{o}
		Else
			mbind_g()
	Return
	LControl & z::
		if GetKeyState("LWin", "P")
			;背面へ移動
			Send, !{j}{d}{a}{e}{b}
		Else
			mbind_z()
	Return
	LControl & x::
		if GetKeyState("LWin", "P")
			;前面へ移動
			Send, !{j}{d}{a}{f}{f}
		Else
			mbind_x()
	Return
	LControl & c::
		if GetKeyState("LWin", "P")
			;トリミング
			Send, !{j}{p}{v}{c}
		Else
			mbind_c()
	Return
	LControl & v::
		if GetKeyState("LWin", "P")
			;View
			Send, +{F5}
		Else
			mbind_v()
	Return
	LControl & b::
		if GetKeyState("LWin", "P")
			;枠線太さ変更
			Send, !{j}{d}{s}{o}{w}
		Else
			mbind_b()
	Return

	;文字サイズ変更
	LShift & WheelUp::Send, ^{]}
	LShift & WheelDown::Send, ^{[}

	XButton2::Send,^{y}
	XButton1::Send,^{z}

	;ホイールでリボン切り替え
	RButton & WheelUp::
		Send,{Alt}
		Send,{Left}
		Send,{Alt}
	Return
	RButton & WheelDown::
		Send,{Alt}
		Send,{Right}
		Send,{Alt}
	Return

	;閉じる
	RButton & XButton1::
		Send,!{F4}
	Return

#IfWinActive
