;日報マクロの時間調整
NippouMacro_reloadTime( startHourDiff, startMinuteDiff, endHourDiff, endMinuteDiff ){
	;時間フォーマットを選択
	Send,{End}
	Send,+{Home}
	Send,^{c}
	ClipWait 0.5, 1
	if ErrorLevel <> 0
	{
		return
	}

	StringLen, length, Clipboard
	if (length > 14){
		StringLeft, timeFormat, Clipboard, 15
		StringTrimLeft, text, ClipBoard, 15
	}else{
		return
	}

	;各値を得る
	StringMid, strStartHour, timeFormat, 1 , 2
	startHour := strStartHour
	StringMid, strStartMinute, timeFormat, 4 , 2
	startMinute := strStartMinute
	StringMid, strEndHour, timeFormat, 7 , 2
	endHour := strEndHour
	StringMid, strEndMinute, timeFormat, 10 , 2
	endMinute := strEndMinute

	;日時形式のValidate
	if (startHour < 0 || 24 < startHour || startMinute < 0 || 60 < startMinute || endHour < 0 || 24 < endHour || endMinute < 0 || 60 < endMinute){
		return
	}else{
		;時間入力の布石
		Send,{Backspace}
	}

	;時間フォーマットに各種diffを適用
	startHour := startHour + startHourDiff
	startMinute := startMinute + startMinuteDiff
	endHour := endHour + endHourDiff
	endMinute := endMinute + endMinuteDiff

	;時間の一回転
	if(startHour > 23)
		startHour := 0
	if(startHour < 0)
		startHour := 23
	if(startMinute > 59)
		startMinute := 0
	if(startMinute < 0)
		startMinute := 45
	if(endHour > 23)
		endHour := 0
	if(endHour < 0)
		endHour := 23
	if(endMinute > 59)
		endMinute := 0
	if(endMinute < 0)
		endMinute := 45

	;時間フォーマット作成
	time =
	if(startHour < 10)
		time := time . "0" . startHour . ":"
	else
		time := time . startHour . ":"
	if(startMinute < 10)
		time := time . "0" . startMinute . "-"
	else
		time := time . startMinute . "-"
	if(endHour < 10)
		time := time . "0" . endHour . ":"
	else
		time := time . endHour . ":"
	if(endMinute < 10)
		time := time . "0" . endMinute . "    "
	else
		time := time . endMinute . "    "

	;時間フォーマット出力
	directInput(time . text)
}

;日報マクロの初期時間の入力
NippouMacro_initTime(){
	Send,{Up}
	Send,{Home}
	Loop, 7
	{
		Send,+^{RIGHT}
	}
	Send,^{c}
	ClipWait 0.5, 1

	;クリップボードに何も入ってこないとき
	if ErrorLevel <> 0
	{
		Send,{Down}
		return
	}

	;各値を得る
	StringMid, strStartHour, ClipBoard, 1 , 2
	StringMid, strStartMinute, ClipBoard, 4 , 2
	StringMid, strEndHour, ClipBoard, 7 , 2
	StringMid, strEndMinute, ClipBoard, 10 , 2
	startHour := strStartHour
	startMinute := strStartMinute
	endHour := strEndHour
	endMinute := strEndMinute
	;日時形式がおかしければ終了
	if (startHour < 0 || 24 < startHour || startMinute < 0 || 60 < startMinute || endHour < 0 || 24 < endHour || endMinute < 0 || 60 < endMinute){
		Send,{Down}
		return
	}

	;時間フォーマットを作成
	time := strEndHour . ":" . strEndMinute . "-" . strEndHour . ":" . strEndMinute . "    "

	Send,{Down}
	;フォーマット入力
	directInput(time)
	;フォーマット形式で選択
	Send,+{Home}
}

