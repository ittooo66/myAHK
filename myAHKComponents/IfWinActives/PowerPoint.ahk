#IfWinActive,ahk_class PPTFrameClass
	LControl & 1::
		if GetKeyState("vkEBsc07B", "P")
			;文字色変更（橙）
			Send, !{j}{d}{s}{o}{Right}{Right}{Right}{Right}{Right}{Down}{Down}{Down}{Down}{return}
		else
			mbind_1()
	return
	LControl & 2::
		if GetKeyState("vkEBsc07B", "P")
			;文字色変更（青）
			Send, !{j}{d}{s}{o}{Left}{Left}{Down}{Down}{Down}{Down}{return}
		else
			mbind_2()
	return
	LControl & 3::
		if GetKeyState("vkEBsc07B", "P")
			;文字色変更（緑）
			Send, !{j}{d}{s}{o}{Left}{Down}{Down}{Down}{Down}{return}
		else
			mbind_3()
	return
	LControl & 4::
		if GetKeyState("vkEBsc07B", "P")
			;文字色変更（赤）
			Send, !{j}{d}{s}{o}{Down}{Down}{Down}{Down}{Down}{Down}{return}
		else
			mbind_4()
	return
	LControl & 5::
		if GetKeyState("vkEBsc07B", "P")
			;文字色変更（青）
			Send, !{j}{d}{s}{o}
		else
			mbind_5()
	return
	LControl & q::
		if GetKeyState("vkEBsc07B", "P")
			;文字色変更（橙）
			Send, !{h}{f}{c}{Left}{Left}{Left}{Left}{Left}{Down}{Down}{Down}{Down}{return}
		else{
			;パワポの特性上Alt?刺さないと^BSで認識されるため
			Send,{Alt}
			mbind_q()
		}
	return
	vkEBsc07B & w::
	LControl & w::
		if GetKeyState("vkEBsc07B", "P") && GetKeyState("LControl", "P")
			;文字色変更（青）
			Send, !{h}{f}{c}{Left}{Left}{Down}{Down}{Down}{Down}{return}
		else if GetKeyState("vkEBsc07B", "P")
			Send, ^{l}
		else
			mbind_w()
	return
	LControl & e::
		if CAPS() && LCMD()
			;文字色変更（緑）
			Send, !{h}{f}{c}{Left}{Down}{Down}{Down}{Down}{return}
		else
			mbind_e()
	return
	LControl & r::
		if GetKeyState("vkEBsc07B", "P")
			;文字色変更（赤）
			Send, !{h}{f}{c}{Down}{Down}{Down}{Down}{Down}{Down}{return}
		else
			mbind_r()
	return
	LControl & t::
		if GetKeyState("vkEBsc07B", "P")
			;文字色選択
			Send, !{h}{f}{c}
		else{
			;パワポの特性上Alt?刺さないと^BSで認識されるため
			Send,{Alt}
			mbind_t()
		}
	return
	LControl & a::
		if GetKeyState("vkEBsc07B", "P")
			;箇条書き
			Send, !{h}{u}
		else
			mbind_a()
	return
	LControl & s::
		if GetKeyState("vkEBsc07B", "P")
			;図形配置
			Send, !{n}{s}{h}
		else
			mbind_s()
	return
	LControl & d::
		if GetKeyState("vkEBsc07B", "P")
			;図形塗り
			Send, !{j}{d}{s}{f}
		else
			mbind_d()
	return
	LControl & f::
		if GetKeyState("vkEBsc07B", "P")
			;フォント弄り
			Send, !{h}{f}{f}
		else
			mbind_f()
	return
	LControl & g::
		if GetKeyState("vkEBsc07B", "P")
			;図形の書式設定
			Send, !{h}{o}
		else
			mbind_g()
	return
	LControl & z::
		if GetKeyState("vkEBsc07B", "P")
			;背面へ移動
			Send, !{j}{d}{a}{e}{b}
		else
			mbind_z()
	return
	LControl & x::
		if GetKeyState("vkEBsc07B", "P")
			;前面へ移動
			Send, !{j}{d}{a}{f}{f}
		else
			mbind_x()
	return
	LControl & c::
		if GetKeyState("vkEBsc07B", "P")
			;トリミング
			Send, !{j}{p}{v}{c}
		else
			mbind_c()
	return
	LControl & v::
		if GetKeyState("vkEBsc07B", "P")
			;View
			Send, +{F5}
		else
			mbind_v()
	return
	LControl & b::
		if GetKeyState("vkEBsc07B", "P")
			;枠線太さ変更
			Send, !{j}{d}{s}{o}{w}
		else
			mbind_b()
	return

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
	return
	RButton & WheelDown::
		Send,{Alt}
		Send,{Right}
		Send,{Alt}
	return

	;閉じる
	RButton & XButton1::
		Send,!{F4}
	return

#IfWinActive
