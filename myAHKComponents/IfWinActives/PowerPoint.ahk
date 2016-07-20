#IfWinActive,ahk_class PPTFrameClass
	LControl & 1::
	vkEBsc07B & 1::
		if CAPS() && LCMD()
			;文字色変更（橙）
			Send, !{j}{d}{s}{o}{Right}{Right}{Right}{Right}{Right}{Down}{Down}{Down}{Down}{return}
		else
			mbind_1()
	return
	vkEBsc07B & 2::
	LControl & 2::
		if CAPS() && LCMD()
			;文字色変更（青）
			Send, !{j}{d}{s}{o}{Left}{Left}{Down}{Down}{Down}{Down}{return}
		else
			mbind_2()
	return
	vkEBsc07B & 3::
	LControl & 3::
		if CAPS() && LCMD()
			;文字色変更（緑）
			Send, !{j}{d}{s}{o}{Left}{Down}{Down}{Down}{Down}{return}
		else
			mbind_3()
	return
	vkEBsc07B & 4::
	LControl & 4::
		if CAPS() && LCMD()
			;文字色変更（赤）
			Send, !{j}{d}{s}{o}{Down}{Down}{Down}{Down}{Down}{Down}{return}
		else
			mbind_4()
	return
	vkEBsc07B & 5::
	LControl & 5::
		if CAPS() && LCMD()
			;文字色変更（青）
			Send, !{j}{d}{s}{o}
		else
			mbind_5()
	return
	vkEBsc07B & q::
	LControl & q::
		if CAPS() && LCMD()
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
		if CAPS() && LCMD()
			;文字色変更（青）
			Send, !{h}{f}{c}{Left}{Left}{Down}{Down}{Down}{Down}{return}
		else if GetKeyState("vkEBsc07B", "P")
			Send, ^{l}
		else
			mbind_w()
	return
	vkEBsc07B & e::
	LControl & e::
		if CAPS() && LCMD()
			;文字色変更（緑）
			Send, !{h}{f}{c}{Left}{Down}{Down}{Down}{Down}{return}
		else
			mbind_e()
	return
	vkEBsc07B & r::
	LControl & r::
		if CAPS() && LCMD()
			;文字色変更（赤）
			Send, !{h}{f}{c}{Down}{Down}{Down}{Down}{Down}{Down}{return}
		else
			mbind_r()
	return
	vkEBsc07B & t::
	LControl & t::
		if CAPS() && LCMD()
			;文字色選択
			Send, !{h}{f}{c}
		else{
			;パワポの特性上Alt?刺さないと^BSで認識されるため
			Send,{Alt}
			mbind_t()
		}
	return
	vkEBsc07B & a::
	LControl & a::
		if CAPS() && LCMD()
			;箇条書き
			Send, !{h}{u}
		else
			mbind_a()
	return
	vkEBsc07B & s::
	LControl & s::
		if CAPS() && LCMD()
			;図形配置
			Send, !{n}{s}{h}
		else
			mbind_s()
	return
	vkEBsc07B & d::
	LControl & d::
		if CAPS() && LCMD()
			;図形塗り
			Send, !{j}{d}{s}{f}
		else
			mbind_d()
	return
	vkEBsc07B & f::
	LControl & f::
		if CAPS() && LCMD()
			;フォント弄り
			Send, !{h}{f}{f}
		else
			mbind_f()
	return
	vkEBsc07B & g::
	LControl & g::
		if CAPS() && LCMD()
			;図形の書式設定
			Send, !{h}{o}
		else
			mbind_g()
	return

	RShift & z::
	LShift & z::
	vkEBsc07B & z::
	LControl & z::
		if CAPS() && LCMD(){
			;背面へ移動
			Send, !{j}{d}{a}{e}{b}
		}else if SHIFT() && LCMD()
			Send,^{y}
		else
			mbind_z()
	return

	vkEBsc07B & x::
	LControl & x::
		if CAPS() && LCMD()
			;前面へ移動
			Send, !{j}{d}{a}{f}{f}
		else
			mbind_x()
	return
	vkEBsc07B & c::
	LControl & c::
		if CAPS() && LCMD()
			;印刷
			Send, {Alt}{f}{p}{Alt}
		else
			mbind_c()
	return
	vkEBsc07B & v::
	LControl & v::
		if CAPS() && LCMD()
			;View
			Send, +{F5}
		else
			mbind_v()
	return
	vkEBsc07B & b::
	LControl & b::
		if CAPS() && LCMD()
			;枠線太さ変更
			Send, !{j}{d}{s}{o}{w}
		else
			mbind_b()
	return

	;文字サイズ変更
	LShift & WheelUp::Send, ^{]}
	LShift & WheelDown::Send, ^{[}

	;横スクロール
	XButton2 & WheelUp::ComObjActive("PowerPoint.Application").ActiveWindow.SmallScroll(0,0,0,3)
	XButton2 & WheelDown::ComObjActive("PowerPoint.Application").ActiveWindow.SmallScroll(0,0,3,0)

	;進む、戻る
	XButton2::Send,^{y}
	XButton1::Send,^{z}

	;リボン切り替え
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
