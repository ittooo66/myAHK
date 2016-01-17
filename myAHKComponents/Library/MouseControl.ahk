;マウス操作関係

;key: イベント対象のキー5つ
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

;マウスの左クリックエミュレート
mouseDrag(leftButtonKey){
	Send,{LButton Down}
	while(GetKeyState(leftButtonKey,"P")){
		Sleep,100
	}
	Send,{LButton Up}
}
