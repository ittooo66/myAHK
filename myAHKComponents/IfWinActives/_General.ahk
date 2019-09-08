; AP個別定義
; 重量級AP以外はここに雑多に追記していく方針にする
; →定義部分だけ一覧できるようにすること。
; →個別定義の管理がしんどいので、使わない定義はなるべく削除すること。
; →AP個別のフック定義は_HookDef.ahkにまとめる

#IfWinActive,ahk_class IEFrame						;Internet Explorer 個別定義 一式
	RButton & WheelUp::Send,^+{Tab}					;タブ切替(逆)
	RButton & WheelDown::Send,^{Tab}				;タブ切替(順)
#IfWinActive

#IfWinActive,ahk_exe Code.exe						;Visual Studio Code 個別定義 一式
	RButton & MButton::Send,^{n}					;新規Tab
	RButton & LButton::Send,^+{n}					;新規Window
#IfWinActive

#IfWinActive,ahk_class #32770						;ファイル保存ウィンドウ 個別定義 一式
	RButton & LButton::Send,!{Up}					;上へ戻る
#IfWinActive

#IfWinActive,ahk_class CabinetWClass				;Windows Explorer 個別定義 一式
	RButton & MButton::Send,^{n}					;新規Window作成	
	RButton & LButton::Send,!{Up}					;上へ戻る
	RButton & XButton2::Send,!{v}{n}{Return}		;ナビゲーションウィンドウ表示切替
	explorer_bind_a(){								;表示切替
		Send,^{NumpadAdd}
	}
#IfWinActive

#IfWinActive,ahk_class VTWin32						;Tera Term 個別定義 一式
	teraterm_bind_d(){								;FONTSIZE変更（10）
			Send, !{s}{f}!{s}
      		directInput("10")
      		Send, {Return}
	}
	teraterm_bind_e(){								;FONTSIZE変更（17）
			Send, !{s}{f}!{s}
      		directInput("17")
		    Send, {Return}
	}
#IfWinActive

#IfWinActive,ahk_exe mpc-hc.exe						;MPC-HC 個別定義 一式
  XButton2 & WheelUp::Send,{Left}					;戻る
  XButton2 & WheelDown::Send,{Right}				;進む
  RButton & XButton1::Send,!{x}						;閉じる
  RButton & LButton::Send,{Space}					;一時停止
  XButton2 & LButton::MPC_intelliScroll()			;IntelliScroll
#IfWinActive

#IfWinActive,ahk_exe mpc-be64.exe					;MPC-BE 個別定義 一式
  XButton2 & WheelUp::Send,{Left}					;戻る
  XButton2 & WheelDown::Send,{Right}				;進む
  RButton & XButton1::Send,!{x}						;閉じる
  RButton & LButton::Send,{Space}					;一時停止
  XButton2 & LButton::MPC_intelliScroll()			;IntelliScroll
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
