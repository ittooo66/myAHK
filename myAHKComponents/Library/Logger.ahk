;Loggerライブラリ

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

logger_date(){
	FormatTime,year,,yyyy
	FormatTime,month,,MM
	FormatTime,day,,dd
	FormatTime,hour,,HH
	FormatTime,minute,,mm
	FormatTime,second,,ss
	return year . "-" . month . "-" . day . " " . hour . ":" . minute ":" . second . "." . A_MSec . " "
}
