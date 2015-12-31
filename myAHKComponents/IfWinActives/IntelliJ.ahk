#IfWinActive,ahk_class SunAwtFrame
	;タブ切り替え
	RButton & WheelUp::Send,!{Left}
	RButton & WheelDown::Send,!{Right}
	LControl & Tab::
		if SHIFT()
			Send,!{Left}
		else
			Send,!{Right}
	return
	LControl & s::
		if LCMD()
			Send,!{Left}
		else
			mbind_s()
	return
	LControl & f::
		if LCMD()
			Send,!{Right}
		else
			mbind_f()
	return

	;タブ開閉
	RButton & XButton1::
	vkEBsc07B & w::
		Send,^{F4}
	return
	RButton & XButton2::Send,^+{F11} ;非純正：Reopen Closed Tabに要追加
	LShift & t::
	vkEBsc07B & t::
		if SHIFT() && LCMD()
			Send,^+{F11}
		else
			mbind_t()
	return

	;Refactor
	LControl & r::
	vkEBsc07B & r::
		if CAPS() && LCMD()
			Send,^!+{t}
		else
			mbind_r()
	return

	;構造選択+
	LControl & e::
	vkEBsc07B & e::
		if CAPS() && LCMD()
			Send,^{w}
		else
			mbind_e()
	return
	;構造選択-
	LControl & d::
	vkEBsc07B & d::
		if CAPS() && LCMD()
			Send,^+{w}
		else
			mbind_d()
	return

	;横スクロール
	;Shift2度押しの暴発防止でこんなややっこいことになってる
	XButton2 & ~WheelUp::
		Send,{WheelDown}
		sidescroll_on_intellij()
	return
	XButton2 & ~WheelDown::
		Send,{WheelUp}
		sidescroll_on_intellij()
	return
	sidescroll_on_intellij(){
		Send,{Shift Down}
		while (GetKeyState("XButton2", "P")){
			;サイドボタンとShiftの押し下げを連動
			;Wheelはチルダで活かしてShift+Wheelを入力
			sleep,100
		}
		Send,{Shift Up}
	}

	;実行
	LControl & v::
	vkEBsc07B & v::
		if CAPS() && LCMD()
			Send,+{F10}
		else
			mbind_v()
	return

	;javadoc表示
	LControl & q::
	vkEBsc07B & q::
		if CAPS() && LCMD()
			Send,^{q}
		else
			mbind_q()
	return

	;フォーマッタ
	LControl & a::
	vkEBsc07B & a::
		if CAPS() && LCMD()
			Send,^!{l}
		else
			mbind_a()
	return

	;intelliScroll
	XButton2 & LButton::intelliScrollOnIntelliJ()
	;よさげなスクロール
	;(intelliScrollベースでShift押し連打に反応するアイツ対策に加工)
	intelliScrollOnIntelliJ(){
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
				Send,{Shift Down}
				;X方向適用
				while(absDiffPointX > 0){
					if(diffPointX>0)
						send,{WheelUp}
					else
						send,{WheelDown}

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
				Send,{Shift Up}
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
		Send,{Shift Up}
	}

#IfWinActive
