;特定のマクロを開く
TempMacro_open(id){
	run C:\Program Files (x86)\sakura\sakura.exe %A_WorkingDir%\myAHKComponents\Resources\TempMacro\Macro%id%.ahk
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