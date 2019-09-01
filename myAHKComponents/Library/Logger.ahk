;LOG操作関係

logger_info(message){
	log:=logger_date() . message . "`n"
	FileAppend,	%log%, %A_WorkingDir%\myAHKComponents\Resources\Log\info.log
}

logger_stat(message){
	log:=logger_date() . message . "`n"
	FileAppend,	%log%, %A_WorkingDir%\myAHKComponents\Resources\Log\stat.log
}

logger_debug(message){
	log:=logger_date() . message . "`n"
	FileAppend,	%log%, %A_WorkingDir%\myAHKComponents\Resources\Log\debug.log
}

logger_clip(message){
	log:="*** " . logger_date() . "***`n" . message . "`n"
	FileAppend,	%log%, %A_WorkingDir%\myAHKComponents\Resources\Log\clip.log
}

keyPressSpan := 0
logger_key(message){
	global keyPressSpan

	;修飾キーの場合は出力しない
	StringLeft, msg, message, 1
	if( msg = "{")
		return

	if (A_TickCount - keyPressSpan > 1000){
		date := logger_date()
		FileAppend,	`n%date%, %A_WorkingDir%\myAHKComponents\Resources\Log\key.log
	}
	FileAppend, %message% , %A_WorkingDir%\myAHKComponents\Resources\Log\key.log
	keyPressSpan := A_TickCount
}

logger_date(){
	FormatTime,year,,yyyy
	FormatTime,month,,MM
	FormatTime,day,,dd
	FormatTime,hour,,HH
	FormatTime,minute,,mm
	FormatTime,second,,ss
	return year . "-" . month . "-" . day . " " . hour . ":" . minute ":" . second . "." . A_MSec . " "
}
