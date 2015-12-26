;myFunctionKeyのロック
myFuncPressed := 0
myFuncIsOn(){
	global myFuncPressed
	if myFuncPressed = 1
		return true
	else
		return false
}
myFuncLock(){
	global myFuncPressed
	if(myFuncPressed==1){
		myFuncPressed := 0
		;GUI非表示
		ToolTip,
	}else{
		myFuncPressed := 1
		;TODO:GUI表示？
		ToolTip, RCMD() Key Is Pressed, 0 , 0
	}
}
