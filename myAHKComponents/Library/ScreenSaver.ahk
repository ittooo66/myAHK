;操作を監視して一定時間の入力がなかった場合、スクリーンせーバ用の画面に飛ぶ

;ScreenSaverラベル：1秒おきに呼ばれる。10分カウントして時間経過後スクリーンセーバ画面に飛ばす
ScreenSaver_CheckAction:
	;無効なら終了
	if(!ScreenSaver_isEnabled())
		return

	;マウス位置の移動有無に応じてカウント値を変更
	MouseGetPos, mouseX, mouseY
	if(preMouseX != mouseX && preMouseY != mouseY){
		ScreenSaver_count := 0
		preMouseX := mouseX
		preMouseY := mouseY
	}else{
		ScreenSaver_count++
	}

	if(ScreenSaver_count > 600){
		;規定時刻以上になった場合、スクリーンを移動
		Loop, 4 {
			Send,^#{Right}
			sleep, 100
		}
		ScreenSaver_count := 0
	}
return

;ScreenSaver機能の有効化、無効化
ScreenSaver_toggle(){
	if (ScreenSaver_isEnabled()){
		setStringWriter("ScreenSaver_isEnabled","false")
		msgBox, disabled ScreenSaver
	}else{
		setStringWriter("ScreenSaver_isEnabled","true")
		msgBox, enabled ScreenSaver
	}
}

;ScreenSaver機能の有効・無効の確認
ScreenSaver_isEnabled(){
	state := getStringWriter("ScreenSaver_isEnabled")
	if(state == "true"){
		return true
	}
	return false
}