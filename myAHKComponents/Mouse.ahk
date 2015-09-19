;Default
RButton::Send,{RButton}
XButton2::Send,{XButton2}
XButton1::Send,{XButton1}
MButton::!+0

;ウィンドウ変更
XButton1 & WheelUp::ShiftAltTab
XButton1 & WheelDown::AltTab
;横スクロール
XButton2 & WheelUp::Send,{WheelLeft}
XButton2 & WheelDown::Send,{WheelRight}

;ウィンドウ選択画面(by Dexpot)
XButton1 & Xbutton2::Send,!+{9}
XButton2 & XButton1::Send,!+{9}

;Reload/Suspend bindings(for gaming)
XButton1 & MButton::Suspend
XButton2 & MButton::Reload

;未定s
XButton1 & RButton::Send,{}
XButton2 & RButton::Send,{}
XButton1 & LButton::Send,^{1}

;タブ変更
RButton & WheelUp::Send,^{PgUp}
RButton & WheelDown::Send,^{PgDn}
;タブ消去
RButton & XButton1::Send,^{w}
;前に使ったタブ
RButton & XButton2::Send,^+{t}
;New tab
RButton & MButton::Send,^{t}
;Pin tab
RButton & LButton::Send,!{p}
;ホイールクリックのスクロール（Chromeで一番良く機能）
XButton2 & LButton::
    Send,{MButton}
    While (GetKeyState("LButton", "P") && GetKeyState("Xbutton2","P"))
        Sleep, 10
    Send,{MButton}
Return







;キーボードマウスエミュレーション
RAlt & q::Send,{WheelUp}
RAlt & a::Send,{WheelDown}
RAlt & w::Send,{LButton}
RAlt & r::Send,{RButton}
RAlt & e::
RAlt & s::
RAlt & d::
RAlt & f::
    val := 1
    slp := 10
    While (GetKeyState("RAlt", "P")){
        MoveX := 0, MoveY := 0
        MoveY += GetKeyState("e", "P") ? -val : 0
        MoveX += GetKeyState("s", "P") ? -val : 0
        MoveY += GetKeyState("d", "P") ? val : 0
        MoveX += GetKeyState("f", "P") ? val : 0
        MouseMove, %MoveX%, %MoveY%, 1, R
        Sleep, %slp%
        val++
        if( !GetKeyState("e", "P") && !GetKeyState("d", "P") && !GetKeyState("s", "P") && !GetKeyState("f", "P"))
            val := 1
    }
Return
