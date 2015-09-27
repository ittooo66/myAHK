#IfWinActive,ahk_class SunAwtFrame
  RButton & WheelUp::
  RButton & WheelDown::!{Right}

  RControl & Tab::
    if GetKeyState("LShift","P")
      Send,!{Left}
    else
      Send,!{Right}


#IfWinActive
