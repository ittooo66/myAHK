;Excel
#IfWinActive,ahk_class XLMAIN

	;スクロール機能一式
	XButton2 & WheelUp::Excel_scrollRight()
	XButton2 & WheelDown::Excel_scrollLeft()
	XButton2 & LButton::Excel_intelliScroll()
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

	;App個別バインド 一式
	excel_bind_a(){
		Send, !{w}{m}{v}					;マクロ実行
	}
	excel_bind_b(){
		Send,!{h}{f}{n}!{k}{return}			;取り消し線
	}
	excel_bind_c(){
		
	}
	excel_bind_d(){
		Send, !{h}{h}						;セル背景色変更
	}
	excel_bind_e(){
		Send,!{h}{a}{c}						;中央寄せ
	}
	excel_bind_f(){
		Send,^{PgDn}						;タブ切替
	}
	excel_bind_g(){
		Send,!{h}{m}{m}						;セル：結合
	}
	excel_bind_h(){
		Send,!{h}{b}{n}						;罫線：削除
	}
	excel_bind_i(){
		Send,!{h}{b}{p}						;罫線：上
	}
	excel_bind_j(){
		Send,!{h}{b}{l}						;罫線：左
	}
	excel_bind_k(){
		Send,!{h}{b}{o}						;罫線：下
	}
	excel_bind_l(){
		Send,!{h}{b}{r}						;罫線：右
	}
	excel_bind_m(){
		Send,!{h}{d}{s}						;タブ：削除
	}
	excel_bind_n(){
		Send,+{F11}							;タブ：新規
	}
	excel_bind_o(){
		Send,!{h}{b}{s}						;罫線：外枠
	}
	excel_bind_p(){
		
	}
	excel_bind_q(){
		Send,!{o}{c}{a}						;セル幅調整
	}
	excel_bind_r(){
		Send, !{h}{r}						;右寄せ
	}
	excel_bind_s(){
		Send,^{PgUp}						;タブ切替
	}
	excel_bind_t(){
		Send, !{h}{f}{1}					;文字色変更（任意）
	}
	excel_bind_u(){
		Send,!{h}{b}{a}						;格子罫線
	}
	excel_bind_v(){
		Send,!{w}{f}{f}						;ウィンドウ枠の固定
	}
	excel_bind_w(){
		Send, !{h}{l}{1}					;左寄せ
	}
	excel_bind_x(){
		
	}
	excel_bind_y(){
		
	}
	excel_bind_z(){
		
	}
	excel_bind_1(){
		Send,^+{l}							;フィルタ有効化・無効化
	}
	excel_bind_2(){
			Send,!{h}{b}{i}					;白線化
			Send,{Down}{Left}{Left}{Left}{Left}
			Send,{return}{Esc}
	}
	excel_bind_3(){
		
	}
	excel_bind_4(){
		
	}
	excel_bind_5(){
		
	}
	excel_bind_6(){
		
	}
	excel_bind_7(){
		
	}
	excel_bind_8(){
		
	}
	excel_bind_9(){
		
	}
	excel_bind_0(){
		
	}
	excel_bind_minus(){
		
	}
	excel_bind_equal(){
		
	}
	excel_bind_backslash(){
		
	}
	excel_bind_semicolon(){
		
	}
	excel_bind_quote(){
		
	}
	excel_bind_period(){
		Send, !{h}{f}{g}					;セル内文字サイズ変更
	}
	excel_bind_camma(){
		Send, !{h}{f}{k}					;セル内文字サイズ変更
	}
	excel_bind_slash(){
		
	}
	excel_bind_bracket_left(){
		
	}
	excel_bind_bracket_right(){
		
	}
	excel_bind_backspace(){
		
	}
	excel_bind_delete(){
		
	}
	excel_bind_escape(){
		
	}

#IfWinActive