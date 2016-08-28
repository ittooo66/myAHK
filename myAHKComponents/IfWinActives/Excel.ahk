;Excel
#IfWinActive,ahk_class XLMAIN

	;F1無効
	F1::return
	vkFFsc079 & 1::return
	LControl & 1::return

	;進む、戻る
	XButton2::Send,^{y}
	XButton1::Send,^{z}

	;Shift押しZですすめるようにした
	RShift & z::
	LShift & z::
	vkEBsc07B & z::
		if SHIFT() && LCMD()
			Send,^{y}
		else
			mbind_z()
	return

	;貼り付けオプションを離脱する
	vkEBsc07B & v::
		if LCMD()
			Send,^{v}
		else
			mbind_v()
	return

	;セル背景色変更
	vkEBsc07B & d::
	LControl & d::
		if CAPS() && LCMD()
			Send, !{h}{h}
		else
			mbind_d()
	return

	;セル内文字サイズ変更
	vkEBsc07B & .::
	LShift & .::
		if SHIFT() && LCMD()
			Send, !{h}{f}{g}
		else
			mbind_period()
	return
	vkEBsc07B & ,::
	LShift & ,::
		if SHIFT() && LCMD()
			Send, !{h}{f}{k}
		else
			mbind_camma()
	return

	;文字色変更（赤）
	vkEBsc07B & r::
	LControl & r::
		if CAPS() && LCMD()
			Send, !{h}{f}{c}{Down}{Down}{Down}{Down}{Down}{Down}{Down}{Left}{Left}{Left}{Left}{return}
		else
			mbind_r()
	return

	;文字色変更（自動）
	vkEBsc07B & q::
	LControl & q::
		if CAPS() && LCMD()
			Send, !{h}{f}{c}{return}
		else
			mbind_q()
	return

	;文字配置マクロ（上下中央配置）
	vkEBsc07B & u::
	LControl & u::
		if CAPS() && LCMD()
			Send, !{h}{a}{t}
		else
			mbind_u()
	return
	vkEBsc07B & i::
	LControl & i::
		if CAPS() && LCMD()
			Send, !{h}{a}{m}
		else
			mbind_i()
	return
	vkEBsc07B & o::
	LControl & o::
		if CAPS() && LCMD()
			Send, !{h}{a}{b}
		else
			mbind_o()
	return
	vkEBsc07B & j::
	LControl & j::
		if CAPS() && LCMD()
			Send, !{h}{a}{l}
		else
			mbind_j()
	return
	vkEBsc07B & k::
	LControl & k::
		if CAPS() && LCMD()
			Send, !{h}{a}{c}
		else
			mbind_k()
	return
	vkEBsc07B & l::
	LControl & l::
		if CAPS() && LCMD()
			Send, !{h}{a}{r}
		else
			mbind_l()
	return

	vkEBsc07B & c::
	LControl & c::
		if CAPS() && LCMD()
			;印刷
			Send,!{f}{p}{Alt}
		else if LCMD()
			Send,^{c}
		else
			mbind_c()
	return

	XButton2 & WheelUp::ComObjActive("Excel.Application").ActiveWindow.SmallScroll(0,0,0,1)
	XButton2 & WheelDown::ComObjActive("Excel.Application").ActiveWindow.SmallScroll(0,0,1,0)

	XButton2 & LButton::intelliScrollOnExcel()
	;よさげなスクロール
	intelliScrollOnExcel(){
		;初期マウス位置の取得
		MouseGetPos, preMouseX, preMouseY
		while(GetKeyState("LButton","P")){
			;現在マウス位置の取得
			MouseGetPos, mouseX, mouseY
			;差分取得
			mouseDiffX :=mouseX-preMouseX
			mouseDiffY :=mouseY-preMouseY

			;スクロール分量値調整
			SetFormat, float, 0.0
			diffPointY := (mouseDiffY/30)
			SetFormat, float, 0.0
			diffPointX := (mouseDiffX/30)

			;abs変換
			absDiffPointY := diffPointY
			if(diffPointY<0)
				absDiffPointY := -diffPointY
			absDiffPointX := diffPointX
			if(diffPointX<0)
				absDiffPointX := -diffPointX

			;適用対象判定
			if(absDiffPointX > absDiffPointY ){
				;Count値、Stack用意
				sleepCount := 100/absDiffPointX
				sleepStack := 0

				;X方向適用
				while(absDiffPointX > 0){
					if(diffPointX>0)
						ComObjActive("Excel.Application").ActiveWindow.SmallScroll(0,0,0,1)
					else
						ComObjActive("Excel.Application").ActiveWindow.SmallScroll(0,0,1,0)

					;スタック溜まったらSleep（１ミリSleepはまともに挙動しないので20程度見る）
					sleepStack +=sleepCount
					if(sleepStack > 20){
						sleep, %sleepCount%
						sleepStack := 0
					}

					absDiffPointX--
				}
			}else{
				;Count値、Stack用意
				sleepCount := 100/absDiffPointY
				sleepStack := 0

				;Y方向適用
				while(absDiffPointY > 0){
					if(diffPointY>0)
						send,{WheelUp}
					else
						send,{WheelDown}

					;スタック溜まったらSleep（１ミリSleepはまともに挙動しないので20程度見る）
					sleepStack +=sleepCount
					if(sleepStack > 20){
						sleep, %sleepCount%
						sleepStack := 0
					}

					absDiffPointY--
				}
			}
		}
	}

#IfWinActive
