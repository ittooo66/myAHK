SetTimer, Watch, 3000
Return

Watch:

	;HUEのバッチ処理用
	tooltip,
	if( EXE_HUE != 0){
		execScripts("PhilipsHueOn.bat " . A_HUE_BRI . " " . A_HUE_CT )
		EXE_HUE := 0
	}
	
	;USB_Connect用
	if ( FileExist("C:\Users\ittoo\OneDrive\home\src\linux\HomeBridgeServer\BT-W3-OFF") ){
		FileDelete, C:\Users\ittoo\OneDrive\home\src\linux\HomeBridgeServer\BT-W3-OFF
		run, "C:\Users\ittoo\OneDrive\home\src\ahk\myAHKComponents\Resources\Apps\USB_Connect\USB_Off.exe"

		sleep,4000
		Send,{Volume_Mute}
	}
	if ( FileExist("C:\Users\ittoo\OneDrive\home\src\linux\HomeBridgeServer\BT-W3-ON") ){
		FileDelete, C:\Users\ittoo\OneDrive\home\src\linux\HomeBridgeServer\BT-W3-ON
		run, "C:\Users\ittoo\OneDrive\home\src\ahk\myAHKComponents\Resources\Apps\USB_Connect\USB_On.exe"
	}

Return