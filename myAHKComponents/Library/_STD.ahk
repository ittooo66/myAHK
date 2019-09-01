;特定のWindowクラスを最下層から引っ張る
;className:クラス名。空指定（""）の場合、Class指定なし
;processName:プロセス名。idea.exeとかそういうやつ。空指定（""）の場合、Process指定なし
;titleName:タイトル。空指定（""）の場合、Title指定なし
;multi:該当Windowの複数フックモード、デフォルトは無効(0)
;===返り値===
;true:引っ張ってこれた
;false:存在しなかった
activateWindow(className, processName, titleName, multi=0){
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
					if (multi = 0){
						return true
					}
				}
			}
		}
	}
	return false
}

;最小化されているウィンドウをすべてアクティブにする
activeAllWindow(){
	;配列idに現在稼働中のWindowを突っ込む
	WinGet, id, list, , , Program Manager
	;for(int A_Index=1;A_Index<N(id);A_Index++)
	Loop, %id%
	{
		;this_idに現在なめてるWindowIDを入れる
		this_id := id%A_Index%
		;this_idのTitleを取得
		WinGetTitle, this_title, ahk_id %this_id%
		;Window位置の取得（最小化）
		WinGetPos,X,Y,Width,Height,%this_title%

		;最小化されているウィンドウを最前面に表示
		;モニタ１:最小化時はX,Yが-32000になるため、それをフックする
		;モニタ２：最小化時はXが-22613になるため、それをフックする
		;※X指定なしを除外するため、最小値も指定。
		if ( -40000 < X && X < -20000 ){
			WinActivate, ahk_id %this_id%
		}
	}
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
	logger_key(key)
}

;直接入力、IME無視で文字列(string)(dat可)を入力する
directInput(string){
	;cb_bkに中身を退避
	cb_bk = %ClipboardAll%
	;Clipboard経由で文字列一括入力
	Clipboard := string
	Send,^v
	;入力完了を待ってClipboard内容を復元
	sleep,100
	Clipboard = %cb_bk%
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
	logger_info("AHK RELOADED")
	Reload
}

;AHKサスペンド
suspendAHK(){
	Suspend, ON
	tooltip, AHK suspended
	sleep 800
	tooltip
	logger_info("AHK SUSPENDED")
}

;AHKシャットダウン
exitAHK(){
	tooltip, AHK shutting down
	sleep 800
	logger_info("AHK EXIT")
	ExitApp
}

;ミュートタイマー機能
muteNMin(){
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

;Scripts配下のPS1ファイルを実行する
;scriptName:"PS1ファイル名"
execPs1Scripts(scriptName){
	script := A_WorkingDir . "\myAHKComponents\Resources\Scripts\" . scriptName
	run, powershell.exe %script%
}

;IfinStringのラッパー、IfInStringの動作が安定しなかったので作った
;=>stringにkeyが入ってるとき　true
;=>stringにkeyが入っていないとき　false
inStr(string,key){
	IfInString, string, %key%
	{
		return true
	}
	return false
}

;よさげなスクロール
intelliScroll(){
	;初期マウス位置の取得
	MouseGetPos, preMouseX, preMouseY
	while(GetKeyState("LButton","P")){
		;現在マウス位置の取得
		MouseGetPos, mouseX, mouseY
		;差分取得
		mouseDiffX :=mouseX-preMouseX
		mouseDiffY :=mouseY-preMouseY

		;スクロール分量値調整
		SetFormat, float, 0.0
		diffPointY := (mouseDiffY/30)
		SetFormat, float, 0.0
		diffPointX := (mouseDiffX/30)

		;abs変換
		absDiffPointY := diffPointY
		if(diffPointY<0)
			absDiffPointY := -diffPointY
		absDiffPointX := diffPointX
		if(diffPointX<0)
			absDiffPointX := -diffPointX

		;適用対象判定
		if(absDiffPointX > absDiffPointY ){
			;Count値、Stack用意
			sleepCount := 100/absDiffPointX
			sleepStack := 0

			;X方向適用
			while(absDiffPointX > 0){
				if(diffPointX>0)
					send,{WheelLeft}
				else
					send,{WheelRight}

				;スタック溜まったらSleep（１ミリSleepはまともに挙動しないので20程度見る）
				sleepStack +=sleepCount
				if(sleepStack > 20){
					sleep, %sleepCount%
					sleepStack := 0
				}

				absDiffPointX--
			}
		}else{
			;Count値、Stack用意
			sleepCount := 100/absDiffPointY
			sleepStack := 0

			;Y方向適用
			while(absDiffPointY > 0){
				if(diffPointY>0)
					send,{WheelUp}
				else
					send,{WheelDown}

				;スタック溜まったらSleep（１ミリSleepはまともに挙動しないので20程度見る）
				sleepStack +=sleepCount
				if(sleepStack > 20){
					sleep, %sleepCount%
					sleepStack := 0
				}

				absDiffPointY--
			}
		}
	}
}
