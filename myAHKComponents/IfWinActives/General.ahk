; 【DEPRECATED】AP個別定義
; ・定義部分だけコメントで一覧できるようにすること
; ・RDP時の挙動が安定しなくなる＆管理がしんどいので、使わない定義はなるべく削除すること
; ・PowerpointとExcel以外はここに雑多に追記していくこと

#IfWinActive,ahk_exe Code.exe							;Visual Studio Code 個別定義 一式
	RButton & MButton::Send,^{n}						;新規Tab
#IfWinActive

#IfWinActive,ahk_exe mpc-hc.exe						;MPC-HC 個別定義 一式
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
#IfWinActive

#IfWinActive,ahk_exe cmd.exe							;cmd.exe 個別定義 一式
	*q::
	<^q::
	>^q::
	>+q::
	<+q::
	vkFF & q::
	vkEB & q::
	LControl & q::
	RControl & q::
	LShift & q::
	RShift & q::
		if LCMD() 
			Send,{e}{x}{i}{t}
		else
			mbind_q()
	return
#IfWinActive

#IfWinActive,ahk_exe powershell.exe							;cmd.exe 個別定義 一式
	*q::
	<^q::
	>^q::
	>+q::
	<+q::
	vkFF & q::
	vkEB & q::
	LControl & q::
	RControl & q::
	LShift & q::
	RShift & q::
		if LCMD() 
			Send,{e}{x}{i}{t}
		else
			mbind_q()
	return
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
