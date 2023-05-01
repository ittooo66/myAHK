; 【DEPRECATED】AP個別定義
; ・定義部分だけコメントで一覧できるようにすること
; ・RDP時の挙動が安定しなくなる＆管理がしんどいので、使わない定義はなるべく削除すること
; ・PowerpointとExcel以外はここに雑多に追記していくこと

#IfWinActive,ahk_exe Code.exe							;Visual Studio Code 個別定義 一式
	RButton & MButton::Send,^{n}						;新規Tab
#IfWinActive

#IfWinActive,ahk_exe mpc-hc64.exe					;MPC-HC 個別定義 一式
  XButton2 & WheelUp::Send,{Left}					;戻る
  XButton2 & WheelDown::Send,{Right}			;進む
  RButton & XButton1::Send,!{x}						;閉じる
  XButton2 & LButton::MPC_intelliScroll()	;IntelliScroll
#IfWinActive

#IfWinActive,ahk_exe mpc-be64.exe					;MPC-BE 個別定義 一式
  XButton2 & WheelUp::Send,{Left}					;戻る
  XButton2 & WheelDown::Send,{Right}			;進む
  RButton & XButton1::Send,!{x}						;閉じる
  XButton2 & LButton::MPC_intelliScroll()	;IntelliScroll
	F20 & XButton1::Send,^{Up}
	F20 & XButton2::Send,^{Down}
#IfWinActive

#IfWinActive,ahk_exe vlc.exe					    ;VLC 個別定義 一式
  XButton2 & WheelUp::Send,{Left}					;戻る
  XButton2 & WheelDown::Send,{Right}			;進む
  RButton & XButton1::Send,!{x}						;閉じる
  XButton2 & LButton::MPC_intelliScroll()	;IntelliScroll
	F20 & XButton1::Send,^{Up}
	F20 & XButton2::Send,^{Down}
	XButton1::Send,{p}
	XButton2::Send,{n}
#IfWinActive

#IfWinActive,ahk_class CabinetWClass			;WindowsExplorer 個別定義 一式
	RButton & WheelUp::Send,!{Up}						;上へ
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
