;よさげなスクロール
intelliScroll(){
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
					send,{WheelLeft}
				else
					send,{WheelRight}

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
