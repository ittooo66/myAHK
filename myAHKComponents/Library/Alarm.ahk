;アラーム機能。CheckAlarmTimeでポーリングしつつ、指定時刻になり次第Alarm()を呼んでアラームがなりだす機能。
;MainでCheckAlarmTimeをポーリングさえすれば使用可能

;アラームが現在なっているか、否か
Alarm_isActive := 0

Alarm_CheckTime:
	;現在時刻（時分秒の数値型）を取得
	time := Mod(A_Now,1000000)

	;時刻指定
	if(070000<time && time<073000){
		;アラームがすでになっていないようであれば
		global Alarm_isActive
		if(Alarm_isActive != 0){
			;アラームを鳴らす
			Alarm()
		}
	}
return

Alarm(){
	;アラーム無効モードなら無効
	if !Alarm_isEnabled() return

	;アラームを鳴らす合図
	global Alarm_isActive
	Alarm_isActive := 1

	;サウンドデバイスをスピーカーに変更
	changeSoundDevice("0")
	sleep,1000

	;Volumeを最大まで上げる
	Loop,100{
		Send,{Volume_Up}
	}
	sleep,1000

	;発動
	Loop,{
		SoundBeep, 444 , 150
	}
}


;Alarm機能の有効化、無効化
Alarm_toggle(){
	if (Alarm_isEnabled()){
		setStringWriter("Alarm_isEnabled","false")
		msgBox, disabled Alarm
	}else{
		setStringWriter("Alarm_isEnabled","true")
		msgBox, enabled Alarm
	}
}

;Alarm機能の有効・無効の確認
Alarm_isEnabled(){
	state := getStringWriter("Alarm_isEnabled")
	if(state == "true"){
		return true
	}
	return false
}
