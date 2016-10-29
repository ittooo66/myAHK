#IfWinActive,ahk_class rctrl_renwnd32

	;次のメールへ
	RButton & WheelDown::
		send,^{>}
	return

	;前のメールへ
	RButton & WheelUp::
		send,^{<}
	return

	;メールをDoneして次へ
	RButton & LButton::
		send,^+{1}
		sleep,200
		send,{return}
	return

	;メールをDoingして次へ
	RButton & XButton2::
		send,^+{2}
		sleep,200
		send,{return}
	return

	;メールを閉じる
	RButton & XButton1::
		WinGetTitle, Title, A
		IfInString, Title, Outlook , {
			;Outlookのコア(メールと予定表)では無効
		}else{
			Send,!{F4}
		}
	return

	;進む、戻る
	XButton2::Send,^{y}
	XButton1::Send,^{z}

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
	;Shift押しZですすめるようにした
	RShift & z::
	LShift & z::
	vkEBsc07B & z::
		if SHIFT() && LCMD()
			Send,^{y}
		else
			mbind_z()
	return

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

#IfWinActive