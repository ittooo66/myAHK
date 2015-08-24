;ライブラリ

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
		if (this_class = ahkClass)
		{
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

;selectの逆さ版。挙動が気に入らない
selectShift(ahkClass, ahkTitle){
	;配列idに現在稼働中のWindowを突っ込む
	WinGet, id, list, , , Program Manager
	;for(int A_Index=1;A_Index<N(id);A_Index++)
	idPref := ""
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
		if (this_class = ahkClass)
		{
			;title一致確認
			ifInString, this_title , %ahkTitle%, {
				;最前面に表示
				if idPref != ""
					WinActivate, ahk_id %idPref%
				;一段ずらし
				idPref := this_id
			}
		}
	}
	return false
}

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
		}else if var > 0
			Run, C:\Program Files (x86)\Google\Chrome\Application\chrome.exe "https://www.google.co.jp/search?hl=ja&q=%InputVar%"
	}
}

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
