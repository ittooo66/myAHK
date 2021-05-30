SetTimer, Watch, 5000
Return

Watch:
	;配列idに現在稼働中のWindowを突っ込む
	WinGet, id, list, , , Program Manager
	;for(int A_Index=1;A_Index<N(id);A_Index++)
	Loop, %id%
	{
		;this_idに現在なめてるWindowIDを入れる
		this_id := id%A_Index%
		;プロセス名を取得
		WinGet, this_process, ProcessName, ahk_id %this_id%

		;LoLの場合:チートツール判定を受けるため、AHKを終了
		ifInString, this_process , League of Legends.exe, {
			execScripts("mouseCursor_standard.ps1")
			logger("ahk","AHK EXIT")
			ExitApp
		}	

		;VALORANTの場合：まともに動かなくなるため、AHKを終了
		ifInString, this_process , VALORANT-Win64-Shipping.exe, {
			execScripts("mouseCursor_standard.ps1")
			logger("ahk","AHK EXIT")
			ExitApp
		}
	}

	;HUEのバッチ処理用
	tooltip,
	ENV_HUE_BRI := getEnv("A_HUE_BRI")
	if( ENV_HUE_BRI != A_HUE_BRI ){
		execScripts("PhilipsHueOn.bat " . A_HUE_BRI . " " . A_HUE_CT )
		setEnv("A_HUE_BRI", A_HUE_BRI)
	}

Return