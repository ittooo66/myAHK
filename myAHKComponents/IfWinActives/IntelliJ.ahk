#IfWinActive,ahk_class SunAwtFrame
  ;タブ切り替え
  RButton & WheelUp::Send,!{Left}
  RButton & WheelDown::Send,!{Right}
  LControl & Tab::
    if SHIFT()
      Send,!{Left}
    else
      Send,!{Right}
  return
  LControl & s::
    if LCMD()
      Send,!{Left}
    else
      mbind_s()
  return
  LControl & f::
    if LCMD()
      Send,!{Right}
    else
      mbind_f()
  return

  ;タブ開閉
  RButton & XButton1::
  LWin & w::
    Send,^{F4}
  return
  RButton & XButton2::Send,^+{F11} ;非純正：Reopen Closed Tabに要追加
  LShift & t::
  LWin & t::
    if SHIFT() && LCMD()
      Send,^+{F11}
    else
      mbind_t()
  return

  ;Refactor
  LControl & r::
  LWin & r::
    if CTRL() && LCMD()
      Send,^!+{t}
    else
      mbind_r()
  Return

  ;横スクロール
  XButton2 & ~WheelUp::
    Send,{WheelDown}
    sidescroll_on_intellij()
  return
  XButton2 & ~WheelDown::
    Send,{WheelUp}
    sidescroll_on_intellij()
  return
  sidescroll_on_intellij(){
    Send,{Shift Down}
    While (GetKeyState("XButton2", "P")){
      ;サイドボタンとShiftの押し下げを連動
      ;Wheelはチルダで活かしてShift+Wheelを入力
      sleep,100
    }
    Send,{Shift Up}
  }

  ;実行
  LControl & e::
  LWin & e::
    if CTRL() && LCMD()
      Send,+{F10}
    else
      mbind_e()
  return

  ;javadoc表示
  LControl & q::
  LWin & q::
    if CTRL() && LCMD()
      Send,^{q}
    else
      mbind_q()
  return

  ;フォーマッタ
  LControl & a::
  LWin & a::
    if CTRL() && LCMD()
      Send,^!{l}
    Else
      mbind_a()
  return

  ;intelliScroll
  XButton2 & LButton::intelliScroll()

#IfWinActive
