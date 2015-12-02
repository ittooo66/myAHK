;よさげなスクロール、chromeのホイールボタンスクロールっぽい挙動を目指して。滑らかさが足りない
;実装にインテリ感なし
intelliScroll(){
	;初期マウス位置の取得
	MouseGetPos, preMouseX, preMouseY
	while(GetKeyState("LButton","P")){
		;現在マウス位置の取得
		MouseGetPos, mouseX, mouseY
		;差分取得
		mouseDiffX :=mouseX-preMouseX
		mouseDiffY :=mouseY-preMouseY

		;値調整
		SetFormat, float, 0.0
		diffPointY := (mouseDiffY/30)
		SetFormat, float, 0.0
		diffPointX := (mouseDiffX/30)

		;適用対象判定
		absDiffPointY := diffPointY
		if(diffPointY<0)
			absDiffPointY := -diffPointY
		absDiffPointX := diffPointX
		if(diffPointX<0)
			absDiffPointX := -diffPointX
		if(absDiffPointX > absDiffPointY ){
			;X方向適用
			if(diffPointX > 0){
				sleepCount := 100/absDiffPointX
				sleepStack := 0
				while(diffPointX > 0){
					send,{WheelRight}
					sleepStack += sleepCount
					if(sleepStack > 20){
						sleep, %sleepCount%
						sleepStack := 0
					}
					diffPointX--
				}
			}else{
				sleepCount := 100/absDiffPointX
				sleepStack := 0
				while(diffPointX < 0){
					send,{WheelLeft}
					sleepStack += sleepCount
					if(sleepStack > 20){
						sleep, %sleepCount%
						sleepStack := 0
					}
					diffPointX++
				}
			}
		}else{
			;Y方向適用
			if(diffPointY > 0){
				sleepCount := 100/absDiffPointY
				sleepStack := 0
				while(diffPointY > 0){
					send,{WheelDown}
					sleepStack += sleepCount
					if(sleepStack > 20){
						sleep, %sleepCount%
						sleepStack := 0
					}
					diffPointY--
				}
			}else{
				sleepCount := 100/absDiffPointY
				sleepStack := 0
				while(diffPointY < 0){
					send,{WheelUp}
					sleepStack += sleepCount
					if(sleepStack > 20){
						sleep, %sleepCount%
						sleepStack := 0
					}
					diffPointY++
				}
			}
		}
	}
}
