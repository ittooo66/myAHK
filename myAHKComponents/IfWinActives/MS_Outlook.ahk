#IfWinActive,ahk_class rctrl_renwnd32

	XButton2 & WheelDown::send,!{Down}						;次の週に移動
	XButton2 & WheelUp::send,!{Up}							;前の週に移動
	RButton & LButton::										;メールをDoneして次へ
		send,^+{1}
		sleep,200
		send,{return}
	return
	RButton & XButton2::									;メールをDoingして次へ
		send,^+{2}
		sleep,200
		send,{return}
	return
	RButton & XButton1::									;メールを閉じる
		WinGetTitle, Title, A
		IfInString, Title, Outlook , {
			;Outlookのコア(メールと予定表)では無効
			return
		}else{
			Send,!{F4}
		}
	return

	outlook_bind_t(){										;今日に移動
		Send,!{h}{1}{o}{d}
	}
	outlook_bind_q(){										;週の表示形式
		Send,!{v}{w}{1}
	}
	outlook_bind_w(){										;グループスケジュールの表示形式
		Send,!{v}{r}
			Send,!{v}{s}{v}
	}

#IfWinActive