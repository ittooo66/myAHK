;日報の作成
NippouMacro_makeNippou(){
	;日報本体
	nippou := ""

	;本日の日付
	taskWasDate := Nippoumacro_getTaskWasDate()
	;本日の作業内容
	taskWas := NippouMacro_parseTaskWas()
	;icsファイル(今日)を日報形式に変換して追加
	nippou := nippou . NippouMacro_writeHeader(taskWasDate,taskWas)

	;翌営業日の日付
	taskWillDate := Nippoumacro_getTaskWillDate()
	;翌営業日の作業内容
	taskWill := NippouMacro_parseTaskWill()
	;icsファイル(明日)を日報形式に変換して追加
	nippou := nippou . NippouMacro_writeFooter(taskWillDate,taskWill)

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
		line = %A_LoopReadLine%
		match = X-CALSTART:
		;行にカレンダーの日付情報がある場合
		ifInString, line, %match%
		{
			;月日情報を取得して返す
			StringMid, month, line, 16, 2
			StringMid, day, line, 18, 2
			msgBox, %match% in %line%=>%month%/%day%
			;return %month%/%day%
		}

		Haystack = %A_LoopReadLine%
		Needle = X-CALSTART:
		IfInString, Haystack, %Needle%
		{
			MsgBox, The string was found.
			Return
		}
	}
	return "null"
}

;翌営業日の日付を取得
NippouMacro_getTaskWillDate(){
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