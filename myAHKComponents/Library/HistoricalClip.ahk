;選択中の履歴階層の値
HistoricalClip_index := 1

;GUIが表示されているかどうかのGlobal変数
HistoricalClip_isDisplayed := 0

;GUIが表示されているかどうか
HistoricalClip_isDisplayed(){
	global HistoricalClip_isDisplayed
	if (HistoricalClip_isDisplayed = 1)
		return true
	else
		return false
}

HistoricalClip_closeWindow(){
	global HistoricalClip_isDisplayed
	HistoricalClip_isDisplayed = 0
	GUI, Destroy
}

;Windowを開く
HistoricalClip_openWindow(){
	;historicalClipフラグを上げる
	global HistoricalClip_isDisplayed
	HistoricalClip_isDisplayed = 1

	;HistoricalClip_index値取得・調整
	global HistoricalClip_index
	;枠内調整
	if(HistoricalClip_index<1){
		HistoricalClip_index:=1
	}else if(HistoricalClip_index>10){
		HistoricalClip_index:=10
	}

	;GUI初期化
	Gui, Destroy
	;常に最前面に表示
	Gui, +AlwaysOnTop
	;GUI背景色の変更
	Gui, Color, 0x404040

	;表示
	Loop, 10
	{
		;選択中か否かで配色設定の変更
		if(HistoricalClip_index == A_Index){
			Gui, Font, s13 cRed
		}else{
			Gui, Font, s13 cWhite
		}

		;file,indexを用意
		file =
		loopIndex := 0

		;Clipboardファイルから１行づつ取得
		Loop, Read, %A_WorkingDir%\myAHKComponents\Resources\Clipboard\%A_Index%.txt
		{
			;Clipboardファイルからfileに追加
			file =%file%%A_LoopReadLine%
			if (loopIndex = 5){
				;5行以上は省略
				file =%file%+[.....]
				break
			}else{
				;改行追加してIndex加算
				file =%file%`r`n
				loopIndex++
			}
		}
		Gui, Add, Text, ,%file%
	}

	;Window周りの設定
	Gui +LastFound
	;Windowを透明に
	Winset, Transparent, 210
	;タイトルバー非表示
	Gui, -Caption
	;GUI表示
	Gui, Show
}

;上に移動
HistoricalClip_up(){
	global HistoricalClip_index
	HistoricalClip_index--
	HistoricalClip_openWindow()
}

;下に移動
HistoricalClip_down(){
	global HistoricalClip_index
	HistoricalClip_index++
	HistoricalClip_openWindow()
}

;決定
HistoricalClip_return(){
	global HistoricalClip_index
	Gui, show, Hide
	cb_bk = %ClipboardAll%
	FileRead, Clipboard , %A_WorkingDir%\myAHKComponents\Resources\Clipboard\%HistoricalClip_index%.txt
	ClipWait
	Send,^v
	Sleep,300
	Clipboard = %cb_bk%

	;historicalClipフラグを下げる
	global HistoricalClip_isDisplayed
	HistoricalClip_isDisplayed = 0
}

;コピーをスタックする
HistoricalClip_stackCopy(){
	;clipboardにCopy
	Send,^c
	;0.5secクリップボードの中身が入ってくるまで待つ。第二引数はClipboardAllタイプの変数を待つ、の証(1)
	ClipWait 0.5, 1
	;クリップボードに何も入ってこないとき
	if ErrorLevel <> 0
	{
		;終了
		return
	}
	;履歴更新
	Loop, 10
	{
		i := 11 - A_Index
		j := i-1
		FileDelete, %A_WorkingDir%\myAHKComponents\Resources\Clipboard\%i%.txt
		FileMoveDir, %A_WorkingDir%\myAHKComponents\Resources\Clipboard\%j%.txt, %A_WorkingDir%\myAHKComponents\Resources\Clipboard\%i%.txt, R
	}
	;最新履歴をClipboardから取得
	FileAppend, %Clipboard%, %A_WorkingDir%\myAHKComponents\Resources\Clipboard\1.txt
}
