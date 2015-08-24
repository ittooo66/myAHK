;右ボタン &
RButton & WheelUp::Send,^{PgUp}
RButton & WheelDown::Send,^{PgDn}
RButton & XButton1::Send,^{w}
RButton & XButton2::Send,^+{t}
RButton & LButton::Send,!{p}
RButton & MButton::Send,{Alt down}{d}{Return}{Alt up}

;左横ボタン &
XButton1 & WheelUp::ShiftAltTab
XButton1 & WheelDown::AltTab
XButton1 & MButton::Suspend
XButton1 & RButton::Send,{}
XButton1 & LButton::Send,^{1}
XButton1 & Xbutton2::Send,!+{9}

;右横ボタン &
XButton2 & WheelUp::Send,{WheelLeft}
XButton2 & WheelDown::Send,{WheelRight}
;ホイールクリックのスクロール（Chromeで一番良く機能）
XButton2 & LButton::
    Send,{MButton}
    While (GetKeyState("LButton", "P") && GetKeyState("Xbutton2","P"))
        Sleep, 10
    Send,{MButton}
Return
XButton2 & MButton::Send,{}
XButton2 & RButton::Send,{}
XButton2 & XButton1::Send,!+{9}

;Default
RButton::Send,{RButton}
XButton2::Send,{XButton2}
XButton1::Send,{XButton1}
MButton::!+0

;キーボードマウスエミュレーション
RAlt & q::Send,{WheelUp}
RAlt & a::Send,{WheelDown}
RAlt & w::Send,{LButton}
RAlt & r::Send,{RButton}
RAlt & e::
RAlt & s::
RAlt & d::
RAlt & f::
    While (GetKeyState("RAlt", "P")){
        val := 40
        if GetKeyState("LShift","P")
            val := 5
        else if GetKeyState("Ctrl","P")
            val := 1

        MoveX := 0, MoveY := 0
        MoveY += GetKeyState("e", "P") ? -val : 0
        MoveX += GetKeyState("s", "P") ? -val : 0
        MoveY += GetKeyState("d", "P") ? val : 0
        MoveX += GetKeyState("f", "P") ? val : 0
        MouseMove, %MoveX%, %MoveY%, 1, R
        Sleep, 10
    }
Return
