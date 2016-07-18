NippouMacro_upStartHour(){
	;clipboardにCopy
	Send,^x
	;0.5secクリップボードの中身が入ってくるまで待つ。第二引数はClipboardAllタイプの変数を待つ、の証(1)
	ClipWait 0.5, 1
	;クリップボードに何も入ってこないとき
	if ErrorLevel <> 0
	{
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
		Send,^v
		return
	}

	;時間調整
	startHour := startHour + 1
	if(startHour > 24)
		startHour := 0

	;時間フォーマットを作成
	time := ""
	if(startHour < 10)
		time := "0" . startHour . ":" . strStartMinute . "-" . strEndHour . ":" . strEndMinute . "		"
	else
		time := startHour . ":" . strStartMinute . "-" . strEndHour . ":" . strEndMinute . "		"

	;フォーマット入力
	directInput(time)
	;フォーマット形式で選択
	Send,+{Home}
}

NippouMacro_downStartHour(){
	;clipboardにCopy
	Send,^x
	;0.5secクリップボードの中身が入ってくるまで待つ。第二引数はClipboardAllタイプの変数を待つ、の証(1)
	ClipWait 0.5, 1
	;クリップボードに何も入ってこないとき
	if ErrorLevel <> 0
	{
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
		Send,^v
		return
	}

	;時間調整
	startHour := startHour - 1
	if(startHour < 0)
		startHour := 24

	;時間フォーマットを作成
	time := ""
	if(startHour < 10)
		time := time . "0"
	time := time . startHour . ":" . strStartMinute . "-" . strEndHour . ":" . strEndMinute . "		"

	;フォーマット入力
	directInput(time)
	;フォーマット形式で選択
	Send,+{Home}
}

NippouMacro_upStartMinute(){
	;clipboardにCopy
	Send,^x
	;0.5secクリップボードの中身が入ってくるまで待つ。第二引数はClipboardAllタイプの変数を待つ、の証(1)
	ClipWait 0.5, 1
	;クリップボードに何も入ってこないとき
	if ErrorLevel <> 0
	{
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
		Send,^v
		return
	}

	;時間調整
	startMinute := startMinute + 15
	if(startMinute > 59)
		startMinute := 0

	;時間フォーマットを作成
	time := ""
	if(startMinute < 10)
		time := strStartHour . ":0" . startMinute . "-" . strEndHour . ":" . strEndMinute . "		"
	else
		time := strStartHour . ":" . startMinute . "-" . strEndHour . ":" . strEndMinute . "		"

	;フォーマット入力
	directInput(time)
	;フォーマット形式で選択
	Send,+{Home}
}

NippouMacro_downStartMinute(){
	;clipboardにCopy
	Send,^x
	;0.5secクリップボードの中身が入ってくるまで待つ。第二引数はClipboardAllタイプの変数を待つ、の証(1)
	ClipWait 0.5, 1
	;クリップボードに何も入ってこないとき
	if ErrorLevel <> 0
	{
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
		Send,^v
		return
	}

	;時間調整
	startMinute := startMinute - 15
	if(startMinute < 0)
		startMinute := 45

	;時間フォーマットを作成
	time := ""
	if(startMinute < 10)
		time := strStartHour . ":0" . startMinute . "-" . strEndHour . ":" . strEndMinute . "		"
	else
		time := strStartHour . ":" . startMinute . "-" . strEndHour . ":" . strEndMinute . "		"

	;フォーマット入力
	directInput(time)
	;フォーマット形式で選択
	Send,+{Home}
}

NippouMacro_upEndHour(){
	;clipboardにCopy
	Send,^x
	;0.5secクリップボードの中身が入ってくるまで待つ。第二引数はClipboardAllタイプの変数を待つ、の証(1)
	ClipWait 0.5, 1
	;クリップボードに何も入ってこないとき
	if ErrorLevel <> 0
	{
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
		Send,^v
		return
	}

	;時間調整
	endHour := endHour + 1
	if(endHour > 24)
		endHour := 0

	;時間フォーマットを作成
	time := ""
	if(endHour < 10)
		time := strStartHour . ":" . strStartMinute . "-0" . endHour . ":" . strEndMinute . "		"
	else
		time := startHour . ":" . strStartMinute . "-" . endHour . ":" . strEndMinute . "		"

	;フォーマット入力
	directInput(time)
	;フォーマット形式で選択
	Send,+{Home}
}

NippouMacro_downEndHour(){
	;clipboardにCopy
	Send,^x
	;0.5secクリップボードの中身が入ってくるまで待つ。第二引数はClipboardAllタイプの変数を待つ、の証(1)
	ClipWait 0.5, 1
	;クリップボードに何も入ってこないとき
	if ErrorLevel <> 0
	{
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
		Send,^v
		return
	}

	;時間調整
	endHour := endHour - 1
	if(endHour < 0)
		endHour := 24

	;時間フォーマットを作成
	time := ""
	if(endHour < 10)
		time := strStartHour . ":" . strStartMinute . "-0" . endHour . ":" . strEndMinute . "		"
	else
		time := strStartHour . ":" . strStartMinute . "-" . endHour . ":" . strEndMinute . "		"

	;フォーマット入力
	directInput(time)
	;フォーマット形式で選択
	Send,+{Home}
}

NippouMacro_upEndMinute(){
	;clipboardにCopy
	Send,^x
	;0.5secクリップボードの中身が入ってくるまで待つ。第二引数はClipboardAllタイプの変数を待つ、の証(1)
	ClipWait 0.5, 1
	;クリップボードに何も入ってこないとき
	if ErrorLevel <> 0
	{
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
		Send,^v
		return
	}

	;時間調整
	endMinute := endMinute + 15
	if(endMinute > 59)
		endMinute := 0

	;時間フォーマットを作成
	time := ""
	if(endMinute < 10)
		time := strStartHour . ":" . strStartMinute . "-" . strEndHour . ":0" . endMinute . "		"
	else
		time := strStartHour . ":" . strStartMinute . "-" . strEndHour . ":" . endMinute . "		"

	;フォーマット入力
	directInput(time)
	;フォーマット形式で選択
	Send,+{Home}
}

NippouMacro_downEndMinute(){
	;clipboardにCopy
	Send,^x
	;0.5secクリップボードの中身が入ってくるまで待つ。第二引数はClipboardAllタイプの変数を待つ、の証(1)
	ClipWait 0.5, 1
	;クリップボードに何も入ってこないとき
	if ErrorLevel <> 0
	{
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
		Send,^v
		return
	}

	;時間調整
	endMinute := endMinute - 15
	if(endMinute < 0)
		endMinute := 45

	;時間フォーマットを作成
	time := ""
	if(endMinute < 10)
		time := strStartHour . ":" . strStartMinute . "-" . strEndHour . ":0" . endMinute . "		"
	else
		time := strStartHour . ":" . strStartMinute . "-" . strEndHour . ":" . endMinute . "		"

	;フォーマット入力
	directInput(time)
	;フォーマット形式で選択
	Send,+{Home}
}
