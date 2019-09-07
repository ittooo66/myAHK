;Command Prompt,Powershell
#IfWinActive,ahk_class ConsoleWindowClass
	^L::SendInput , {Esc}cls{Enter}
	vkEBsc07B & q::SendInput , {Esc}exit{Enter}
#IfWinActive

;ファイル保存ウィンドウ
#IfWinActive,ahk_class #32770
	;上へ戻る
	RButton & LButton::Send,!{Up}
#IfWinActive

;Internet Explorer
#IfWinActive,ahk_class IEFrame
	RButton & WheelUp::
		Send,^+{Tab}
	return
	RButton & WheelDown::
		Send,^{Tab}
	return
#IfWinActive

;Windows Explorer
#IfWinActive,ahk_class CabinetWClass

	;新規Window作成
	RButton & MButton::Send,^{n}
	;上へ戻る
	RButton & LButton::Send,!{Up}

	XButton2 & WheelUp::Send,{XButton1}
	XButton2 & WheelDown::Send,{LButton}{Return}

	RButton & WheelUp::changeExplorerView(0)
	RButton & WheelDown::changeExplorerView(1)

	changeExplorerView(direction){
		static EXPLORER_VIEWMODE:=1

		;directionに応じて正負にローテート
		if direction = 1
			EXPLORER_VIEWMODE := EXPLORER_VIEWMODE + 1
		else
			EXPLORER_VIEWMODE := EXPLORER_VIEWMODE - 1

		;1~8の間に収まるように調整
		if EXPLORER_VIEWMODE > 8
			EXPLORER_VIEWMODE := 8
		if EXPLORER_VIEWMODE < 1
			EXPLORER_VIEWMODE := 1

		;バインド入力
		Send,^+{%EXPLORER_VIEWMODE%}
	}

	RButton & XButton2::Send,!{v}{n}{Return}

	;ショートカット作成
	vkEBsc07B & a::
	LControl & a::
		if CAPS() && LCMD()
			Send,{AppsKey}{UP}{UP}{UP}{UP}{Return}
		else
			mbind_a()
	return

	;表示
	vkEBsc07B & q::
	LControl & q::
		if CAPS() && LCMD(){
			Send,^{NumpadAdd}
		}else
			mbind_q()
	return

#IfWinActive
