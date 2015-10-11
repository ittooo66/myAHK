;ざっくりマクロ（rcmd||caps + b）用、適当に書き換えてくかんじ
macro(){
	return true
}


;特定のWindowクラスを最下層から引っ張る
;ahkClass:クラス名
;ahkTitle:タイトル名。クラスで判別不可時（atom<>chrome）に使用,普段は空指定("")
;true:引っ張ってこれた
;false:存在しなかった
select(ahkClass, ahkTitle){
	;配列idに現在稼働中のWindowを突っ込む
	WinGet, id, list, , , Program Manager
	;for(int A_Index=1;A_Index<N(id);A_Index++)
	Loop, %id%
	{
		;最下層から引っ張るためiを降順にする
		i:=id-A_Index+1
		;this_idに現在見てるWindowのIDを入れる
		StringTrimRight, this_id, id%i%, 0
		;this_idのClass、Titleを取得
		WinGetClass, this_class, ahk_id %this_id%
		WinGetTitle, this_title, ahk_id %this_id%
		;class一致確認
		ifInString, this_class , %ahkClass%, {
			;title一致確認
			ifInString, this_title , %ahkTitle%, {
				;最前面に表示
				WinActivate, ahk_id %this_id%
				return true
			}
		}
	}
	return false
}

;修飾キー付きのkeypress
press(key){
  modifiers := ""
	if GetKeyState("LControl", "P")
		modifiers = %modifiers%^
	if GetKeyState("LShift", "P")
		modifiers = %modifiers%+
	if GetKeyState("Alt", "P")
		modifiers = %modifiers%!
	if GetKeyState("Win", "P")
		modifiers = %modifiers%`#
	Send,%modifiers%%key%
}

;Google検索機能、prefixつけて辞書直飛び
googleSearch(){
	InputBox, InputVar, Search
	If ErrorLevel <> 0
		return
	else{
		StringLen, var, InputVar
		StringLeft, prefix, InputVar, 3
		if (prefix = "wl "){
			StringTrimLeft, query, InputVar, 3
			Run, C:\Program Files (x86)\Google\Chrome\Application\chrome.exe "http://ejje.weblio.jp/content_find?query=%query%&searchType=exact&x=0&y=0"
		}else if (prefix = "gm "){
			StringTrimLeft, query, InputVar, 3
			Run, C:\Program Files (x86)\Google\Chrome\Application\chrome.exe "https://www.google.co.jp/maps/search/%query%"
		}else if var > 0
			Run, C:\Program Files (x86)\Google\Chrome\Application\chrome.exe "https://www.google.co.jp/search?hl=ja&q=%InputVar%"
	}
}

;youtube動画をDLする
download(){
	Send, ^l
	clipboard =
	Send, ^c
	ClipWait
	Run, C:\Program Files (x86)\Google\Chrome\Application\chrome.exe "http://www.clipconverter.cc/jp/?url=%clipboard%"
}

;拡張クリップボード(copy)
copyTo(Num){
	cb_bk = %ClipboardAll%
	clipboard =
	Send,^c
	ClipWait
	FileDelete,  %A_WorkingDir%\myAHKComponents\Clipboard\%Num%.txt
	FileAppend,
	(
	%clipboard%
	), %A_WorkingDir%\myAHKComponents\Clipboard\%Num%.txt
	Clipboard = %cb_bk%
}

;拡張クリップボード(paste)
pasteFrom(Num){
	cb_bk = %ClipboardAll%
	FileRead, Clipboard , %A_WorkingDir%\myAHKComponents\Clipboard\%Num%.txt
	Send,^v
	Sleep, 200
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
	ClipWait
	filename = %clipboard%
	Send,{Esc}
	Send,^{l}
	clipboard =
	Send, ^c
	ClipWait
	filedir = %clipboard%
	FileDelete,  %A_WorkingDir%\myAHKComponents\FileAlias\%Num%.txt
	FileAppend,
	(
	%filedir%\%filename%
	), %A_WorkingDir%\myAHKComponents\FileAlias\%Num%.txt
	Clipboard = %cb_bk%
	Send,{Return}
	Send,{Tab}{Tab}{Tab}
}

;ショートカットを開く
openAlias(Num){
	FileRead, file , %A_WorkingDir%\myAHKComponents\FileAlias\%Num%.txt
	run, %file%
}

;マウス移動機能
mousemove(){
	val := 1
	slp := 10
	if(GetKeyState("RControl","P"))
	    Send,{LButton Down}
	While (GetKeyState("RAlt", "P")){
		MoveX := 0, MoveY := 0
		MoveY += GetKeyState("e", "P") ? -val : 0
		MoveX += GetKeyState("s", "P") ? -val : 0
		MoveY += GetKeyState("d", "P") ? val : 0
		MoveX += GetKeyState("f", "P") ? val : 0
		MouseMove, %MoveX%, %MoveY%, 1, R
		Sleep, %slp%
		val++
		if( !GetKeyState("e", "P") && !GetKeyState("d", "P") && !GetKeyState("s", "P") && !GetKeyState("f", "P"))
			val := 1
		if( !GetKeyState("RControl","P") )
			Send,{LButton Up}
	}
	Send,{LButton Up}
}

;ログ出力 => ./log.txt
printlog(log){
	FileAppend,
	(
		%log%
	), %A_WorkingDir%\myAHKComponents\log.txt
}


;使ってなさげ

;全ウィンドウをアクティブに。挙動おっせえ
fullWinActivate(){
	;配列idに現在稼働中のWindowを突っ込む
	WinGet, id, list, , , Program Manager
	Loop, %id%
	{
		;this_idに現在見てるWindowのIDを入れる
		StringTrimRight, this_id, id%A_Index%, 0
		;this_idをActivate
		WinActivate, ahk_id %this_id%
	}
}
