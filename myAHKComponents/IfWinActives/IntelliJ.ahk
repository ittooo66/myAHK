#IfWinActive,ahk_class SunAwtFrame
  ;タブ切り替え
  RButton & WheelUp::Send,!{Left}
  RButton & WheelDown::Send,!{Right}
  RControl & Tab::
    if GetKeyState("LShift","P")
      Send,!{Left}
    else
      Send,!{Right}
  return
  RControl & s::
    if GetKeyState("LControl","P")
      Send,!{Left}
  return
  RControl & f::
    if GetKeyState("LControl","P")
      Send,!{Right}
  return

  ;タブ開閉
  RButton & XButton1::
  LControl & w::
    Send,^{F4}
  return
  RButton & XButton2::Send,^+{F11} ;非純正：Reopen Closed Tabに要追加
  LShift & t::
    if GetKeyState("LControl","P")
      Send,^+{F11}
    else
      mbind_t()
  return

  ;Rename
  RControl & r::
    if GetKeyState("LControl","")
      Send,+{F6}
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
  RControl & e::
    if GetKeyState("LControl","P")
      Send,+{F10}
    else
      mbind_e()
  return

#IfWinActive
