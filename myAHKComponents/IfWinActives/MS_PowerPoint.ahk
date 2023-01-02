#IfWinActive,ahk_class PPTFrameClass

	LShift & WheelUp::Send, ^{]}			;文字サイズ変更
	LShift & WheelDown::Send, ^{[}			;文字サイズ変更

	;図形サイズの変更
	Space & WheelUp::
	  if(MSBLF()){
			Send,+{Left}
		}else{
			Send,+{Up}
		}
	return
	Space & WheelDown::
		if(MSBLF()){
			Send,+{Right}
		}else{
			Send,+{Down}
		}
	return

	XButton1::Send,^{z}
	XButton2::Send,^{y}

	;グループ化
	Space & G::
		if (SHIFT()){
			Send,^+{g}
			consumeSpace()
		}else{
			Send,^{g}
			consumeSpace()
		}
	return

	;スクロール機能一式
	XButton2 & WheelUp::PowerPoint_scrollRight()
	XButton2 & WheelDown::PowerPoint_scrollLeft()
	XButton2 & LButton::PowerPoint_intelliScroll()
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

	;App個別バインド 一式
	ppt_bind_escape(){
		
	}
	ppt_bind_1(){
		Send, !{j}{d}{s}{o}{Right}{Right}{Right}{Right}{Right}{Down}{Down}{Down}{Down}{return}		;枠色変更（橙）
	}
	ppt_bind_2(){
		Send, !{j}{d}{s}{o}{Left}{Left}{Down}{Down}{Down}{Down}{return}								;枠色変更（青）
	}
	ppt_bind_3(){
		Send, !{j}{d}{s}{o}{Left}{Down}{Down}{Down}{Down}{return}									;枠色変更（緑）
	}
	ppt_bind_4(){
		Send, !{j}{d}{s}{o}{Down}{Down}{Down}{Down}{Down}{Down}{return}								;枠色変更（赤）
	}
	ppt_bind_5(){
		Send, !{j}{d}{s}{o}																			;枠色変更（パレット）
	}

	ppt_bind_tab(){
		Send, !{j}{d}{a}{a}																			;オブジェクトの配置
	}
	ppt_bind_q(){
		Send, !{h}{f}{1}{Left}{Left}{Left}{Left}{Left}{Down}{Down}{Down}{Down}{return}				;文字色変更（橙）
	}
	ppt_bind_w(){
		Send, !{h}{f}{1}{Left}{Left}{Down}{Down}{Down}{Down}{return}								;文字色変更（青）
	}
	ppt_bind_e(){
		Send, !{h}{f}{1}{Left}{Down}{Down}{Down}{Down}{return}										;文字色変更（緑）
	}
	ppt_bind_r(){
		Send, !{h}{f}{1}{Down}{Down}{Down}{Down}{Down}{Down}{return}								;文字色変更（赤）
	}
	ppt_bind_t(){
		Send, !{h}{f}{1}																					;文字色選択
	}

	ppt_bind_a(){
		Send, !{h}{u}{2}																					;箇条書き
	}
	ppt_bind_s(){
		Send, !{n}{s}{h}																					;図形配置
	}
	ppt_bind_d(){
		Send, !{j}{d}{s}{f}																				;図形塗り
	}
	ppt_bind_f(){
		Send, !{h}{f}{f}																					;フォント弄り
	}
	ppt_bind_g(){
		Send, !{h}{o}																							;図形の書式設定
	}
	
	ppt_bind_z(){
		Send, !{j}{d}{a}{f}{r}																		;最前面(Zenmen)へ移動
	}
	ppt_bind_x(){
		Send, !{j}{d}{a}{e}{k}																		;背面へ移動
	}
	ppt_bind_c(){
	}
	ppt_bind_v(){
	}
	ppt_bind_b(){
		Send, !{j}{d}{s}{o}{w}																		;枠線太さ変更
	}


	ppt_bind_h(){

	}
	ppt_bind_i(){
		
	}
	ppt_bind_j(){
		
	}
	ppt_bind_k(){
		
	}
	ppt_bind_l(){
		
	}
	ppt_bind_m(){
	
	}
	ppt_bind_n(){
	
	}
	ppt_bind_o(){
	
	}
	ppt_bind_p(){
		
	}
	ppt_bind_u(){
	
	}
	ppt_bind_y(){
		
	}
	ppt_bind_6(){
		
	}
	ppt_bind_7(){
		
	}
	ppt_bind_8(){
		
	}
	ppt_bind_9(){
		
	}
	ppt_bind_0(){
		
	}
	ppt_bind_minus(){
		
	}
	ppt_bind_equal(){
		
	}
	ppt_bind_backslash(){
		
	}
	ppt_bind_semicolon(){
		
	}
	ppt_bind_quote(){
		
	}
	ppt_bind_period(){
	
	}
	ppt_bind_camma(){
	
	}
	ppt_bind_slash(){
		
	}
	ppt_bind_bracket_left(){
		
	}
	ppt_bind_bracket_right(){
		
	}
	ppt_bind_backspace(){
		
	}
	ppt_bind_delete(){
		
	}

#IfWinActive