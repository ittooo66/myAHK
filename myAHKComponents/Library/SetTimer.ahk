SetTimer, FileMonitor, 250
SetTimer, LOLWatch, 4000
Return

FileMonitor:
Loop,C:\Users\ittooo66\OneDrive\home\share\PCControlServer\watch\*
{
	Switch A_LoopFileName
	{
		case "hue_on":				execScripts("PhilipsHueOn.bat")
		case "hue_off":				execScripts("PhilipsHueOff.bat")
		case "volume_down":			Send,{Volume_Down}
		case "volume_up":			Send,{Volume_Up}
		case "win_minimize":		WinMinimizeAll
		case "tcv_dismount":		run , "C:\Program Files\TrueCrypt\TrueCrypt.exe" /q /dr
		case "display_off":			execScripts("displayoff.ps1")
		case "win_viewall":			activeAllWindow()
		case "device_speaker":		changeSoundDevice("2")
		case "device_earphone":		changeSoundDevice("0")
		case "active_chrome":		activateWindow("Chrome_WidgetWin_1","chrome.exe","")
		case "hue_up":
			if ( A_HUE_BRI <= 254 ){
				A_HUE_BRI := A_HUE_BRI + 20
			} else {
				A_HUE_BRI := 254
			}
			execScripts("PhilipsHueOn.bat " . A_HUE_BRI )
		case "hue_down":
			if ( A_HUE_BRI >= 0 ){
				A_HUE_BRI := A_HUE_BRI - 20
			} else {
				A_HUE_BRI := 0
			}
			execScripts("PhilipsHueOn.bat " . A_HUE_BRI )
		case "start_cmd":		run, C:\WINDOWS\system32\cmd.exe e /k doskey /macrofile=%A_ResDir%\Scripts\cmd.txt
		case "playlist_liquicity":				run, C:\Users\ittooo66\OneDrive\Music\Liquicity\Liquicity.fpl
		case "playlist_hospitalrecords":		run, "C:\Users\ittooo66\OneDrive\Music\Hospital Records\HospitalRecords.fpl"
		case "playlist_psychedelic":			run, C:\Users\ittooo66\OneDrive\Music\Psychedelic\Psychedelic.fpl
		case "playlist_ids":					run, C:\Users\ittooo66\OneDrive\Music\ids\ids.fpl
		case "media_next":						Send,{Media_Next}
		case "media_prev":						Send,{Media_Prev}
		case "media_ss":						Send,{Media_Play_Pause}
	}
	
	FileDelete, %A_LoopFileFullPath%
}
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