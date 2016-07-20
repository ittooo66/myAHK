;特定のマクロを開く
TempMacro_open(id){
	run C:\Program Files\sakura\sakura.exe %A_WorkingDir%\myAHKComponents\Resources\TempMacro\Macro%id%.ahkz
}

;マクロ実行
TempMacro_do(id){
	if(id == "B")
		MacroB()
	else if(id == "Z")
		MacroZ()
	else if(id == "X")
		MacroX()
	else if(id == "C")
		MacroC()
}