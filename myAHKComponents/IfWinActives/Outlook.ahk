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


#IfWinActive