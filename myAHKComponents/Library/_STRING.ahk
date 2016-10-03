
;IfinStringのラッパー、IfInStringの動作が安定しなかったので作った
;=>stringにkeyが入ってるとき　true
;=>stringにkeyが入っていないとき　false
inStr(string,key){
	IfInString, string, %key%
	{
		return true
	}
	return false
}

;時間形式（HH:MM）の加算
time_Plus(time1,time2){
	;時間と分を取得
	StringLeft, time1hour, time1, 2
	StringRight, time1minute, time1, 2
	StringLeft, time2hour, time2, 2
	StringRight, time2minute, time2, 2

	;00(string)を0(数値)にする
	if(time1hour == "00"){
		time1hour := 0
	}
	if(time1minute == "00"){
		time1minute := 0
	}
	if(time2hour == "00"){
		time2hour := 0
	}
	if(time2minute == "00"){
		time2minute := 0
	}

	;時間と分を加算
	hour := time1hour + time2hour
	minute := time1minute + time2minute
	if(time1minute >= 60){
		minute := minute - 60
		hour := hour + 1
	}

	;0Xを00にする
	if(minute < 10){
		minute = 0%minute%
	}
	if(hour < 10){
		hour = 0%hour%
	}

	;時刻形式に変換して返す
	TIME = %hour%:%minute%
	return TIME
}

;時間形式（HH:MM）の減算
time_Minus(time1, time2){
	;時間と分を取得
	StringLeft, time1hour, time1, 2
	StringRight, time1minute, time1, 2
	StringLeft, time2hour, time2, 2
	StringRight, time2minute, time2, 2

	;00(string)を0(数値)にする
	if(time1hour == "00"){
		time1hour := 0
	}
	if(time1minute == "00"){
		time1minute := 0
	}
	if(time2hour == "00"){
		time2hour := 0
	}
	if(time2minute == "00"){
		time2minute := 0
	}

	;時間と分の差分を取得
	hour := time1hour - time2hour
	minute := time1minute - time2minute
	if (minute < 0){
		minute := minute + 60
		hour := hour - 1
	}

	if(minute < 10){
		minute = 0%minute%
	}
	if(hour < 10){
		hour = 0%hour%
	}

	;時刻形式に変換して返す
	TIME = %hour%:%minute%
	return TIME
}