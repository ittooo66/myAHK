;Windows+Dを強化
winD := 1
winD(){
	global winD
	if(winD==1){
		;WinMinimizeAllUndoはWinMinimizeAllで縮めたWindowのみ対象なので微妙に漏れる
		fullWinActivate()
		winD := 0
	}else{
		WinMinimizeAll
		winD := 1
	}
}

;全ウィンドウをアクティブに。
fullWinActivate(){
	WinGet, id, List,,, Program Manager      ; get list of all visible windows
	; now remove task bar "window" (is there a simpler way?)
	Loop, %id%
	{
		index := id%A_Index%
		WinGetClass, windowClass, ahk_id %index%
		if windowClass = Shell_TrayWnd      ; remove task bar window id
			Break
		send,!+{Tab}
		sleep,60
	}
}
