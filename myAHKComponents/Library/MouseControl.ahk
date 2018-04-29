;マウス操作関係

;key: イベント対象のキー4つ
mouseMove(keyUp,keyDown,keyLeft,keyRight){
	val := 1
	slp := 10
	while(GetKeyState(keyUp,"P") || GetKeyState(keyDown,"P") || GetKeyState(keyLeft,"P") || GetKeyState(keyRight,"P")){
		MoveX := 0, MoveY := 0
		MoveY += GetKeyState(keyUp, "P") ? -val : 0
		MoveX += GetKeyState(keyLeft, "P") ? -val : 0
		MoveY += GetKeyState(keyDown, "P") ? val : 0
		MoveX += GetKeyState(keyRight, "P") ? val : 0
		MouseMove, %MoveX%, %MoveY%, 1, R
		Sleep, %slp%
		val++
	}
}

;key: イベント対象のキー4つ
mouseMoveFast(keyUp,keyDown,keyLeft,keyRight){
	val := 50
	slp := 10
	while(GetKeyState(keyUp,"P") || GetKeyState(keyDown,"P") || GetKeyState(keyLeft,"P") || GetKeyState(keyRight,"P")){
		MoveX := 0, MoveY := 0
		MoveY += GetKeyState(keyUp, "P") ? -val : 0
		MoveX += GetKeyState(keyLeft, "P") ? -val : 0
		MoveY += GetKeyState(keyDown, "P") ? val : 0
		MoveX += GetKeyState(keyRight, "P") ? val : 0
		MouseMove, %MoveX%, %MoveY%, 1, R
		Sleep, %slp%
		val++
	}
}

;マウスカーソルを中央に配置
mouseCursorResetToCenter(){
		;Mouse移動を絶対座標モードに変更
		CoordMode, Mouse, Screen
		;Windowの中央座標(width,height)を取得
		sysget, screenWidth, 0
		sysget, screenHeight, 1
		width:=screenWidth/2
		height:=screenHeight/2
		;Mouseを中央に移動
		MouseMove, %width%, %height%, 0
}

;マウスの左クリックエミュレート
mouseDrag(leftButtonKey){
	Send,{LButton Down}
	while(GetKeyState(leftButtonKey,"P")){
		Sleep,100
	}
	Send,{LButton Up}
}
