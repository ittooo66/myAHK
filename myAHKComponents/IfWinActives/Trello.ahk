;Trello
#IfWinActive,ahk_exe Trello.exe

;カード移動(左)
vkEBsc07B & s::
LControl & s::
  if CAPS() && LCMD()
    Send,+{,}
  else
    mbind_s()
return

;カード移動(右)
vkEBsc07B & f::
LControl & f::
  if CAPS() && LCMD()
    Send,+{.}
  else
    mbind_f()
return

#IfWinActive
