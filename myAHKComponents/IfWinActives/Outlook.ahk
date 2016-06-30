#IfWinActive,ahk_class rctrl_renwnd32

;MailCheckUsecase

;メールをそのままにして次へ
LControl & s::
vkEBsc07B & s::
	if CAPS() & LCMD()
		send,^{>}
	else
		mbind_s()
return

;メールをDoneして次へ
LControl & d::
vkEBsc07B & d::
	if CAPS() & LCMD(){
		send,^+{1}
		send,{return}
	}else
		mbind_d()
return

;メールをリマインドフォルダへ
LControl & f::
vkEBsc07B & f::
	if CAPS() & LCMD(){
		send,^+{2}
		send,{return}
	}else
		mbind_f()
return



#IfWinActive