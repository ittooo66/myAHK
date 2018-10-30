;Excel
#IfWinActive,ahk_class XLMAIN

	;F1無効
	F1::return
	vkFFsc079 & 1::return

	;進む、戻る
	XButton2::Send,^{y}
	XButton1::Send,^{z}

	;Shift押しZですすめるようにした
	RShift & z::
	LShift & z::
	vkEBsc07B & z::
	LControl & z::
		if SHIFT() && LCMD()
			Send,^{y}
		else
			mbind_z()
	return

	;セル背景色変更
	vkEBsc07B & d::
	LControl & d::
		if CAPS() && LCMD()
			Send, !{h}{h}
		else
			mbind_d()
	return

	;セル幅調整
	vkEBsc07B & q::
	LControl & q::
		if CAPS() && LCMD()
			Send,!{o}{c}{a}
		else
			mbind_q()
	return

	;フィルタ有効化・無効化
	vkEBsc07B & 1::
	LControl & 1::
		if CAPS() && LCMD()
			Send,^+{l}
		else if CAPS() && !LCMD()  && !RCMD() && !SHIFT() && !SPACE() && !ALT(){
			;F1無効化
		}else
			mbind_1()
	return

	;ウィンドウ枠の固定
	vkEBsc07B & v::
	LControl & v::
		if CAPS() && LCMD()
			Send,!{w}{f}{f}
		else
			mbind_v()
	return

	;取り消し線
	vkEBsc07B & b::
	LControl & b::
		if CAPS() && LCMD()
			Send,!{h}{f}{n}!{k}{return}
		else
			mbind_b()
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

	vkEBsc07B & t::
	LControl & t::
		if CAPS() && LCMD(){
			;文字色変更（任意）
			Send, !{h}{f}{1}
		}else
			mbind_t()
	return

	vkEBsc07B & a::
	LControl & a::
		if CAPS() && LCMD(){
			;マクロ実行
			Send, !{w}{m}{v}
		}else
			mbind_a()
	return

	vkEBsc07B & Return::
	LControl & Return::
		if CAPS() && LCMD(){
			;新規タブ
			Send,+{F11}
		}else{
			Send,^{Return}
		}
	return

	vkEBsc07B & Backspace::
	LControl & Backspace::
		if CAPS() && LCMD(){
			;タブ削除
			Send,!{h}{d}{s}
		}else
			mbind_delete()
	return

	vkEBsc07B & r::
	LControl & r::
		if CAPS() && LCMD(){
			;右寄せ
			Send, !{h}{r}
		}else
			mbind_r()
	return

	vkEBsc07B & e::
	LControl & e::
		if CAPS() && LCMD(){
			;中央寄せ
			Send,!{h}{a}{c}
		}else{
			mbind_e()
		}
	return

	vkEBsc07B & w::
	LControl & w::
		if CAPS() && LCMD(){
			;左寄せ
			Send, !{h}{l}{1}
		}else if LCMD(){
			;閉じるを無効化
		}else{
			mbind_w()
		}
	return

	vkEBsc07B & g::
	LControl & g::
		if CAPS() && LCMD(){
			;セル結合
			Send,!{h}{m}{c}
		}else{
			mbind_g()
		}
	return

	vkEBsc07B & h::
	LControl & h::
		if CAPS() && LCMD(){
			;罫線削除
			Send,!{h}{b}{n}
		}else{
			mbind_h()
		}
	return

	vkEBsc07B & u::
	LControl & u::
		if CAPS() && LCMD(){
			;格子罫線
			Send,!{h}{b}{a}
		}else{
			mbind_u()
		}
	return

	vkEBsc07B & i::
	LControl & i::
		if CAPS() && LCMD(){
			;上罫線
			Send,!{h}{b}{p}
		}else{
			mbind_i()
		}
	return

	vkEBsc07B & o::
	LControl & o::
		if CAPS() && LCMD(){
			;外枠罫線
			Send,!{h}{b}{s}
		}else{
			mbind_o()
		}
	return

	vkEBsc07B & j::
	LControl & j::
		if CAPS() && LCMD(){
			;左罫線
			Send,!{h}{b}{l}
		}else{
			mbind_j()
		}
	return

	vkEBsc07B & k::
	LControl & k::
		if CAPS() && LCMD(){
			;下罫線
			Send,!{h}{b}{o}
		}else{
			mbind_k()
		}
	return

	vkEBsc07B & l::
	LControl & l::
		if CAPS() && LCMD(){
			;右罫線
			Send,!{h}{b}{r}
		}else{
			mbind_l()
		}
	return

	vkEBsc07B & n::
	LControl & n::
		if CAPS() && LCMD(){
			;線のスタイル
			Send,!{h}{b}{y}
		}else{
			mbind_n()
		}
	return

	XButton2 & WheelUp::Excel_scrollRight()
	XButton2 & WheelDown::Excel_scrollLeft()
	XButton2 & LButton::Excel_intelliScroll()
	;よさげなスクロール
	Excel_intelliScroll(){
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
						Excel_scrollRight()
					else
						Excel_scrollLeft()

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

	Excel_scrollLeft(){
		try {
			ComObjActive("Excel.Application").ActiveWindow.SmallScroll(0,0,1,0)
		}catch e{
			;WindowのフォーカスをExcel以外に切り替えてExcelをROTに登録させる
			gui,Show
			gui,Destroy
		}
	}

	Excel_scrollRight(){
		try {
			ComObjActive("Excel.Application").ActiveWindow.SmallScroll(0,0,0,1)
		}catch e {
			;WindowのフォーカスをExcel以外に切り替えてExcelをROTに登録させる
			gui,Show
			gui,Destroy
		}
	}
#IfWinActive
