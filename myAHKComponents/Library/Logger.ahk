;ログ出力 => ./log.txt
logger_out(message){
  log:=logger_date() . message
	FileAppend,	%log%, %A_WorkingDir%\myAHKComponents\Resources\Log\log.txt
}

logger_date(){
	FormatTime,year,,yyyy
	FormatTime,month,,MM
	FormatTime,day,,dd
	FormatTime,hour,,HH
	FormatTime,minute,,mm
  FormatTime,second,,ss
	return year . "-" . month . "-" . day . " " . hour . ":" . minute ":" . second . " "
}
