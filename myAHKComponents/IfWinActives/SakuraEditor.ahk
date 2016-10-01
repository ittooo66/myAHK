#IfWinActive,ahk_class TextEditorWindowW166

	;進む、戻る
	XButton2::Send,^{y}
	XButton1::Send,^{z}

	;Shift押しZですすめるようにした
	RShift & z::
	LShift & z::
	vkEBsc07B & z::
		if SHIFT() && LCMD()
			Send,^{y}
		else
			mbind_z()
	return

	LControl & d::
	vkEBsc07B & d::
		if CAPS() && LCMD()
			NippouMacro_initTime()
		else
			mbind_d()
	return

	LControl & w::
	vkEBsc07B & w::
		if CAPS() && LCMD()
			NippouMacroOnSakura_reloadTime(0, -15, 0, 0)
		else
			mbind_w()
	return

	LControl & r::
	vkEBsc07B & r::
		if CAPS() && LCMD()
			NippouMacroOnSakura_reloadTime(0, 15, 0, 0)
		else
			mbind_r()
	return

	LControl & s::
	vkEBsc07B & s::
		if CAPS() && LCMD()
			NippouMacroOnSakura_reloadTime(-1, 0, 0, 0)
		else
			mbind_s()
	return
	LControl & f::
	vkEBsc07B & f::
		if CAPS() && LCMD()
			NippouMacroOnSakura_reloadTime(1, 0, 0, 0)
		else
			mbind_f()
	return
	LControl & a::
	vkEBsc07B & a::
		if CAPS() && LCMD()
			NippouMacroOnSakura_reloadTime(-3, 0, 0, 0)
		else
			mbind_a()
	return
	LControl & g::
	vkEBsc07B & g::
		if CAPS() && LCMD()
			NippouMacroOnSakura_reloadTime(3, 0, 0, 0)
		else
			mbind_g()
	return

	LControl & u::
	vkEBsc07B & u::
		if CAPS() && LCMD()
			NippouMacroOnSakura_reloadTime(0, 0, 0, -15)
		else
			mbind_u()
	return
	LControl & o::
	vkEBsc07B & o::
		if CAPS() && LCMD()
			NippouMacroOnSakura_reloadTime(0, 0, 0, 15)
		else
			mbind_o()
	return

	LControl & j::
	vkEBsc07B & j::
		if CAPS() && LCMD()
			NippouMacroOnSakura_reloadTime(0, 0, -1, 0)
		else
			mbind_j()
	return
	LControl & l::
	vkEBsc07B & l::
		if CAPS() && LCMD()
			NippouMacroOnSakura_reloadTime(0, 0, 1, 0)
		else
			mbind_l()
	return
	LControl & h::
	vkEBsc07B & h::
		if CAPS() && LCMD()
			NippouMacroOnSakura_reloadTime(0, 0, -3, 0)
		else
			mbind_h()
	return
	LControl & `;::
	vkEBsc07B & `;::
		if CAPS() && LCMD()
			NippouMacroOnSakura_reloadTime(0, 0, 3, 0)
		else
			mbind_semicolon()
	return

	;日報マクロの時間調整
	NippouMacroOnSakura_reloadTime( startHourDiff, startMinuteDiff, endHourDiff, endMinuteDiff ){
		;行選択
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
			time := time . "0"
		time := time . startHour . ":"
		if(startMinute < 10)
			time := time . "0"
		time := time . startMinute . "-"
		if(endHour < 10)
			time := time . "0"
		time := time . endHour . ":"
		if(endMinute < 10)
			time := time . "0"
		time := time . endMinute . "    "

		;時間フォーマット出力
		directInput(time . text)
	}

	;日報マクロの初期時間の入力
	NippouMacro_initTime(){
		;前行に戻る
		Send,{Up}

		;前行をまるまるコピー
		Send,{End}
		Send,+{Home}
		Send,^{c}
		ClipWait 0.5, 1
		if ErrorLevel <> 0
		{
			return
		}

		;前行の時間フォーマットを得る
		StringLen, length, Clipboard
		if (length > 14){
			StringLeft, timeFormat, Clipboard, 15
			StringTrimLeft, text, ClipBoard, 15
		}else{
			Send,{Down}
			return
		}

		;各値を得る
		StringMid, strStartHour, timeFormat, 1 , 2
		StringMid, strStartMinute, timeFormat, 4 , 2
		StringMid, strEndHour, timeFormat, 7 , 2
		StringMid, strEndMinute, timeFormat, 10 , 2
		startHour := strStartHour
		startMinute := strStartMinute
		endHour := strEndHour
		endMinute := strEndMinute

		;開始行に戻る
		Send,{Down}

		;日時形式がおかしければ終了
		if (startHour < 0 || 24 < startHour || startMinute < 0 || 60 < startMinute || endHour < 0 || 24 < endHour || endMinute < 0 || 60 < endMinute){
			return
		}

		;時間フォーマットの入力
		directInput(strEndHour . ":" . strEndMinute . "-" . strEndHour . ":" . strEndMinute . "    ")
	}

#IfWinActive