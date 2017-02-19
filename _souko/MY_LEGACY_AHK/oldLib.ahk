;Windows+Dを強化
winD := 0
winD(){
	global winD
	if(winD==1){
		WinGet, id, List,,, Program Manager
	 	Loop, %id%
	 	{
	 		this_id := id%A_Index%
			WinActivate, ahk_id %this_id%
	 	}
		winD := 0
	}else{
		WinMinimizeAll
		;Desktopをフォーカス
		WinActivate, ahk_class WorkerW
		winD := 1
	}
}
