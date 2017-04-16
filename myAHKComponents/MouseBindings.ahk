;マウス設定

;Default
RButton::Send,{RButton}
XButton2::Send,{XButton2}
XButton1::Send,{XButton1}
MButton::
	if GetKeyState("vkEBsc07B","P"){
		run C:\Program Files\sakura\sakura.exe %A_WorkingDir%\myAHKComponents\Resources\FileAlias\FileAliases.txt
	}else{
		Send,{MButton Down}
		while(GetKeyState("MButton","P")){
			sleep,50
		}
		Send,{MButton Up}
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
	}else if GetKeyState("MButton","P"){
		if !activateWindow("CabinetWClass","explorer.exe","")
			openApp("Entrance")
	}else{
		Send,{WheelUp}
	}
return

;APP起動バインド
MButton & LButton::
	if !activateWindow("PPTFrameClass","","")
		openApp("PowerPoint")
return
MButton & XButton1::
	if !activateWindow("XLMAIN","","")
		openApp("Excel")
return
MButton & XButton2::
	if !activateWindow("rctrl_renwnd32","OUTLOOK.EXE","")
		openApp("Outlook")
return
MButton & RButton::
	if !activateWindow("OpusApp","","")
		openApp("Word")
return
XButton1 & LButton::
if !activateWindow("CabinetWClass","explorer.exe","")
	openApp("Entrance")
return
;以下、誤動作防止
MButton & WheelUp::return
MButton & WheelDown::return

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
	}else if GetKeyState("MButton","P"){
		if !activateWindow("CabinetWClass","explorer.exe","")
			openApp("Entrance")
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
XButton1 & XButton2::Send,#{Tab}
XButton2 & XButton1::Send,#{Tab}
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
;Pin tab
RButton & LButton::Send,!{p}


;ホイールクリック
XButton2 & LButton::intelliScroll()
;Winキー
XButton1 & RButton::Send,{RWin}
;Explorer起動
XButton1 & LButton::openApp("Entrance")

;MButton
XButton2 & RButton::
	Send,{MButton Down}
	while(GetKeyState("XButton2","P")&&GetKeyState("RButton","P")){
		sleep,30
	}
	Send,{MButton Up}
return
