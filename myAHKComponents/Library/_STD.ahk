;特定のWindowクラスを最下層から引っ張る
;className:クラス名。空指定（""）の場合、Class指定なし
;processName:プロセス名。idea.exeとかそういうやつ。空指定（""）の場合、Process指定なし
;titleName:タイトル。空指定（""）の場合、Title指定なし
;===返り値===
;true:引っ張ってこれた
;false:存在しなかった
activateWindow(className, processName, titleName){
	;Spaceバインドで呼び出している場合、Spaceキーを消費
	if(SPACE())
		consumeSpace()

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

;修飾キー付きのkeypress
press(key){
	;修飾キー変数
	modifiers := ""
	;修飾キー検知して追加
	if LCMD()
		modifiers = %modifiers%^
	if SHIFT()
		modifiers = %modifiers%+
	if LALT()
		modifiers = %modifiers%!
	if RALT()
		modifiers = %modifiers%#
	;修飾キーつきkeyPress
	Send,%modifiers%%key%
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
		}else if (prefix = "bg "){
			StringTrimLeft, query, InputVar, 3
			Run,http://www.bing.com/translator/?from=en&to=ja&text=%query%
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
	Run, C:\Users\ittoo\AppData\Local\Vivaldi\Application\vivaldi.exe "http://www.flvto.biz/?url=%clipboard%"
}

;拡張クリップボード(copy)
copyTo(num){
	;Spaceキーのスタックを消費
	consumeSpace()
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
	;Spaceキーのスタックを消費
	consumeSpace()
	;content取得
	FileRead, content ,*c %A_WorkingDir%\myAHKComponents\Resources\Clipboard\%num%.dat
	;content出力
	directInput(content)
}

;直接入力、IME無視で文字列(string)(dat可)を入力する
directInput(string){
	Clipboard := string
	Send,^v
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
	HistoricalClip_copy()
	Send,{BackSpace}
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

;各種Appを開く
openApp(appName){
	fileDir = %A_WorkingDir%\myAHKComponents\Resources\Apps\
	fileDir := fileDir . appName
	run, %fileDir%
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

;AHKリロード
reloadAHK(){
	tooltip, AHK reloading
	sleep 300
	tooltip
	logger_out("(INFO) AHK RELOADED`n")
	Reload
}

;AHKサスペンド
suspendAHK(){
	Suspend, ON
	tooltip, AHK suspended
	sleep 800
	tooltip
	logger_out("(INFO) AHK SUSPENDED`n")
}

;ミュートタイマー機能
muneNMin(){
	InputBox, muteMinute , Delayed Mute, Mute After N minute,, 200, 130,,,,,60
	if ErrorLevel <> 0
		return
	else {
		If muteMinute is integer
		{
			msgbox, Mute After %muteMinute% Minute
			Loop, %muteMinute%
			{
				sleep, 60000
			}
			Loop, 50
			{
				Send,{Volume_Down}
			}
		}else
			msgbox, Invalid Input Number
	}
}

;特定VM上に存在するシェルを実行する
;vmName:"VM名称"
;shellPath:"VM上に存在するシェルのPATH"
execVMShell(vmName, shellPath){
	script := A_WorkingDir . "\myAHKComponents\Resources\Scripts\exec_shell_" . vmName . ".bat " . shellPath
	run, %script%
}

;Scripts配下のバッチファイルを実行する
;scriptName:"バッチファイル名"
execScripts(scriptName){
	script := A_WorkingDir . "\myAHKComponents\Resources\Scripts\" . scriptName
	run, %script%
}