#IfWinActive,ahk_class rctrl_renwnd32

	;F1無効
	F1::return
	vkFFsc079 & 1::return
	LControl & 1::return

	;次の週に移動
	XButton2 & WheelDown::
		send,!{Down}
	return

	;前の週に移動
	XButton2 & WheelUp::
		send,!{Up}
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
			return
		}else{
			Send,!{F4}
		}
	return

	;進む、戻る
	XButton2::Send,^{y}
	XButton1::Send,^{z}

	;Shift押しZですすめるようにした
	RShift & z::
	LShift & z::
	vkEBsc07B & z::
		if SHIFT() && LCMD()
			Send,^{y}
		else
			mbind_z()
	return

	;(今日に移動)
	vkEBsc07B & t::
	LControl & t::
		if CAPS() && LCMD(){
			Send,!{h}{1}{o}{d}
		}else
			mbind_t()
	return

	;週の表示形式
	vkEBsc07B & q::
	LControl & q::
		if CAPS() && LCMD(){
			Send,!{v}{w}{1}
		}else
			mbind_q()
	return

	;グループスケジュールの表示形式
	vkEBsc07B & w::
	LControl & w::
		if CAPS() && LCMD(){
			Send,!{v}{r}
			Send,!{v}{s}{v}
		}else
			mbind_w()
	return

#IfWinActive