;SetTimer処理 一式
SetTimer, FileMonitor, 250
Return

;SetTimer処理 内容
FileMonitor:
Loop,C:\Users\ittoo\OneDrive\ドキュメント\【Virtualbox】\SFs\PCControlServer\watch\*
{
	Switch A_LoopFileName
	{
		case "hue_on":			execScripts("PhilipsHueOn.bat")
		case "hue_off":			execScripts("PhilipsHueOff.bat")
		case "volume_down":		Send,{Volume_Down}
		case "volume_up":		Send,{Volume_Up}
		case "win_minimize":	WinMinimizeAll
		case "tcv_dismount":	execScripts("TCV_dismount.bat")
		case "display_off":		execPs1Scripts("displayoff.ps1")
		case "win_viewall":		activeAllWindow()
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
		
	}
	
	FileDelete, %A_LoopFileFullPath%
}
Return
