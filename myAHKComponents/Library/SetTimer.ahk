SetTimer, FileMonitor, 250
Return
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
    }

    ;実行が終わり次第、削除
    FileDelete, %A_LoopFileFullPath%
}
Return