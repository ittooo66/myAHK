;Default
RButton::Send,{RButton}
XButton2::Send,{XButton2}
XButton1::Send,{XButton1}
;Window catalog(need Dexpot)
MButton::!+0

;ウィンドウ変更
XButton1 & WheelUp::ShiftAltTab
XButton1 & WheelDown::AltTab
;横スクロール
XButton2 & WheelUp::Send,{WheelLeft}
XButton2 & WheelDown::Send,{WheelRight}
;ウィンドウ選択画面(need Dexpot)
XButton1 & Xbutton2::Send,!+{9}
XButton2 & XButton1::Send,!+{9}
;Reload/Suspend bindings(for gaming)
XButton1 & MButton::Suspend
XButton2 & MButton::Reload


;Chrome系（タブ持ちApp系）でよく機能するバインド
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
;ホイールクリック
XButton2 & LButton::Send,{MButton}

;未定s
XButton1 & RButton::Send,{}
XButton2 & RButton::Send,{}
XButton1 & LButton::Send,{}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;キーボードマウスエミュレーション
RAlt & q::Send,{WheelUp}
RAlt & t::Send,{WheelDown}
RAlt & w::Send,{LButton}
RAlt & r::Send,{RButton}
RAlt & e::
RAlt & s::
RAlt & d::
RAlt & f::
    mousemove()
return
