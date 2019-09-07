;Excel
#IfWinActive,ahk_class XLMAIN

	;マウスバインド一式
	XButton2::Send,^{y}
	XButton1::Send,^{z}
	XButton2 & WheelUp::Excel_scrollRight()
	XButton2 & WheelDown::Excel_scrollLeft()
	XButton2 & LButton::Excel_intelliScroll()

	;Excelのスクロール機能
	Excel_intelliScroll(){
		;初期マウス位置の取得
		MouseGetPos, preMouseX, preMouseY
		while(GetKeyState("LButton","P")){
			;現在マウス位置の取得
			MouseGetPos, mouseX, mouseY
			;差分取得
			mouseDiffX :=mouseX-preMouseX
			mouseDiffY :=mouseY-preMouseY

			;スクロール分量値調整
			SetFormat, float, 0.0
			diffPointY := (mouseDiffY/30)
			SetFormat, float, 0.0
			diffPointX := (mouseDiffX/30)

			;abs変換
			absDiffPointY := diffPointY
			if(diffPointY<0)
				absDiffPointY := -diffPointY
			absDiffPointX := diffPointX
			if(diffPointX<0)
				absDiffPointX := -diffPointX

			;適用対象判定
			if(absDiffPointX > absDiffPointY ){
				;Count値、Stack用意
				sleepCount := 100/absDiffPointX
				sleepStack := 0

				;X方向適用
				while(absDiffPointX > 0){
					if(diffPointX>0)
						Excel_scrollRight()
					else
						Excel_scrollLeft()

					;スタック溜まったらSleep（１ミリSleepはまともに挙動しないので20程度見る）
					sleepStack +=sleepCount
					if(sleepStack > 20){
						sleep, %sleepCount%
						sleepStack := 0
					}

					absDiffPointX--
				}
			}else{
				;Count値、Stack用意
				sleepCount := 100/absDiffPointY
				sleepStack := 0

				;Y方向適用
				while(absDiffPointY > 0){
					if(diffPointY>0)
						send,{WheelUp}
					else
						send,{WheelDown}

					;スタック溜まったらSleep（１ミリSleepはまともに挙動しないので20程度見る）
					sleepStack +=sleepCount
					if(sleepStack > 20){
						sleep, %sleepCount%
						sleepStack := 0
					}

					absDiffPointY--
				}
			}
		}
	}

	Excel_scrollLeft(){
		try {
			ComObjActive("Excel.Application").ActiveWindow.SmallScroll(0,0,1,0)
		}catch e{
			;WindowのフォーカスをExcel以外に切り替えてExcelをROTに登録させる
			gui,Show
			gui,Destroy
		}
	}

	Excel_scrollRight(){
		try {
			ComObjActive("Excel.Application").ActiveWindow.SmallScroll(0,0,0,1)
		}catch e {
			;WindowのフォーカスをExcel以外に切り替えてExcelをROTに登録させる
			gui,Show
			gui,Destroy
		}
	}

	;App個別バインド 一式
	excel_bind_a(){
		Send, !{w}{m}{v}					;マクロ実行
	}
	excel_bind_b(){
		Send,!{h}{f}{n}!{k}{return}			;取り消し線
	}
	excel_bind_c(){
		
	}
	excel_bind_d(){
		Send, !{h}{h}						;セル背景色変更
	}
	excel_bind_e(){
		Send,!{h}{a}{c}						;中央寄せ
	}
	excel_bind_f(){
		
	}
	excel_bind_g(){
		Send,!{h}{m}{m}						;セル：結合
	}
	excel_bind_h(){
		Send,!{h}{b}{n}						;罫線：削除
	}
	excel_bind_i(){
		Send,!{h}{b}{p}						;罫線：上
	}
	excel_bind_j(){
		Send,!{h}{b}{l}						;罫線：左
	}
	excel_bind_k(){
		Send,!{h}{b}{o}						;罫線：下
	}
	excel_bind_l(){
		Send,!{h}{b}{r}						;罫線：右
	}
	excel_bind_m(){
		Send,!{h}{d}{s}						;タブ：削除
	}
	excel_bind_n(){
		Send,+{F11}							;タブ：新規
	}
	excel_bind_o(){
		Send,!{h}{b}{s}						;罫線：外枠
	}
	excel_bind_p(){
		
	}
	excel_bind_q(){
		Send,!{o}{c}{a}						;セル幅調整
	}
	excel_bind_r(){
		Send, !{h}{r}						;右寄せ
	}
	excel_bind_s(){
		
	}
	excel_bind_t(){
		Send, !{h}{f}{1}					;文字色変更（任意）
	}
	excel_bind_u(){
		Send,!{h}{b}{a}						;格子罫線
	}
	excel_bind_v(){
		Send,!{w}{f}{f}						;ウィンドウ枠の固定
	}
	excel_bind_w(){
		Send, !{h}{l}{1}					;左寄せ
	}
	excel_bind_x(){
		
	}
	excel_bind_y(){
		
	}
	excel_bind_z(){
		
	}
	excel_bind_1(){
		Send,^+{l}							;フィルタ有効化・無効化
	}
	excel_bind_2(){
		
	}
	excel_bind_3(){
		
	}
	excel_bind_4(){
		
	}
	excel_bind_5(){
		
	}
	excel_bind_6(){
		
	}
	excel_bind_7(){
		
	}
	excel_bind_8(){
		
	}
	excel_bind_9(){
		
	}
	excel_bind_0(){
		
	}
	excel_bind_minus(){
		
	}
	excel_bind_equal(){
		
	}
	excel_bind_backslash(){
		
	}
	excel_bind_semicolon(){
		
	}
	excel_bind_quote(){
		
	}
	excel_bind_period(){
		Send, !{h}{f}{g}					;セル内文字サイズ変更
	}
	excel_bind_camma(){
		Send, !{h}{f}{k}					;セル内文字サイズ変更
	}
	excel_bind_slash(){
		
	}
	excel_bind_bracket_left(){
		
	}
	excel_bind_bracket_right(){
		
	}
	excel_bind_backspace(){
		
	}
	excel_bind_delete(){
		
	}
	excel_bind_escape(){
		
	}

	;フック用定義
	*a::
	<^a::
	>^a::
	>+a::
	<+a::
	vkFFsc079 & a::
	vkEBsc07B & a::
	LControl & a::
	RControl & a::
	LShift & a::
	RShift & a::
		if LCMD() && CAPS()
			excel_bind_a()
		else
			mbind_a()
	return

	*b::
	<^b::
	>^b::
	>+b::
	<+b::
	vkFFsc079 & b::
	vkEBsc07B & b::
	LControl & b::
	RControl & b::
	LShift & b::
	RShift & b::
		if LCMD() && CAPS()
			excel_bind_b()
		else
			mbind_b()
	return

	*c::
	<^c::
	>^c::
	>+c::
	<+c::
	vkFFsc079 & c::
	vkEBsc07B & c::
	LControl & c::
	RControl & c::
	LShift & c::
	RShift & c::
		if LCMD() && CAPS()
			excel_bind_c()
		else
			mbind_c()
	return

	*d::
	<^d::
	>^d::
	>+d::
	<+d::
	vkFFsc079 & d::
	vkEBsc07B & d::
	LControl & d::
	RControl & d::
	LShift & d::
	RShift & d::
		if LCMD() && CAPS()
			excel_bind_d()
		else
			mbind_d()
	return

	*e::
	<^e::
	>^e::
	>+e::
	<+e::
	vkFFsc079 & e::
	vkEBsc07B & e::
	LControl & e::
	RControl & e::
	LShift & e::
	RShift & e::
		if LCMD() && CAPS()
			excel_bind_e()
		else
			mbind_e()
	return

	*f::
	<^f::
	>^f::
	>+f::
	<+f::
	vkFFsc079 & f::
	vkEBsc07B & f::
	LControl & f::
	RControl & f::
	LShift & f::
	RShift & f::
		if LCMD() && CAPS()
			excel_bind_f()
		else
			mbind_f()
	return

	*g::
	<^g::
	>^g::
	>+g::
	<+g::
	vkFFsc079 & g::
	vkEBsc07B & g::
	LControl & g::
	RControl & g::
	LShift & g::
	RShift & g::
		if LCMD() && CAPS()
			excel_bind_g()
		else
			mbind_g()
	return

	*h::
	<^h::
	>^h::
	>+h::
	<+h::
	vkFFsc079 & h::
	vkEBsc07B & h::
	LControl & h::
	RControl & h::
	LShift & h::
	RShift & h::
		if LCMD() && CAPS()
			excel_bind_h()
		else
			mbind_h()
	return

	*i::
	<^i::
	>^i::
	>+i::
	<+i::
	vkFFsc079 & i::
	vkEBsc07B & i::
	LControl & i::
	RControl & i::
	LShift & i::
	RShift & i::
		if LCMD() && CAPS()
			excel_bind_i()
		else
			mbind_i()
	return

	*j::
	<^j::
	>^j::
	>+j::
	<+j::
	vkFFsc079 & j::
	vkEBsc07B & j::
	LControl & j::
	RControl & j::
	LShift & j::
	RShift & j::
		if LCMD() && CAPS()
			excel_bind_j()
		else
			mbind_j()
	return

	*k::
	<^k::
	>^k::
	>+k::
	<+k::
	vkFFsc079 & k::
	vkEBsc07B & k::
	LControl & k::
	RControl & k::
	LShift & k::
	RShift & k::
		if LCMD() && CAPS()
			excel_bind_k()
		else
			mbind_k()
	return

	*l::
	<^l::
	>^l::
	>+l::
	<+l::
	vkFFsc079 & l::
	vkEBsc07B & l::
	LControl & l::
	RControl & l::
	LShift & l::
	RShift & l::
		if LCMD() && CAPS()
			excel_bind_l()
		else
			mbind_l()
	return

	*m::
	<^m::
	>^m::
	>+m::
	<+m::
	vkFFsc079 & m::
	vkEBsc07B & m::
	LControl & m::
	RControl & m::
	LShift & m::
	RShift & m::
		if LCMD() && CAPS()
			excel_bind_m()
		else
			mbind_m()
	return

	*n::
	<^n::
	>^n::
	>+n::
	<+n::
	vkFFsc079 & n::
	vkEBsc07B & n::
	LControl & n::
	RControl & n::
	LShift & n::
	RShift & n::
		if LCMD() && CAPS()
			excel_bind_n()
		else
			mbind_n()
	return

	*o::
	<^o::
	>^o::
	>+o::
	<+o::
	vkFFsc079 & o::
	vkEBsc07B & o::
	LControl & o::
	RControl & o::
	LShift & o::
	RShift & o::
		if LCMD() && CAPS()
			excel_bind_o()
		else
			mbind_o()
	return

	*p::
	<^p::
	>^p::
	>+p::
	<+p::
	vkFFsc079 & p::
	vkEBsc07B & p::
	LControl & p::
	RControl & p::
	LShift & p::
	RShift & p::
		if LCMD() && CAPS()
			excel_bind_p()
		else
			mbind_p()
	return

	*q::
	<^q::
	>^q::
	>+q::
	<+q::
	vkFFsc079 & q::
	vkEBsc07B & q::
	LControl & q::
	RControl & q::
	LShift & q::
	RShift & q::
		if LCMD() && CAPS()
			excel_bind_q()
		else
			mbind_q()
	return

	*r::
	<^r::
	>^r::
	>+r::
	<+r::
	vkFFsc079 & r::
	vkEBsc07B & r::
	LControl & r::
	RControl & r::
	LShift & r::
	RShift & r::
		if LCMD() && CAPS()
			excel_bind_r()
		else
			mbind_r()
	return

	*s::
	<^s::
	>^s::
	>+s::
	<+s::
	vkFFsc079 & s::
	vkEBsc07B & s::
	LControl & s::
	RControl & s::
	LShift & s::
	RShift & s::
		if LCMD() && CAPS()
			excel_bind_s()
		else
			mbind_s()
	return

	*t::
	<^t::
	>^t::
	>+t::
	<+t::
	vkFFsc079 & t::
	vkEBsc07B & t::
	LControl & t::
	RControl & t::
	LShift & t::
	RShift & t::
		if LCMD() && CAPS()
			excel_bind_t()
		else
			mbind_t()
	return

	*u::
	<^u::
	>^u::
	>+u::
	<+u::
	vkFFsc079 & u::
	vkEBsc07B & u::
	LControl & u::
	RControl & u::
	LShift & u::
	RShift & u::
		if LCMD() && CAPS()
			excel_bind_u()
		else
			mbind_u()
	return

	*v::
	<^v::
	>^v::
	>+v::
	<+v::
	vkFFsc079 & v::
	vkEBsc07B & v::
	LControl & v::
	RControl & v::
	LShift & v::
	RShift & v::
		if LCMD() && CAPS()
			excel_bind_v()
		else
			mbind_v()
	return

	*w::
	<^w::
	>^w::
	>+w::
	<+w::
	vkFFsc079 & w::
	vkEBsc07B & w::
	LControl & w::
	RControl & w::
	LShift & w::
	RShift & w::
		if LCMD() && CAPS()
			excel_bind_w()
		else
			mbind_w()
	return

	*x::
	<^x::
	>^x::
	>+x::
	<+x::
	vkFFsc079 & x::
	vkEBsc07B & x::
	LControl & x::
	RControl & x::
	LShift & x::
	RShift & x::
		if LCMD() && CAPS()
			excel_bind_x()
		else
			mbind_x()
	return

	*y::
	<^y::
	>^y::
	>+y::
	<+y::
	vkFFsc079 & y::
	vkEBsc07B & y::
	LControl & y::
	RControl & y::
	LShift & y::
	RShift & y::
		if LCMD() && CAPS()
			excel_bind_y()
		else
			mbind_y()
	return

	*z::
	<^z::
	>^z::
	>+z::
	<+z::
	vkFFsc079 & z::
	vkEBsc07B & z::
	LControl & z::
	RControl & z::
	LShift & z::
	RShift & z::
		if LCMD() && CAPS()
			excel_bind_z()
		else
			mbind_z()
	return

	*1::
	<^1::
	>^1::
	>+1::
	<+1::
	vkFFsc079 & 1::
	vkEBsc07B & 1::
	LControl & 1::
	RControl & 1::
	LShift & 1::
	RShift & 1::
		if LCMD() && CAPS()
			excel_bind_1()
		else
			mbind_1()
	return

	*2::
	<^2::
	>^2::
	>+2::
	<+2::
	vkFFsc079 & 2::
	vkEBsc07B & 2::
	LControl & 2::
	RControl & 2::
	LShift & 2::
	RShift & 2::
		if LCMD() && CAPS()
			excel_bind_2()
		else
			mbind_2()
	return

	*3::
	<^3::
	>^3::
	>+3::
	<+3::
	vkFFsc079 & 3::
	vkEBsc07B & 3::
	LControl & 3::
	RControl & 3::
	LShift & 3::
	RShift & 3::
		if LCMD() && CAPS()
			excel_bind_3()
		else
			mbind_3()
	return

	*4::
	<^4::
	>^4::
	>+4::
	<+4::
	vkFFsc079 & 4::
	vkEBsc07B & 4::
	LControl & 4::
	RControl & 4::
	LShift & 4::
	RShift & 4::
		if LCMD() && CAPS()
			excel_bind_4()
		else
			mbind_4()
	return

	*5::
	<^5::
	>^5::
	>+5::
	<+5::
	vkFFsc079 & 5::
	vkEBsc07B & 5::
	LControl & 5::
	RControl & 5::
	LShift & 5::
	RShift & 5::
		if LCMD() && CAPS()
			excel_bind_5()
		else
			mbind_5()
	return

	*6::
	<^6::
	>^6::
	>+6::
	<+6::
	vkFFsc079 & 6::
	vkEBsc07B & 6::
	LControl & 6::
	RControl & 6::
	LShift & 6::
	RShift & 6::
		if LCMD() && CAPS()
			excel_bind_6()
		else
			mbind_6()
	return

	*7::
	<^7::
	>^7::
	>+7::
	<+7::
	vkFFsc079 & 7::
	vkEBsc07B & 7::
	LControl & 7::
	RControl & 7::
	LShift & 7::
	RShift & 7::
		if LCMD() && CAPS()
			excel_bind_7()
		else
			mbind_7()
	return

	*8::
	<^8::
	>^8::
	>+8::
	<+8::
	vkFFsc079 & 8::
	vkEBsc07B & 8::
	LControl & 8::
	RControl & 8::
	LShift & 8::
	RShift & 8::
		if LCMD() && CAPS()
			excel_bind_8()
		else
			mbind_8()
	return

	*9::
	<^9::
	>^9::
	>+9::
	<+9::
	vkFFsc079 & 9::
	vkEBsc07B & 9::
	LControl & 9::
	RControl & 9::
	LShift & 9::
	RShift & 9::
		if LCMD() && CAPS()
			excel_bind_9()
		else
			mbind_9()
	return

	*0::
	<^0::
	>^0::
	>+0::
	<+0::
	vkFFsc079 & 0::
	vkEBsc07B & 0::
	LControl & 0::
	RControl & 0::
	LShift & 0::
	RShift & 0::
		if LCMD() && CAPS()
			excel_bind_0()
		else
			mbind_0()
	return

	*-::
	<^-::
	>^-::
	>+-::
	<+-::
	vkFFsc079 & -::
	vkEBsc07B & -::
	LControl & -::
	RControl & -::
	LShift & -::
	RShift & -::
		if LCMD() && CAPS()
			excel_bind_minus()
		else
			mbind_minus()
	return

	*=::
	<^=::
	>^=::
	>+=::
	<+=::
	>#=::
	<#=::
	vkFFsc079 & =::
	vkEBsc07B & =::
	LControl & =::
	RControl & =::
	LShift & =::
	RShift & =::
		if LCMD() && CAPS()
			excel_bind_equal()
		else
			mbind_equal()
	return

	*\::
	<^\::
	>^\::
	>+\::
	<+\::
	vkFFsc079 & \::
	vkEBsc07B & \::
	LControl & \::
	RControl & \::
	LShift & \::
	RShift & \::
		if LCMD() && CAPS()
			excel_bind_backslash()
		else
			mbind_backslash()
	return

	;エスケープシーケンス（`;）使用でのバインド
	*;::
	<^;::
	>^;::
	>+;::
	<+;::
	vkFFsc079 & `;::
	vkEBsc07B & `;::
	LControl & `;::
	RControl & `;::
	LShift & `;::
	RShift & `;::
		if LCMD() && CAPS()
			excel_bind_semicolon()
		else
			mbind_semicolon()
	return

	*'::
	<^'::
	>^'::
	>+'::
	<+'::
	vkFFsc079 & '::
	vkEBsc07B & '::
	LControl & '::
	RControl & '::
	LShift & '::
	RShift & '::
		if LCMD() && CAPS()
			excel_bind_quote()
		else
			mbind_quote()
	return

	*.::
	<^.::
	>^.::
	>+.::
	<+.::
	vkFFsc079 & .::
	vkEBsc07B & .::
	LControl & .::
	RControl & .::
	LShift & .::
	RShift & .::
		if LCMD() && CAPS()
			excel_bind_period()
		else
			mbind_period()
	return

	*,::
	<^,::
	>^,::
	>+,::
	<+,::
	vkFFsc079 & ,::
	vkEBsc07B & ,::
	LControl & ,::
	RControl & ,::
	LShift & ,::
	RShift & ,::
		if LCMD() && CAPS()
			excel_bind_camma()
		else
			mbind_camma()
	return

	*/::
	<^/::
	>^/::
	>+/::
	<+/::
	vkFFsc079 & /::
	vkEBsc07B & /::
	LControl & /::
	RControl & /::
	LShift & /::
	RShift & /::
		if LCMD() && CAPS()
			excel_bind_slash()
		else
			mbind_slash()
	return

	*[::
	<^[::
	>^[::
	>+[::
	<+[::
	vkFFsc079 & [::
	LControl & [::
	vkEBsc07B & [::
	RControl & [::
	RShift & [::
	LShift & [::
		if LCMD() && CAPS()
			excel_bind_bracket_left()
		else
			mbind_bracket_left()
	return

	*]::
	<^]::
	>^]::
	>+]::
	<+]::
	vkFFsc079 & ]::
	LControl & ]::
	vkEBsc07B & ]::
	RControl & ]::
	RShift & ]::
	LShift & ]::
		if LCMD() && CAPS()
			excel_bind_bracket_right()
		else
			mbind_bracket_right()
	return

	*BackSpace::
	<^BackSpace::
	>^BackSpace::
	>+BackSpace::
	<+BackSpace::
	vkFFsc079 & BackSpace::
	LControl & BackSpace::
	vkEBsc07B & BackSpace::
	RControl & BackSpace::
	RShift & BackSpace::
	LShift & BackSpace::
		if LCMD() && CAPS()
			excel_bind_backspace()
		else
			mbind_backspace()
	return

	*`::
	<^`::
	>^`::
	>+`::
	<+`::
	vkFFsc079 & `::
	LControl & `::
	vkEBsc07B & `::
	RControl & `::
	RShift & `::
	LShift & `::
		if LCMD() && CAPS()
			excel_bind_delete()
		else
			mbind_delete()
	return

	*Esc::
	<^Esc::
	>^Esc::
	>+Esc::
	<+Esc::
	vkFFsc079 & Esc::
	LControl & Esc::
	vkEBsc07B & Esc::
	RControl & Esc::
	RShift & Esc::
	LShift & Esc::
		if LCMD() && CAPS()
			excel_bind_escape()
		else
			mbind_escape()
	return

#IfWinActive
