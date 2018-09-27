;マウス設定

;Default
RButton::Send,{RButton}
XButton2::Send,{XButton2}
XButton1::Send,{XButton1}
;ウィンドウ変更
XButton1 & WheelUp::ShiftAltTab
XButton1 & WheelDown::AltTab
;横スクロール
XButton2 & WheelUp::Send,{WheelLeft}
XButton2 & WheelDown::Send,{WheelRight}
;Reload/Suspend AHK
XButton2 & MButton::
	Suspend, Permit
	reloadAHK()
return
XButton1 & MButton::
	Suspend, Permit
	suspendAHK()
return

;ホイールクリック
XButton2 & LButton::intelliScroll()
;Winキー
XButton1 & RButton::Send,{RWin}
;MButton
XButton2 & RButton::
	Send,{MButton Down}
	while( MB2() && MRB() ){
		sleep,30
	}
	Send,{MButton Up}
return

;Explorer起動
XButton1 & LButton::
	if !activateWindow("CabinetWClass","explorer.exe","")
		openApp("Entrance")
return

;ウィンドウサイズ変更
XButton1 & XButton2::
XButton2 & XButton1::
	WinGetActiveStats, Title, Width, Height, X, Y
	touchW:=Width-4
	touchH:=Height-4
	BlockInput, MouseMove
	Mousemove,%touchW%,%touchH%,0
	Send,{LButton Down}
	BlockInput, MouseMoveOff
	while(MB1() && MB2()){
		sleep,30
	}
	Send,{LButton Up}
return

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

MButton::
	if LCMD(){
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
	if LCMD(){
		if FileLauncher_isDisplayed(){
			FileLauncher_up()
		}else{
			FileLauncher_openWindow()
		}
	}else if SPACE(){
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

WheelDown::
	if LCMD(){
		if FileLauncher_isDisplayed(){
			FileLauncher_down()
		}else{
			FileLauncher_openWindow()
		}
	}else if SPACE(){
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

;IoT
MButton & LButton::IoT_PhilipsHueOn()
MButton & RButton::IoT_PhilipsHueOff()
;App Specific
RButton & LButton::return

;未使用
MButton & WheelUp::return
MButton & WheelDown::return
MButton & XButton2::return
MButton & XButton1::return

F20::return
F20 & WheelUp::Send,#^{Left}
F20 & WheelDown::Send,#^{Right}
F20 & MButton::return
F20 & RButton::return
F20 & LButton::Send,#{Tab}
F20 & XButton1::return
F20 & XButton2::return
F20 & AppsKey::return

AppsKey::return
AppsKey & WheelUp::Send,{Volume_Up}
AppsKey & WheelDown::Send,{Volume_Down}
AppsKey & MButton::return
AppsKey & LButton::Send,^+{q}
AppsKey & RButton::muneNMin()
AppsKey & XButton1::changeSoundDevice("1")
AppsKey & XButton2::changeSoundDevice("0")
AppsKey & F20::return
