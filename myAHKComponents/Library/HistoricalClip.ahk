;選択中の履歴階層の値
HistoricalClip_index := 1

;GUIが表示されているかどうかのGlobal変数
HistoricalClip_isDisplayed := 0

;ReturnにGUIフック
~+Return::
~Return::
	if HistoricalClip_isDisplayed(){
		HistoricalClip_closeWindow()
		if SHIFT(){
			HistoricalClip_paste(0,"txt")
		}else{
			HistoricalClip_paste()
		}
	}
return

;GUIが表示されているかどうか
HistoricalClip_isDisplayed(){
	global HistoricalClip_isDisplayed
	if (HistoricalClip_isDisplayed = 1)
		return true
	else
		return false
}

;Windowを閉じる
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

	;GUI初期化
	Gui, Destroy
	;常に最前面に表示
	Gui, +AlwaysOnTop
	;GUI背景色の変更
	Gui, Color, 0x404040

	;表示
	Loop, 10
	{
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

		;選択中か否かで配色設定の変更
		if(HistoricalClip_index == A_Index){
			file = => %file%
			Gui, Font, s13 cRed
		}else{
			file = -- %file%
			Gui, Font, s13 cWhite
		}

		Gui, Add, Text, vHistoricalClipText%A_Index% ,%file%
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

;Window内容をリロード
HistoricalClip_reloadWindow(){

	;HistoricalClip_index値取得・調整
	global HistoricalClip_index

	;表示
	Loop, 10
	{

		;変更対象のみ更新する
		if (!(HistoricalClip_index + 1 == A_Index || HistoricalClip_index == A_Index || HistoricalClip_index -1 == A_Index ))
			continue

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

		;選択中か否かで配色設定の変更
		if(HistoricalClip_index == A_Index){
			file = => %file%
			GuiControl, , HistoricalClipText%A_Index%, %file%
			GuiControl, +cRed +Redraw , HistoricalClipText%A_Index%
		}else{
			file = -- %file%
			GuiControl, , HistoricalClipText%A_Index%, %file%
			GuiControl, +cWhite +Redraw , HistoricalClipText%A_Index%
		}
	}
}

;上に移動
HistoricalClip_up(){
	global HistoricalClip_index
	HistoricalClip_index--
	if(HistoricalClip_index < 1)
		HistoricalClip_index := 1
	HistoricalClip_reloadWindow()
}

;下に移動
HistoricalClip_down(){
	global HistoricalClip_index
	HistoricalClip_index++
	if(HistoricalClip_index > 10)
		HistoricalClip_index := 10
	HistoricalClip_reloadWindow()
}

;貼り付け（index指定がなければ、現在選択中のindexで出力される）
;(type = dat(Datオブジェクトの貼り付け)|txt(Text形式の貼り付け))
HistoricalClip_paste(index = 0,type = "dat"){
	;パラメータ取得
	global HistoricalClip_index
	if(index == 0 && type == "dat")
		FileRead, content,*c %A_WorkingDir%\myAHKComponents\Resources\Clipboard\%HistoricalClip_index%.dat
	else if (index == 0 && type == "txt")
		FileRead, content, %A_WorkingDir%\myAHKComponents\Resources\Clipboard\%HistoricalClip_index%.txt
	else if (type == "dat")
		FileRead, content,*c %A_WorkingDir%\myAHKComponents\Resources\Clipboard\%index%.dat
	else
		FileRead, content, %A_WorkingDir%\myAHKComponents\Resources\Clipboard\%index%.txt

	;貼り付け
	directInput(content)
}

;コピー(履歴の最初にスタックされる)
HistoricalClip_copy(){
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
		FileDelete, %A_WorkingDir%\myAHKComponents\Resources\Clipboard\%i%.dat
		FileMoveDir, %A_WorkingDir%\myAHKComponents\Resources\Clipboard\%j%.txt, %A_WorkingDir%\myAHKComponents\Resources\Clipboard\%i%.txt, R
		FileMoveDir, %A_WorkingDir%\myAHKComponents\Resources\Clipboard\%j%.dat, %A_WorkingDir%\myAHKComponents\Resources\Clipboard\%i%.dat, R
	}
	;最新履歴をClipboardから取得
	FileAppend, %Clipboard%, %A_WorkingDir%\myAHKComponents\Resources\Clipboard\1.txt
	FileAppend, %ClipboardAll%, %A_WorkingDir%\myAHKComponents\Resources\Clipboard\1.dat
}

;切り取り（基本的にCopyと同様の仕様）
HistoricalClip_cut(){
	;clipboardにCopy
	Send,^x
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
		FileDelete, %A_WorkingDir%\myAHKComponents\Resources\Clipboard\%i%.dat
		FileMoveDir, %A_WorkingDir%\myAHKComponents\Resources\Clipboard\%j%.txt, %A_WorkingDir%\myAHKComponents\Resources\Clipboard\%i%.txt, R
		FileMoveDir, %A_WorkingDir%\myAHKComponents\Resources\Clipboard\%j%.dat, %A_WorkingDir%\myAHKComponents\Resources\Clipboard\%i%.dat, R
	}
	;最新履歴をClipboardから取得
	FileAppend, %Clipboard%, %A_WorkingDir%\myAHKComponents\Resources\Clipboard\1.txt
	FileAppend, %ClipboardAll%, %A_WorkingDir%\myAHKComponents\Resources\Clipboard\1.dat
}

;Gui内容保持用変数
HistoricalClipText1  :=
HistoricalClipText2  :=
HistoricalClipText3  :=
HistoricalClipText4  :=
HistoricalClipText5  :=
HistoricalClipText6  :=
HistoricalClipText7  :=
HistoricalClipText8  :=
HistoricalClipText9  :=
HistoricalClipText10 :=
HistoricalClipText11 :=
HistoricalClipText12 :=
HistoricalClipText13 :=
HistoricalClipText14 :=
HistoricalClipText15 :=
HistoricalClipText16 :=
HistoricalClipText17 :=
HistoricalClipText18 :=
HistoricalClipText19 :=
HistoricalClipText20 :=
HistoricalClipText21 :=
HistoricalClipText22 :=
HistoricalClipText23 :=
HistoricalClipText24 :=
HistoricalClipText25 :=
HistoricalClipText26 :=
HistoricalClipText27 :=
HistoricalClipText28 :=
HistoricalClipText29 :=
HistoricalClipText30 :=
HistoricalClipText31 :=
HistoricalClipText32 :=
HistoricalClipText33 :=
HistoricalClipText34 :=
HistoricalClipText35 :=
HistoricalClipText36 :=
HistoricalClipText37 :=
HistoricalClipText38 :=
HistoricalClipText39 :=
HistoricalClipText40 :=