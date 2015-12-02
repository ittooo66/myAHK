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
		diffPointY := (mouseDiffY/54)
		diffPointX := (mouseDiffX/54)

		sleepCount := 200

		if (diffY<0){
			if(diffX<0){
				;左上移動
				while((diffY<0 || diffX<0) && GetKeyState("LButton","P")){
					if(diffY<0)
						Send,{WheelUp}
					if(diffX<0)
						send,{WheelLeft}
					diffY:= diffY+30
					diffX:= diffX+30
					sleep,1
					sleepCount--
				}
			}else{
				while((diffY<0 || diffX>0) && GetKeyState("LButton","P")){
					if(diffY<0)
						Send,{WheelUp}
					if(diffX>0)
						send,{WheelRight}
					diffY:= diffY+30
					diffX:= diffX-30
					sleep,1
					sleepCount--
				}
			}
		}else{
			if(diffX<0){
				while((diffY>0 || diffX<0) && GetKeyState("LButton","P")){
					if(diffY>0)
						Send,{WheelDown}
					if(diffX<0)
						send,{WheelLeft}
					diffX:= diffX+30
					diffY:= diffY-30
					sleep,1
					sleepCount--
				}
			}else{
				while((diffY>0 || diffX>0) && GetKeyState("LButton","P")){
					if(diffY>0)
						Send,{WheelDown}
					if(diffX>0)
						send,{WheelRight}
					diffY:= diffY-30
					diffX:= diffX-30
					sleep,1
					sleepCount--
				}
			}
		}
		sleep, %sleepCount%
	}
}
