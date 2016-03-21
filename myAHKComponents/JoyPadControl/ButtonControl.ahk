;AButton
Joy1::
;BButton
Joy2::
;XButton
Joy4::
;YButton
Joy5::
;L1Button(XButton1)
joy7IsUsed := false
Joy7::
	global joy7IsUsed
	joy7IsUsed := false
	KeyWait Joy7
	if(!joy7IsUsed){
		Send,{XButton1}
	}
return
;R1Button
Joy8::
	Send,{XButton2}
return
;L2Button
Joy9::
	if GetKeyState("Joy10","P")
		Send,!{p}
	else if GetKeyState("Joy7","P")
		Run, "C:\Users\AHK\Dropbox\Entrance"
	else{
		Send,{LButton Down}
		KeyWait Joy9
		Send,{LButton Up}
	}
return

;R2Button
joy10IsUsed := false
Joy10::
	global joy10IsUsed
	joy10IsUsed := false
	KeyWait Joy10
	if(!joy10IsUsed){
		Click, Right
	}
return
;Joy10 & Joy9::Send,!{p}
