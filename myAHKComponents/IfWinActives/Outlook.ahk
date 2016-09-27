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


	;予定表をICSで保存
	vkEBsc07B & s::
	LControl & s::
		if CAPS() && LCMD(){
			;
			Send,!{f}{c}

			;アドレスバーにデスクトップと入力
			Send,!{d}
			directInput("デスクトップ")
			Send,{return}

			;予定表の詳細度を設定
			Send,!{m}
			Send,{Tab}
			Send,{Down}

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
			;
			Send,!{f}{c}

			;アドレスバーにデスクトップと入力
			Send,!{d}
			directInput("デスクトップ")
			Send,{return}

			;予定表の詳細度を設定
			Send,!{m}
			Send,{Tab}
			Send,{Down}

			;日時指定欄に移動
			Send,!{o}
			Send,!{s}
			Send,!{y}
		}else
			mbind_a()
	return

	;予定表をICSで保存(明日)
	vkEBsc07B & d::
	LControl & d::
		if CAPS() && LCMD(){
			;
			Send,!{f}{c}

			;アドレスバーにデスクトップと入力
			Send,!{d}
			directInput("デスクトップ")
			Send,{return}

			;その他のオプション
			Send,!{m}

			;明日の予定に設定
			Send,{Down}

			;予定表の詳細度を設定
			Send,{Tab}
			Send,{Down}

			;日時指定欄に移動
			Send,!{o}
			Send,!{s}
			Send,!{y}
		}else
			mbind_d()
	return

#IfWinActive