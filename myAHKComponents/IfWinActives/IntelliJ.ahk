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
  return

  ;Rename
  RControl & r::
    if GetKeyState("LControl","")
      Send,+{F6}
  Return



#IfWinActive
