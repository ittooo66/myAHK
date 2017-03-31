;=========================MBind.ahkに記載していたもの=========================

NippouMacro_makeNippou()


;===============outlook.ahk内部に記載していたもの===============

;予定表をICSで保存(日付指定あり)
vkEBsc07B & s::
LControl & s::
	if CAPS() && LCMD(){
		Outlook_icsInit("ICSWill.ics")

		;日時指定欄に移動
		Send,+{Tab}
		Send,{Down}{Down}{Down}{Down}{Down}
	}else
		mbind_s()
return

;予定表をICSで保存(今日)
vkEBsc07B & a::
LControl & a::
	if CAPS() && LCMD(){
		Outlook_icsInit("ICSWas.ics")
		Outlook_icsSave()
	}else
		mbind_a()
return

;予定表をICSで保存(明日)
vkEBsc07B & d::
LControl & d::
	if CAPS() && LCMD(){
		Outlook_icsInit("ICSWill.ics")

		;明日の予定に設定
		Send,+{Tab}
		Send,{Down}

		Outlook_icsSave()
	}else
		mbind_d()
return


;icsファイル保存方式の初期化
Outlook_icsInit(string){
	;ファイル名をつけて保存を開く
	Send,!{f}{c}
	sleep,600

	;ファイル名指定
	directInput(string)
	sleep,400

	;アドレスバーにデスクトップと入力
	Send,!{d}
	dir = %A_WorkingDir%\myAHKComponents\Resources\Nippou\Convert
	directInput(dir)
	Send,{return}
	sleep,400

	;その他のオプション
	Send,!{m}
	;予定表の詳細度を設定
	Send,{Tab}
	Send,{Down}
}

;icsファイル保存
Outlook_icsSave(){
	;その他のオプション_決定
	Send,!{o}

	;icsの保存
	Send,!{s}
	Send,!{y}
}


