;マウスホイール制御系。右スティック周りに依存

;ホイール用変数（時間スタックと加速スタック）
wheelTimeStack := 0
wheelAccelStack := 0
WatchR:
	GetKeyState, JoyR, JoyR  ; Stick2の上下（0が上、100が下。25~75はほぼ非可動）

	;スタック用意して加算
	global wheelTimeStack
	wheelTimeStack += 30

	;加速カウントスタックの加算
	global wheelAccelStack
	if(JoyR == 100 || JoyR == 0){
		wheelTimeStack += wheelAccelStack
		wheelAccelStack ++
	}else{
		wheelAccelStack := 0
	}

	;各種傾斜に応じてスタックを消費してボタン押下
	if( JoyR == 100 ){
		while (wheelTimeStack > 20) {
			Send,{WheelDown}
			wheelTimeStack -= 20
		}
		wheelTimeStack := 0
	}else if( JoyR > 90 ){
		if(wheelTimeStack > 4820 - JoyR*48){
			wheelTimeStack := 0
			Send,{WheelDown}
		}
	}else if( JoyR > 70 ){
		if(wheelTimeStack > 500){
			wheelTimeStack := 0
			Send,{WheelDown}
		}
	}else if( JoyR == 0 ){
		while (wheelTimeStack > 20) {
			Send,{WheelUp}
			wheelTimeStack -= 20
		}
		wheelTimeStack := 0
	}else if( JoyR < 10 ){
		if(wheelTimeStack > 20 + JoyR*48){
			wheelTimeStack := 0
			Send,{WheelUp}
		}
	}else if( JoyR < 30 ){
		if(wheelTimeStack > 500){
			wheelTimeStack := 0
			Send,{WheelUp}
		}
	}else{
		wheelTimeStack := 0
		wheelAccelStack := 0
	}
return

wheelLRStack := -1
WatchZ:
	GetKeyState, JoyZ, JoyZ  ; Stick2の左右（0が左、100が右。25~75はほぼ非可動）
	global wheelLRStack

	;スタック消化済みかつ傾きが検知された場合に実行
	if(JoyZ>70 && wheelLRStack < 0){
		if GetKeyState("Joy7","P"){
			global joy7IsUsed
			joy7IsUsed := true
			windowChange("Right")
		}else if GetKeyState("Joy10","P"){
			global joy10IsUsed
			joy10IsUsed := true
			Send,^{PgDn}
		}else{
			send,{WheelRight}
		}
		wheelLRStack := 250
	}else if(JoyZ<30 && wheelLRStack < 0){
		if GetKeyState("Joy7","P"){
			global joy7IsUsed
			joy7IsUsed := true
			windowChange("Left")
		}else if GetKeyState("Joy10","P"){
			global joy10IsUsed
			joy10IsUsed := true
			Send,^{PgUp}
		}else{
			send,{WheelLeft}
		}
		WheelLRStack := 250
	}
	wheelLRStack -= 30
return
