SetTimer, FileMonitor, 250
Return

FileMonitor:
Loop,C:\Users\ittoo\OneDrive\ÉhÉLÉÖÉÅÉìÉg\ÅyVirtualboxÅz\SFs\PCControlServer\watch\*
{
	Switch A_LoopFileName
	{
		case "hue_on":				execScripts("PhilipsHueOn.bat")
		case "hue_off":				execScripts("PhilipsHueOff.bat")
		case "volume_down":			Send,{Volume_Down}
		case "volume_up":			Send,{Volume_Up}
		case "win_minimize":		WinMinimizeAll
		case "tcv_dismount":		execScripts("TCV_dismount.bat")
		case "display_off":			execPs1Scripts("displayoff.ps1")
		case "win_viewall":			activeAllWindow()
		case "device_speaker":		changeSoundDevice("1")
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
		case "playlist_liquicity":				run, C:\Users\ittoo\OneDrive\Music\Liquicity\Liquicity.fpl
		case "playlist_hospitalrecords":		run, "C:\Users\ittoo\OneDrive\Music\Hospital Records\HospitalRecords.fpl"
		case "playlist_psychedelic":			run, C:\Users\ittoo\OneDrive\Music\Psychedelic\Psychedelic.fpl
		case "playlist_ids":					run, C:\Users\ittoo\OneDrive\Music\ids\ids.fpl
		
	}
	
	FileDelete, %A_LoopFileFullPath%
}
Return
