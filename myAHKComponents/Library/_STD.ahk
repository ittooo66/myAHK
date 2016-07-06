;特定のWindowクラスを最下層から引っ張る
;className:クラス名。空指定（""）の場合、Class指定なし
;processName:プロセス名。idea.exeとかそういうやつ。空指定（""）の場合、Process指定なし
;titleName:タイトル。空指定（""）の場合、Title指定なし
;===返り値===
;true:引っ張ってこれた
;false:存在しなかった
activateWindow(className, processName, titleName){
	;配列idに現在稼働中のWindowを突っ込む
	WinGet, id, list, , , Program Manager
	;for(int A_Index=1;A_Index<N(id);A_Index++)
	Loop, %id%
	{
		;最下層から引っ張るためiを降順にする
		i:=id-A_Index+1
		;this_idに現在なめてるWindowIDを入れる
		this_id := id%i%
		;this_idのClass,Title,Processを取得
		WinGetClass, this_class, ahk_id %this_id%
		WinGetTitle, this_title, ahk_id %this_id%
		WinGet, this_process, ProcessName, ahk_id %this_id%
		;class一致確認
		ifInString, this_class , %className%, {
			;title一致確認
			ifInString, this_title , %titleName%, {
				;process一致確認
				ifInString, this_process , %processName%, {
					;最前面に表示
					WinActivate, ahk_id %this_id%
					return true
				}
			}
		}
	}
	return false
}

;検索機能など
search(){
	InputBox, InputVar, Search
	if ErrorLevel <> 0
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
copyTo(num){
	;cb_bkに中身を退避
	cb_bk = %ClipboardAll%
	;一旦clipboardを空にする
	clipboard =
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
	;ファイルにClipboardを保存
	FileAppend, %ClipboardAll%, %A_WorkingDir%\myAHKComponents\Resources\Clipboard\%num%.dat
	;cb_bkから取得
	Clipboard = %cb_bk%
}

;拡張クリップボード(paste)
pasteFrom(num){
	;cb_bkに中身を退避
	cb_bk = %ClipboardAll%
	;Clipboardに内容読み込み
	FileRead, Clipboard ,*c %A_WorkingDir%\myAHKComponents\Resources\Clipboard\%num%.dat
	;貼り付け
	Send,^v
	;干渉防止のため、貼り付け完了まで一寸待ってClipboardを元に戻す
	sleep,300
	Clipboard = %cb_bk%
}

;ショートカット生成
addAlias(num){
	;Explorer画面以外で暴発しないように
	WinGetClass, class, A
	if(class != "CabinetWClass"){
		return
	}
	;一応Clipboard退避しとく
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
	FileDelete, %A_WorkingDir%\myAHKComponents\Resources\FileAlias\%num%.txt
	FileAppend,	%filedir%\%filename% , %A_WorkingDir%\myAHKComponents\Resources\FileAlias\%num%.txt
	Clipboard = %cb_bk%
	Send,{return}
	Send,+{Tab}+{Tab}
}

;ショートカットを開く
openAlias(num){
	FileRead, file , %A_WorkingDir%\myAHKComponents\Resources\FileAlias\%num%.txt
	run, %file%
}

;ログ出力 => ./log.txt
print(log){
	FileAppend,	%log%, %A_WorkingDir%\myAHKComponents\Resources\Log\log.txt
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

;一行消し。direction(="HOME"|"END")で消す方向を指定
lineDel(direction){
	Send,+{%direction%}
	HistoricalClip_stackCopy()
	Send,{BackSpace}
}

;window変更中フラグ,押しっぱなし病起きてる？ので防止用
_STDWindowChanging := false
;window変更
windowChange(direction){
	global _STDWindowChanging
	if(!_STDWindowChanging){
		_STDWindowChanging := true
		Send,^#{%direction%}
		sleep,100
		_STDWindowChanging := false
	}
}

;Windows+Dを強化
winD := 0
winD(){
	global winD
	if(winD==1){
		WinMinimizeAllUndo
		winD := 0
	}else{
		WinMinimizeAll
		;Desktopをフォーカス
		WinActivate, ahk_class WorkerW
		winD := 1
	}
}

;サウンドデバイス変更
;（イヤホン：num=0、スピーカ：num=1）
changeSoundDevice(num){
	run, control mmsys.cpl
	sleep,800
	activateWindow("#32770","","")
	Send,{Up}{Up}{Up}{Up}
	Loop, %num%
	{
		Send,{Down}
	}
	Send,!{s}
	Send,{Return}
}


;外部変数への書き込み
;揮発性なし（Reload,再起動でも値は普遍）
;書き方：setStringWriter("var","true")でvar.txtにtrueが書き込まれる
setStringWriter(name, param){
	FileDelete, %A_WorkingDir%\myAHKComponents\Resources\Variables\%name%.txt
	FileAppend,	%param% , %A_WorkingDir%\myAHKComponents\Resources\Variables\%name%.txt
}
;外部変数の読み込み
;揮発性なし（Reload,再起動でも値は普遍）
;書き方：getStringWriter("var")でvar.txt内部の文字列を取得する
getStringWriter(name){
	FileRead, file , %A_WorkingDir%\myAHKComponents\Resources\Variables\%name%.txt
	return %file%
}