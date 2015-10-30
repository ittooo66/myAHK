;ざっくりマクロ（rcmd||caps + b）用、適当に書き換えてくかんじ
macro(){
	return true
}

;特定のWindowクラスを最下層から引っ張る
;className:クラス名。空指定（""）の場合、Class指定なし
;processName:プロセス名。idea.exeとかそういうやつ。空指定（""）の場合、Process指定なし
;true:引っ張ってこれた
;false:存在しなかった
select(className, processName){
	;配列idに現在稼働中のWindowを突っ込む
	WinGet, id, list, , , Program Manager
	;for(int A_Index=1;A_Index<N(id);A_Index++)
	Loop, %id%
	{
		;最下層から引っ張るためiを降順にする
		i:=id-A_Index+1
		;this_idに現在なめてるWindowIDを入れる
		this_id := id%i%
		;this_idのClass、Processを取得
		WinGetClass, this_class, ahk_id %this_id%
		WinGet, this_process, ProcessName, ahk_id %this_id%
		;class一致確認
		ifInString, this_class , %className%, {
			;process一致確認
			ifInString, this_process , %processName%, {
				;最前面に表示
				WinActivate, ahk_id %this_id%
				return true
			}
		}
	}
	return false
}

;検索機能など
search(){
	InputBox, InputVar, Search
	If ErrorLevel <> 0
		return
	else{
		StringLen, var, InputVar
		StringLeft, prefix, InputVar, 3
		;wl:Weblioで単語検索
		if (prefix = "wl "){
			StringTrimLeft, query, InputVar, 3
			Run, C:\Program Files (x86)\Google\Chrome\Application\chrome.exe "http://ejje.weblio.jp/content_find?query=%query%&searchType=exact&x=0&y=0"
		;gm:Googlamap検索
		}else if (prefix = "gm "){
			StringTrimLeft, query, InputVar, 3
			Run, C:\Program Files (x86)\Google\Chrome\Application\chrome.exe "https://www.google.co.jp/maps/search/%query%"
		;htt:URL打ち込みとして処理
		}else if (prefix = "htt"){
			Run, C:\Program Files (x86)\Google\Chrome\Application\chrome.exe "%InputVar%"
		;通常:google検索
		}else if var > 0
			Run, C:\Program Files (x86)\Google\Chrome\Application\chrome.exe "https://www.google.co.jp/search?hl=ja&q=%InputVar%"
	}
}

;youtube動画DL
download(){
	Send, ^l
	clipboard =
	Send, ^c
	ClipWait
	Run, C:\Program Files (x86)\Google\Chrome\Application\chrome.exe "http://www.clipconverter.cc/jp/?url=%clipboard%"
}

;拡張クリップボード(copy)
copyTo(Num){
	;cb_bkに中身を退避
	cb_bk = %ClipboardAll%
	;一旦clipboardを空にする
	clipboard =
	;clipboardにCopy
	Send,^c
	;0.5secクリップボードの中身が入ってくるまで待つ。第二引数はClipboardAllタイプの変数を待つ、の証(1)
	ClipWait 0.5, 1
	;クリップボードに何も入ってこないとき
	If ErrorLevel <> 0
	{
		;終了
		Return
	}
	;ファイルにClipboardを保存
	FileAppend, %ClipboardAll%, %A_WorkingDir%\myAHKComponents\Resources\Clipboard\%Num%.dat
	;cb_bkから取得
	Clipboard = %cb_bk%
	;cb_bk開放
	cb_bk =
}

;拡張クリップボード(paste)
pasteFrom(Num){
	cb_bk = %ClipboardAll%
	FileRead, Clipboard ,*c %A_WorkingDir%\myAHKComponents\Resources\Clipboard\%Num%.dat
	Send,^v
	Clipboard = %cb_bk%
}

;ショートカット生成
addAlias(Num){
	;Explorer画面以外で暴発しないように
	WinGetClass, class, A
	if(class != "CabinetWClass"){
		return
	}
	;一応Clipboard対比しとく
	cb_bk = %ClipboardAll%
	Send,{F2}
	Send,^{a}
	clipboard =
	Send, ^c
	ClipWait 1
	filename = %clipboard%
	Send,{Esc}
	Send,^{l}
	clipboard =
	Send, ^c
	ClipWait 1
	filedir = %clipboard%
	FileDelete, %A_WorkingDir%\myAHKComponents\Resources\FileAlias\%Num%.txt
	FileAppend,	%filedir%\%filename% , %A_WorkingDir%\myAHKComponents\Resources\FileAlias\%Num%.txt
	Clipboard = %cb_bk%
	Send,{Return}
	Send,+{Tab}+{Tab}
}

;ショートカットを開く
openAlias(Num){
	FileRead, file , %A_WorkingDir%\myAHKComponents\Resources\FileAlias\%Num%.txt
	run, %file%
}

;よさげなスクロール、chromeのホイールボタンスクロールっぽい挙動を目指して。滑らかさが足りない
intelliScroll(){
	;初期マウス位置の取得
	MouseGetPos, preMouseX, preMouseY
	While(GetKeyState("LButton","P")){
		;現在マウス位置の取得
		MouseGetPos, mouseX, mouseY
		;差分取得
		mouseDiffX :=mouseX-preMouseX
		mouseDiffY :=mouseY-preMouseY

		;値調整
		diff := mouseDiffY/30
		if (diff<0){
			While(diff<0){
				Send,{WheelUp}
				diff:= diff+3
			}
		}else{
			While(diff>0){
				Send,{WheelDown}
				diff:= diff-3
			}
		}
		sleep, 60
	}
}

;ログ出力 => ./log.txt
print(log){
	FileAppend,
	(
		%log%
	), %A_WorkingDir%\myAHKComponents\log.txt
}

;GUIウィンドウが出力されているか、どうか
guiIsOn(){
	;配列idに現在稼働中のWindowを突っ込む
	WinGet, id, list, , , Program Manager
	;for(int A_Index=1;A_Index<N(id);A_Index++)
	Loop, %id%
	{
		StringTrimRight, this_id, id%A_Index%, 0
		WinGetClass, this_class, ahk_id %this_id%
		ifInString, this_class, AutoHotkeyGui
			return true
	}
	return false
}

;key: イベント対象のキー４つ
mouseMove(keyUp,keyDown,keyLeft,keyRight){
	val := 1
	slp := 10
	While(GetKeyState(keyUp,"P") || GetKeyState(keyDown,"P") || GetKeyState(keyLeft,"P") || GetKeyState(keyRight,"P")){
		MoveX := 0, MoveY := 0
		MoveY += GetKeyState(keyUp, "P") ? -val : 0
		MoveX += GetKeyState("s", "P") ? -val : 0
		MoveY += GetKeyState("d", "P") ? val : 0
		MoveX += GetKeyState("f", "P") ? val : 0
		MouseMove, %MoveX%, %MoveY%, 1, R
		Sleep, %slp%
		val++
	}
}

;マウスの左クリックエミュレート
mouseDrag(leftButtonKey){
	Send,{LButton Down}
	while(GetKeyState(leftButtonKey,"P")){
		Sleep,100
	}
	Send,{LButton Up}
}
