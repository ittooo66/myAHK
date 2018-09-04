;マウス設定

;Default
RButton::Send,{RButton}
XButton2::Send,{XButton2}
XButton1::Send,{XButton1}

MButton::
	if GetKeyState("vkEBsc07B","P"){
		;Sakura Editorでファイルリストを開く
		run %A_WorkingDir%\myAHKComponents\Resources\Apps\SakuraEditor.lnk %A_WorkingDir%\myAHKComponents\Resources\FileAlias\FileAliases.txt
	}else{
		;Window位置を移動する
		WinGetActiveStats, Title, Width, Height, X, Y
		touchW:=Width/2
		touchH:=10
		BlockInput, MouseMove
		Mousemove,%touchW%,%touchH%,0
		Send,{LButton Down}
		BlockInput, MouseMoveOff
	}
return
WheelUp::
	if GetKeyState("vkEBsc07B","P") {
		if FileLauncher_isDisplayed(){
			FileLauncher_up()
		}else{
			FileLauncher_openWindow()
		}
	}else if GetKeyState("Space","P"){
		if HistoricalClip_isDisplayed(){
			HistoricalClip_up()
		}else{
			HistoricalClip_openWindow()
			consumeSpace()
		}
	}else{
		Send,{WheelUp}
	}
return

;IoT
MButton & LButton::IoT_PhilipsHueOn()
MButton & RButton::IoT_PhilipsHueOff()
;Null
MButton & XButton2::return
MButton & XButton1::return
MButton & WheelUp::return
MButton & WheelDown::return

;Explorer起動
XButton1 & LButton::
	if !activateWindow("CabinetWClass","explorer.exe","")
		openApp("Entrance")
return

WheelDown::
	if GetKeyState("vkEBsc07B","P") {
		if FileLauncher_isDisplayed(){
			FileLauncher_down()
		}else{
			FileLauncher_openWindow()
		}
	}else if GetKeyState("Space","P"){
		if HistoricalClip_isDisplayed(){
			HistoricalClip_down()
		}else{
			HistoricalClip_openWindow()
			consumeSpace()
		}
	}else{
		Send,{WheelDown}
	}
return

;ウィンドウ変更
XButton1 & WheelUp::ShiftAltTab
XButton1 & WheelDown::AltTab
;横スクロール
XButton2 & WheelUp::Send,{WheelLeft}
XButton2 & WheelDown::Send,{WheelRight}
;ウィンドウ選択画面
XButton1 & XButton2::
XButton2 & XButton1::
	WinGetActiveStats, Title, Width, Height, X, Y
	touchW:=Width-4
	touchH:=Height-4
	BlockInput, MouseMove
	Mousemove,%touchW%,%touchH%,0
	Send,{LButton Down}
	BlockInput, MouseMoveOff
	while(GetKeyState("XButton2","P")&&GetKeyState("XButton1","P")){
		sleep,30
	}
	Send,{LButton Up}
return
;Reload/Suspend bindings(for gaming)
XButton1 & MButton::Suspend
XButton2 & MButton::Reload

;Chrome系（タブ持ちApp系）でよく機能するバインド
;タブ変更
RButton & WheelUp::Send,^{PgUp}
RButton & WheelDown::Send,^{PgDn}
;タブ消去
RButton & XButton1::Send,^{w}
;前に使ったタブ
RButton & XButton2::Send,^+{t}
;New tab
RButton & MButton::Send,^{t}
;Null
RButton & LButton::return

;ホイールクリック
XButton2 & LButton::intelliScroll()
;Winキー
XButton1 & RButton::Send,{RWin}
XButton2 & RButton::
	Send,{MButton Down}
	while(GetKeyState("XButton2","P")&&GetKeyState("RButton","P")){
		sleep,30
	}
	Send,{MButton Up}
return