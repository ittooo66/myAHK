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
		;モニタa:最小化時はX,Yが-32000になるため、それをフックする
		;モニタb：最小化時はXが-22613になるため、それをフックする
		;モニタc：最小化時はX,Yが-48000になるため、それをフックする
		;※X指定なしを除外するため、最小値も指定。
		if ( -60000 < X && X < -20000 ){
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
	;log出力
	;logger_key(key)
}

;直接入力、IME無視で文字列(string)(dat可)を入力する
directInput(string){
	;cb_bkに中身を退避
	cb_bk = %ClipboardAll%
	;Clipboard経由で文字列一括入力
	Clipboard := string
	Send,^v
	;入力完了を待ってClipboard内容を復元(要Tuning)
	sleep,200
	Clipboard = %cb_bk%
}

;外部変数への書き込み
;揮発性なし（Reload,再起動でも値は普遍）
;書き方：setEnv("var","true")でvar.txtにtrueが書き込まれる
setEnv(name, param){
	FileDelete, %A_WorkingDir%\myAHKComponents\Resources\Variables\%name%.txt
	FileAppend,	%param% , %A_WorkingDir%\myAHKComponents\Resources\Variables\%name%.txt
}

;外部変数の読み込み
;揮発性なし（Reload,再起動でも値は普遍）
;書き方：getEnv("var")でvar.txt内部の文字列を取得する
getEnv(name){
	FileRead, file , %A_WorkingDir%\myAHKComponents\Resources\Variables\%name%.txt
	return %file%
}

;Scripts配下のファイルを実行する
;scriptName:"ファイル名"
execScripts(scriptName){
	script := A_WorkingDir . "\myAHKComponents\Resources\Scripts\" . scriptName
	if scriptName contains ps1 
		run, powershell.exe %script%,,hide
	else 
		run, %script%,,hide
	
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

;ランチャ
;str:アプリ名称。バインドしたキー名称のアルファベットに合わせる
;shift:強制起動モード。1で有効化
;IEのとき：CLASS="IEFrame",PROCESS="",TITLE=""
;Outlookのとき：CLASS="rctrl_renwnd32",PROCESS="OUTLOOK.EXE",TITLE=""
;AppDirはmyAHKComponents\Resources\Apps配下。
launch(str, shift=0){
	
	;該当するショートカットがなければ、何もしない
	IfNotExist, %A_AppDir%\%str%.lnk
		return

	;強制起動モードの場合、strに紐づくアプリショートカットを起動して終了
	if (shift != 0){
		run, %A_AppDir%\%str%

	;通常モードの場合、	既存WindowをActivateして、いなければ起動
	}else{
		className := getEnv("APP_" . str . "_CLASS")
		processName := getEnv("APP_" . str . "_PROCESS")
		titleName := getEnv("APP_" . str . "_TITLE")
		if !activateWindow(className,processName,titleName) 
			run, %A_AppDir%\%str%
	}
}

;通知メッセージの表示
splash(str, sleep=3000 ,width=0 ,mx=0,my=0){
	if (mx = 0 && my = 0){
		MouseGetPos,mx,my
		WinGetPos,wx,wy,,,a
		mx+=wx
		my+=wy
	}
	if (width=0){
		SplashImage,,CW000000 CT66cdaa B FM18 X%mx% Y%my% ,,%str% ,,MS Gothic
	}else{
		SplashImage,,CW000000 CT66cdaa B FM18 W%width% X%mx% Y%my% ,,%str% ,,MS Gothic
	}
	sleep , %sleep%
	SplashImage,off
}

;log出力機能
logger( message , label="info" ){
	;日付情報の作成
	FormatTime,year,,yyyy
	FormatTime,month,,MM
	FormatTime,day,,dd
	FormatTime,hour,,HH
	FormatTime,minute,,mm
	FormatTime,second,,ss
	logger_date := year . "-" . month . "-" . day . " " . hour . ":" . minute ":" . second . "." . A_MSec . " "
	log := logger_date . message . "`n"
	FileAppend,	%log%, %A_WorkingDir%\myAHKComponents\Resources\Log\%label%.log
}