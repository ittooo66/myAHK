;SetTimer処理 一式
SetTimer, FileMonitor, 250
SetTimer, GetWindowTitle, 1000
Return

;SetTimer処理 内容
FileMonitor:
Loop,C:\Users\ittoo\3D Objects\VirtualboxSFs\PCControlServer\watch\*
{
    command := A_LoopFileName

    ;commandに応じて処理を実行
    if (command=="hue_on"){
        execScripts("PhilipsHueOn.bat")
    }else if (command=="hue_off"){
        execScripts("PhilipsHueOff.bat")
    }else if (command=="display_off"){
        execPs1Scripts("displayoff.ps1")
    }else if (command=="volume_down"){
        Send,{Volume_Down}
    }else if (command=="volume_up"){
        Send,{Volume_Up}
    }else if (command=="win_minimize"){
        WinMinimizeAll
    }else if (command=="tcv_dismount"){
        execScripts("TCV_dismount.bat")
    }

    ;実行が終わり次第、削除
    FileDelete, %A_LoopFileFullPath%
}
Return

;Windowロガー
GetWindowTitle:
Return
	WinGet, now_process, ProcessName, A
    WinGetTitle, now_title, A
    logger_window(now_process,now_title)
Return