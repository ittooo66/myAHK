;マクロを開く
TempMacro_open(id){
	run notepad.exe %A_WorkingDir%\myAHKComponents\Resources\TempMacro\Macro%id%.ahk
}

;マクロ実行
TempMacro_do(id){
	if(id == "Z")
		MacroZ()
	else if(id == "X")
		MacroX()
	else if(id == "C")
		MacroC()
}