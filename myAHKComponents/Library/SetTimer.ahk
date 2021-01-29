SetTimer, LOLWatch, 4000
Return

LOLWatch:

	;アクティブなプロセス名を取得
	WinGet, this_process, ProcessName, A

	;LoLの場合:チートツール判定を受けるため、AHKを終了
	ifInString, this_process , League of Legends.exe, {
		SoundBeep,500,400
		SoundBeep,250,400
		sleep, 3000
		ExitApp
	}

Return