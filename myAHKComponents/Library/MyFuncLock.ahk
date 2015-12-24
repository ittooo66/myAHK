;myFunctionKeyのロック、MBindSetting.ahkで引っ張ってきてる
myFuncPressed := 0
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
