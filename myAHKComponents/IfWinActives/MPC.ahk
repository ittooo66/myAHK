;MPC-HC
;ahk_class MediaPlayerClassicW
#IfWinActive,ahk_exe mpc-hc.exe
  XButton2 & WheelUp::Send,{Left}
  XButton2 & WheelDown::Send,{Right}
  RButton & XButton1::Send,!{x}
  RButton & LButton::Send,{Space}
  XButton2 & LButton::MPC_intelliScroll()
#IfWinActive

;MPC-BE
;ahk_class MPC-BE
#IfWinActive,ahk_exe mpc-be64.exe
  XButton2 & WheelUp::Send,{Left}
  XButton2 & WheelDown::Send,{Right}
  RButton & XButton1::Send,!{x}
  RButton & LButton::Send,{Space}
  XButton2 & LButton::MPC_intelliScroll()
#IfWinActive

;よさげなスクロール(for MPC)
MPC_intelliScroll(){
	;初期マウス位置の取得
	MouseGetPos, preMouseX, preMouseY
	while(GetKeyState("LButton","P")){
		;現在マウス位置の取得
		MouseGetPos, mouseX, mouseY
		;差分取得
		mouseDiffX :=mouseX-preMouseX
		;スクロール分量値調整
		SetFormat, float, 0.0
		diffPointX := (mouseDiffX/30)

		;abs変換
		absDiffPointX := diffPointX
		if(diffPointX<0)
			absDiffPointX := -diffPointX

		;Count値、Stack用意
		sleepCount := 100/absDiffPointX
		sleepStack := 0

		;X方向適用
		while(absDiffPointX > 0){
			if(diffPointX>0)
				send,{Left}
			else
				send,{Right}

			;スタック溜まったらSleep（１ミリSleepはまともに挙動しないので20程度見る）
			sleepStack +=sleepCount
			if(sleepStack > 20){
				sleep, %sleepCount%
				sleepStack := 0
			}

			absDiffPointX--
		}
	}
}