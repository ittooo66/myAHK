;日報の作成
NippouMacro_makeNippou(){
	;ICSファイルの変換
	psScript := A_WorkingDir . "\myAHKComponents\Resources\Nippou\FileConvert.ps1"
	psTextInDir := A_WorkingDir . "\myAHKComponents\Resources\Nippou\Convert"
	psTextOutDir := A_WorkingDir . "\myAHKComponents\Resources\Nippou\Converted"
	run, powershell.exe %psScript% %psTextInDir% %psTextOutDir%
	sleep,1000

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
	return NippouMacro_getDate(A_WorkingDir . "\myAHKComponents\Resources\Nippou\Converted\ICSWas.ics")
}

;翌営業日の日付を取得
NippouMacro_getTaskWillDate(){
	return NippouMacro_getDate(A_WorkingDir . "\myAHKComponents\Resources\Nippou\Converted\ICSWill.ics")
}

;ICSファイルから日時情報を取得
NippouMacro_getDate(icsLocation){
	;ICSファイルを行ごとに読み込み
	Loop, Read, %icsLocation%
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
	return NippouMacro_parseICS(A_WorkingDir . "\myAHKComponents\Resources\Nippou\Converted\ICSWas.ics")
}

;翌営業日の作業内容を日報形式で取得
NippouMacro_parseTaskWill(){
	return NippouMacro_parseICS(A_WorkingDir . "\myAHKComponents\Resources\Nippou\Converted\ICSWill.ics")
}

;ICSファイルを日報形式に変換
NippouMacro_parseICS(icsLocation){
	;日報
	nippouFormat := ""
	;イベントの個数
	eventIndex := 0

	;ICSファイルを行ごとに読み込み
	Loop, Read, %icsLocation%
	{
		icsLine = %A_LoopReadLine%

		;DTENDを引っ掛ける
		if(inStr(icsLine,"DTEND")){
			;記法に応じて時間情報を取得
			if (inStr(icsLine,"Tokyo Standard Time")){
				StringRight, time, icsLine, 6
			}else if(inStr(icsLine,"VALUE")){
				StringRight, time, icsLine, 6
			}else if(inStr(icsLine,"Z")){
				StringRight, time, icsLine, 7
			}
			;時間と分を取得
			StringLeft, hour, time, 2
			StringMid, minute, time, 3, 2
			;一時変数に格納
			DTEND_temp = %hour%:%minute%
		}

		;DTSTARTを引っ掛ける
		if(inStr(icsLine,"START")){
			;記法に応じて時間情報を取得
			if (inStr(icsLine,"Tokyo Standard Time")){
				StringRight, time, icsLine, 6
			}else if(inStr(icsLine,"VALUE")){
				StringRight, time, icsLine, 6
			}else if(inStr(icsLine,"Z")){
				StringRight, time, icsLine, 7
			}
			;時間と分を取得
			StringLeft, hour, time, 2
			StringMid, minute, time, 3, 2
			;一時変数に格納
			DTSTART_temp = %hour%:%minute%
		}

		;SUMMARYを引っ掛ける
		if(inStr(icsLine,"SUMMARY")){
			;記法に応じて時間情報を取得
			if (inStr(icsLine,"LANGUAGE")){
				StringTrimLeft, summary, icsLine, 20
			}else{
				StringTrimLeft, summary, icsLine, 8
			}
			;一時変数に格納
			SUMMARY_temp = %summary%
		}

		;RDATEに反応して日時情報を修正
		if(inStr(icsLine,"RDATE")){
			;記法に応じて時間情報を取得
			if (inStr(icsLine,"Tokyo Standard Time")){
				StringRight, time, icsLine, 6
			}else if(inStr(icsLine,"VALUE")){
				StringRight, time, icsLine, 6
			}else if(inStr(icsLine,"Z")){
				StringRight, time, icsLine, 7
			}
			;時間と分を取得
			StringLeft, hour, time, 2
			StringMid, minute, time, 3, 2
			;一時変数に格納
			RDATE = %hour%:%minute%

			;開始終了時刻を再計算
			DTEND_temp := time_Plus(RDATE,time_Minus(DTEND_temp,DTSTART_temp))
			DTSTART_temp := RDATE
		}

		;RECURRENCE-IDに反応して日時情報を修正
		if(inStr(icsLine,"RECURRENCE-ID")){
			;記法に応じて時間情報を取得
			if (inStr(icsLine,"Tokyo Standard Time")){
				StringRight, time, icsLine, 6
			}else if(inStr(icsLine,"VALUE")){
				StringRight, time, icsLine, 6
			}else if(inStr(icsLine,"Z")){
				StringRight, time, icsLine, 7
			}
			;時間と分を取得
			StringLeft, hour, time, 2
			StringMid, minute, time, 3, 2
			;一時変数に格納
			RID = %hour%:%minute%

			;一個前のイベントを対象とする
			dtst := DTSTART_temp
			DTSTART_temp := time_Minus(time_Plus(DTSTART%eventIndex%,DTSTART_temp),RID)
			DTEND_temp := time_Plus(DTSTART_temp,time_Minus(DTEND_temp,dtst))

			;一個後ろにする
			eventIndex--
		}

		;イベント記述終了時
		IfInString, icsLine, END:VEVENT
		{
			;Index増加
			eventIndex++

			;配列にイベント情報を入れる
			DTSTART%eventIndex% = %DTSTART_temp%
			DTEND%eventIndex% = %DTEND_temp%
			SUMMARY%eventIndex% = %SUMMARY_temp%

			start := DTSTART%eventIndex%
			end := DTEND%eventIndex%
			summary := SUMMARY%eventIndex%
		}
	}

	;10分以内の予定を間引く
	Loop, 50
	{
		if(inStr(DTSTART%A_Index%,":")){
			tmp := time_Minus(DTEND%A_Index%,DTSTART%A_Index%)
			StringLeft, tmHour, tmp, 2
			StringRight, tmMinute, tmp, 2
			if(tmHour == "00" && tmMinute == "00"){
				DTSTART%A_Index% = null
			}else if(tmHour == "00" && tmMinute < 10){
				DTSTART%A_Index% = null
			}

		}
	}

	;ソートを行う
	sort_i := 1
	sort_j := 1
	Loop, 50
	{
		if(inStr(DTSTART%sort_i%,":")){
			sort_j := 1
			Loop, 50
			{
				if(inStr(DTSTART%sort_j%,":")){
					dtsi := DTSTART%sort_i%
					dtsj := DTSTART%sort_j%
					if(!time_GreaterThan(DTSTART%sort_i%,DTSTART%sort_j%)){
						dts_temp := DTSTART%sort_i%
						dte_temp := DTEND%sort_i%
						sum_temp := SUMMARY%sort_i%
						DTSTART%sort_i% := DTSTART%sort_j%
						DTEND%sort_i% := DTEND%sort_j%
						SUMMARY%sort_i% := SUMMARY%sort_j%
						DTSTART%sort_j% := dts_temp
						DTEND%sort_j% := dte_temp
						SUMMARY%sort_j% := sum_temp
					}
				}
				sort_j++
			}
		}
		sort_i++
	}

	Loop, 50
	{
		if(inStr(DTSTART%A_Index%,":")){
			start := DTSTART%A_Index%
			end := DTEND%A_Index%
			summary := SUMMARY%A_Index%
			nippouFormat := nippouFormat . start . "-" . end . "    " . summary . "`n"
		}
	}

	return nippouFormat
}
