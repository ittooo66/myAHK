;AButton
;Joy1::return
;BButton
;Joy2::return
;XButton
;Joy4::return
;YButton
;Joy5::return

;L1Button(XButton1)
Joy7::
	pressJoy7()
	KeyWait Joy7
	if(!joy7IsUsed){
		if GetKeyState("Joy8","P"){
			useJoy8()
			Send,#{Tab}
		}else if GetKeyState("Joy10","P"){
			useJoy10()
			Send,^{w}
		}else
			Send,{XButton1}
	}
return
;R1Button
Joy8::
	KeyWait Joy8
	if GetKeyState("Joy7","P"){
		useJoy7()
		Send,#{Tab}
	}else if GetKeyState("Joy10","P"){
		useJoy10()
		Send,^+{t}
	}else
		Send,{XButton2}
return
;L2Button
Joy9::
	if GetKeyState("Joy10","P"){
		useJoy10()
		Send,!{p}
	}else if GetKeyState("Joy7","P"){
		useJoy7()
		Run, "C:\Users\AHK\Dropbox\Entrance"
	}else{
		Send,{LButton Down}
		;KeyWaitだとThread固めるのでこっちで対処
		SetTimer, WaitforButtonUp9, 10
	}
return

WaitforButtonUp9:
	if GetKeyState("Joy9")
		return
	Send,{LButton Up}
	SetTimer, WaitforButtonUp9, off
return

;R2Button
Joy10::
	pressJoy10()
	KeyWait Joy10
	if(!joy10IsUsed){
		if GetKeyState("Joy8","P"){
			useJoy8()
			Send,{MButton Down}
			while(GetKeyState("Joy8","P")&&GetKeyState("Joy10","P")){
				sleep,30
			}
			Send,{MButton Up}
		}else if GetKeyState("Joy7","P"){
			useJoy7()
			Send,{RWin}
		}else
			Click, Right
	}
return

;R3Button
Joy15::
	pressJoy15()
	KeyWait Joy15
	if(!joy15IsUsed){
		if GetKeyState("Joy10","P"){
			useJoy10()
			Send,^{t}
		}else if GetKeyState("Joy8","P"){
			useJoy8()
			Reload
		}else{
			winD()
		}
	}
return

joy7IsUsed := false
useJoy7(){
	global joy7IsUsed
	joy7IsUsed := true
}
pressJoy7(){
	global joy7IsUsed
	joy7IsUsed := false
}
joy8IsUsed := false
useJoy8(){
	global joy8IsUsed
	joy8IsUsed := true
}
pressJoy8(){
	global joy8IsUsed
	joy8IsUsed := false
}
joy9IsUsed := false
useJoy9(){
	global joy9IsUsed
	joy9IsUsed := true
}
pressJoy9(){
	global joy9IsUsed
	joy9IsUsed := false
}
joy10IsUsed := false
useJoy10(){
	global joy10IsUsed
	joy10IsUsed := true
}
pressJoy10(){
	global joy10IsUsed
	joy10IsUsed := false
}
joy15IsUsed := false
useJoy15(){
	global joy15IsUsed
	joy15IsUsed := true
}
pressJoy15(){
	global joy15IsUsed
	joy15IsUsed := false
}
