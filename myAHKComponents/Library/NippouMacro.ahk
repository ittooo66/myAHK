;日報の作成
NippouMacro_makeNippou(){

	;本日の作業内容
	taskWas := NippouMacro_parseTaskWas()
	;本日の日付
	taskWasDate := Nippoumacro_getTaskWasDate()

	;翌営業日の作業内容
	taskWill := NippouMacro_parseTaskWill()
	;翌営業日の日付
	taskWillDate := Nippoumacro_getTaskWillDate()

	;icsファイル(明日)を日報形式に変換して追加
	nippou := NippouMacro_writeHeader(taskWasDate,taskWas) . NippouMacro_writeFooter(taskWillDate,taskWill)

	;日報の出力
	directInput(nippou)
}

;日報頭部分まで記述
NippouMacro_writeHeader(taskWasDate,taskWas){
	nippouHeader := ""
	FileRead, beforeTaskWasDate, %A_WorkingDir%\myAHKComponents\Resources\Nippou\BeforeTaskWasDate.txt
	FileRead, beforeTaskWas, %A_WorkingDir%\myAHKComponents\Resources\Nippou\BeforeTaskWas.txt
	nippouHeader := beforeTaskWasDate . taskWasDate . beforeTaskWas . taskWas
	return nippouHeader
}

;日報後ろ部分の記述
NippouMacro_writeFooter(taskWillDate,taskWill){
	nippouFooter := ""
	FileRead, beforeTaskWillDate, %A_WorkingDir%\myAHKComponents\Resources\Nippou\BeforeTaskWillDate.txt
	FileRead, beforeTaskWill, %A_WorkingDir%\myAHKComponents\Resources\Nippou\BeforeTaskWill.txt
	FileRead, footer, %A_WorkingDir%\myAHKComponents\Resources\Nippou\Footer.txt
	nippouFooter := nippouFooter . beforeTaskWillDate . taskWillDate . beforeTaskWill . taskWill . footer
	return nippouFooter
}

;本日の日付を取得
NippouMacro_getTaskWasDate(){
	;ICSファイルを行ごとに読み込み
	Loop, Read, %A_WorkingDir%\myAHKComponents\Resources\Nippou\ICSWas.ics
	{
		Haystack = %A_LoopReadLine%
		Needle = X-CALSTART:
		IfInString, Haystack, %Needle%
		{
			;月日情報を取得して返す
			StringMid, month, Haystack, 16, 2
			StringMid, day, Haystack, 18, 2
			strDate = %month%/%day%
			return strDate
		}
	}
	return "null"
}

;翌営業日の日付を取得
NippouMacro_getTaskWillDate(){
	;ICSファイルを行ごとに読み込み
	Loop, Read, %A_WorkingDir%\myAHKComponents\Resources\Nippou\ICSWill.ics
	{
		Haystack = %A_LoopReadLine%
		Needle = X-CALSTART:
		IfInString, Haystack, %Needle%
		{
			;月日情報を取得して返す
			StringMid, month, Haystack, 16, 2
			StringMid, day, Haystack, 18, 2
			strDate = %month%/%day%
			return strDate
		}
	}
	return "null"
}

;本日の作業内容を日報形式で取得
NippouMacro_parseTaskWas(){
	taskWas := "*honjitu no sagyou naiyou*"
	;TODO
	return taskWas
}

;翌営業日の作業内容を日報形式で取得
NippouMacro_parseTaskWill(){
	taskWill := "*yoku eigyoubi no sagyou naiyou*"
	;TODO
	return taskWill
}