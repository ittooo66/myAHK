#IfWinActive,ahk_class PPTFrameClass

	;F1無効
	F1::return
	vkFFsc079 & 1::return

	LControl & 1::
	vkEBsc07B & 1::
		if CAPS() && LCMD()
			;文字色変更（橙）
			Send, !{j}{d}{s}{o}{Right}{Right}{Right}{Right}{Right}{Down}{Down}{Down}{Down}{return}
		else if CAPS()
			Send,{1}
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
			Send, !{h}{f}{1}{Left}{Left}{Left}{Left}{Left}{Down}{Down}{Down}{Down}{return}
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
			Send, !{h}{f}{1}{Left}{Left}{Down}{Down}{Down}{Down}{return}
		else if GetKeyState("vkEBsc07B", "P")
			Send, ^{l}
		else
			mbind_w()
	return
	vkEBsc07B & e::
	LControl & e::
		if CAPS() && LCMD()
			;文字色変更（緑）
			Send, !{h}{f}{1}{Left}{Down}{Down}{Down}{Down}{return}
		else
			mbind_e()
	return
	vkEBsc07B & r::
	LControl & r::
		if CAPS() && LCMD()
			;文字色変更（赤）
			Send, !{h}{f}{1}{Down}{Down}{Down}{Down}{Down}{Down}{return}
		else
			mbind_r()
	return
	vkEBsc07B & t::
	LControl & t::
		if CAPS() && LCMD()
			;文字色選択
			Send, !{h}{f}{1}
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
			Send, !{h}{u}{2}
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
			;Group化解除
			Send,!{j}{d}{a}{g}{u}
		else
			mbind_c()
	return
	vkEBsc07B & v::
	LControl & v::
		if CAPS() && LCMD()
			;Group化
			Send, !{j}{d}{a}{g}{g}
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

	vkEBsc07B & Tab::
	LControl & Tab::
		if CAPS() && LCMD() {
			;オブジェクトの配置
			Send, !{j}{d}{a}{a}
		}else{
			press("{Tab}")
		}
	return

	;文字サイズ変更
	LShift & WheelUp::Send, ^{]}
	LShift & WheelDown::Send, ^{[}

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

	;横スクロール
	XButton2 & WheelUp::PowerPoint_scrollRight()
	XButton2 & WheelDown::PowerPoint_scrollLeft()
	XButton2 & LButton::PowerPoint_intelliScroll()
	;よさげなスクロール
	PowerPoint_intelliScroll(){
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
						PowerPoint_scrollRight()
					else
						PowerPoint_scrollLeft()

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

	PowerPoint_scrollLeft(){
		try {
			ComObjActive("PowerPoint.Application").ActiveWindow.SmallScroll(0,0,3,0)
		}catch e{
			;WindowのフォーカスをPowerPoint以外に切り替えてPowerPointをROTに登録させる
			gui,Show
			gui,Destroy
		}
	}

	PowerPoint_scrollRight(){
		try {
			ComObjActive("PowerPoint.Application").ActiveWindow.SmallScroll(0,0,0,3)
		}catch e {
			;WindowのフォーカスをPowerPoint以外に切り替えてPowerPointをROTに登録させる
			gui,Show
			gui,Destroy
		}
	}

#IfWinActive
