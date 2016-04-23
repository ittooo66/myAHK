;マウスカーソルの制御。左スティックに依存
WatchXY:
	GetKeyState, JoyX, JoyX  ; Stick1の左右（0が左、100が右。25~75はほぼ非可動）
	GetKeyState, JoyY, JoyY  ; Stick1の上下（0が上、100が下。25~75はほぼ非可動）

	MoveX := 0
	if(JoyX>75){
		MoveX := (JoyX-75)/2
	}else if(JoyX<25){
		MoveX := (JoyX-25)/2
	}
	if GetKeyState("Joy5","P"){
		MoveX := MoveX/10
	}else if GetKeyState("Joy2","P"){
		MoveX := MoveX*3
	}

	MoveY := 0
	if(JoyY>75){
		MoveY := (JoyY-75)/2
	}else if(JoyY<25){
		MoveY := (JoyY-25)/2
	}
	if GetKeyState("Joy5","P")
		MoveY := MoveY/10
	else if GetKeyState("Joy2","P"){
		MoveY := MoveY*3
	}

	MouseMove, %MoveX%,%MoveY%,1,R

return
