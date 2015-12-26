;Windows+Dを強化
winD := 0
winD(){
	global winD
	if(winD==1){
		WinMinimizeAllUndo
		winD := 0
	}else{
		WinMinimizeAll
		;Desktopをフォーカス
		WinActivate, ahk_class WorkerW
		winD := 1
	}
}
