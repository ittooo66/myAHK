;選択中の履歴階層の値
FileLauncher_index := 1
FileLauncher_maxIndex := 1

;GUIが表示されているかどうかのGlobal変数
FileLauncher_isDisplayed := 0

vkEBsc07B Up::
	if FileLauncher_isDisplayed()
		FileLauncher_openFile()
return

;Windowを開く
FileLauncher_openWindow(){
	;FileLauncherフラグを上げる
	global FileLauncher_isDisplayed
	FileLauncher_isDisplayed = 1

	;FileLauncher_index値取得・調整(Index初期値は設定ファイルの行数の中央)
	global FileLauncher_index
	maxIndex := 0

	;GUI初期設定（初期化、最前面に表示、背景色の変更）
	Gui, Destroy
	Gui, +AlwaysOnTop
	Gui, Color, 0x444444

	;Clipboardファイルから１行づつ取得
	Loop, Read, %A_WorkingDir%\myAHKComponents\Resources\FileAlias\FileAliases.txt
	{
		;Clipboardファイルからfileに追加
		file =%A_LoopReadLine%`r`n

		;選択中か否かで配色設定の変更
		if(FileLauncher_index == A_Index){
			file = => %file%
			Gui, Font, s13 cRed
		}else{
			file = -- %file%
			Gui, Font, s13 cWhite
		}

		maxIndex++

		Gui, Add, Text, vFileLauncherText%A_Index% ,%file%
	}

	global FileLauncher_maxIndex
	FileLauncher_maxIndex := maxIndex

	;Window周りの設定（？？？、透明化、タイトルバー非表示）
	Gui +LastFound
	Winset, Transparent, 210
	Gui, -Caption

	;GUI表示
	Gui, Show
}

;Windowを開く
FileLauncher_reloadWindow(){

	;FileLauncher_index値取得・調整(Index初期値は設定ファイルの行数の中央)
	global FileLauncher_index

	;Clipboardファイルから１行づつ取得
	Loop, Read, %A_WorkingDir%\myAHKComponents\Resources\FileAlias\FileAliases.txt
	{
		;該当行のみ変更をかける
		if (!(FileLauncher_index + 1 == A_Index || FileLauncher_index == A_Index || FileLauncher_index -1 == A_Index ))
			continue

		;Clipboardファイルからfileに追加
		file =%A_LoopReadLine%`r`n

		;選択中か否かで配色設定の変更
		if(FileLauncher_index == A_Index){
			file = => %file%
			GuiControl, , FileLauncherText%A_Index%, %file%
			GuiControl, +cRed +Redraw , FileLauncherText%A_Index%
		}else{
			file = -- %file%
			GuiControl, , FileLauncherText%A_Index%, %file%
			GuiControl, +cWhite +Redraw , FileLauncherText%A_Index%
		}
	}
}

;Windowを閉じる
FileLauncher_closeWindow(){
	;FileLauncherフラグを上げる
	global FileLauncher_isDisplayed
	FileLauncher_isDisplayed = 0

	;Windowを閉じる
	GUI, Destroy
}

;GUIが表示されているかどうか
FileLauncher_isDisplayed(){
	global FileLauncher_isDisplayed
	if (FileLauncher_isDisplayed = 1)
		return true
	else
		return false
}

;上に移動
FileLauncher_up(){
	global FileLauncher_index
	FileLauncher_index--
	if(FileLauncher_index < 0)
		FileLauncher_index := 0
	FileLauncher_reloadWindow()
}

;下に移動
FileLauncher_down(){
	global FileLauncher_index
	global FileLauncher_maxIndex
	FileLauncher_index++
	;msgBox, %FileLauncher_maxIndex%
	if(FileLauncher_index > FileLauncher_maxIndex)
		FileLauncher_index := FileLauncher_maxIndex
	FileLauncher_reloadWindow()
}

;指定したファイルに飛ぶ
FileLauncher_openFile(){
	FileLauncher_closeWindow()
	global FileLauncher_index
	if (FileLauncher_index == 0){
		return
	}else{
		;Clipboardファイルから１行づつ取得
		Loop, Read, %A_WorkingDir%\myAHKComponents\Resources\FileAlias\FileAliases.txt
		{
			;該当行のパスを実行
			if (FileLauncher_index == A_Index){
				run, %A_LoopReadLine%
			}
		}
	}
}

;テキスト変数置き場
FileLauncherText1 :=
FileLauncherText2 :=
FileLauncherText3 :=
FileLauncherText4 :=
FileLauncherText5 :=
FileLauncherText6 :=
FileLauncherText7 :=
FileLauncherText8 :=
FileLauncherText9 :=
FileLauncherText10 :=
FileLauncherText11 :=
FileLauncherText12 :=
FileLauncherText13 :=
FileLauncherText14 :=
FileLauncherText15 :=
FileLauncherText16 :=
FileLauncherText17 :=
FileLauncherText18 :=
FileLauncherText19 :=
FileLauncherText20 :=

