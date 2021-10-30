SetTimer, Watch, 5000
Return

Watch:

	;HUEのバッチ処理用
	tooltip,
	ENV_HUE_BRI := getEnv("A_HUE_BRI")
	if( ENV_HUE_BRI != A_HUE_BRI ){
		execScripts("PhilipsHueOn.bat " . A_HUE_BRI . " " . A_HUE_CT )
		setEnv("A_HUE_BRI", A_HUE_BRI)
	}

Return