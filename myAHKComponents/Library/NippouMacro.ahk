
NippouMacro_forwardTime(){
	;clipboardにCopy
	Send,^x
	;0.5secクリップボードの中身が入ってくるまで待つ。第二引数はClipboardAllタイプの変数を待つ、の証(1)
	ClipWait 0.5, 1
	;クリップボードに何も入ってこないとき
	if ErrorLevel <> 0
	{
		return
	}

	;頭二桁を数値として得る
	StringTrimRight, sHour, ClipBoard, 3
	hour := sHour
	;尾二桁を数値として得る
	StringTrimLeft, sMinute, ClipBoard, 3
	minute := sMinute

	;日時形式がおかしければ終了
	if (hour < 0 || 24 < hour || minute < 0 || 60 < minute){
		Send,^v
		return
	}

	;時間を15分すすめる
	if( minute < 45 ){
		minute := minute + 15
	}else{
		hour := hour + 1
		if(hour<10)
			Send,0
		minute := 0
	}

	;貼り付けて、選択する
	Send, %hour%
	Send,`:
	if(minute < 10)
		Send, 0%minute%
	else
		Send, %minute%
	Loop, 5
	{
		Send,+{Left}
	}

}

NippouMacro_backTime(){
	;clipboardにCopy
	Send,^x
	;0.5secクリップボードの中身が入ってくるまで待つ。第二引数はClipboardAllタイプの変数を待つ、の証(1)
	ClipWait 0.5, 1
	;クリップボードに何も入ってこないとき
	if ErrorLevel <> 0
	{
		return
	}

	;頭二桁を数値として得る
	StringTrimRight, sHour, ClipBoard, 3
	hour := sHour
	;尾二桁を数値として得る
	StringTrimLeft, sMinute, ClipBoard, 3
	minute := sMinute

	;日時形式がおかしければ終了
	if (hour < 0 || 24 < hour || minute < 0 || 60 < minute){
		Send,^v
		return
	}

	;時間を15分もどす
	if( minute >= 15 ){
		minute := minute - 15
	}else{
		hour := hour - 1
		if(hour<10)
			Send,0
		minute := 45
	}

	;貼り付けて、選択する
	Send, %hour%
	Send,`:
	if(minute < 10)
		Send, 0%minute%
	else
		Send, %minute%
	Loop, 5
	{
		Send,+{Left}
	}
}

NippouMacro_rateUp(){
	;◎○△▲☆
}

NippouMacro_rateDown(){

}