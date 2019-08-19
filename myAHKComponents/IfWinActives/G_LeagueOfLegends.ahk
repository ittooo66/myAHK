#IfWinActive,ahk_class RiotWindowClass

	;RButtonはRIOTに任せる的な意図のバインド（？）
	RButton::return
	;一部バインドのデフォルト化
	Space::Space
  ;SHOPを開くバインドの追加
	XButton1::Send,{p}

	;丸ごとバインド変更できなかったため、最下層バインドにて個別に書き換える。
	LControl & q::Send,^{q}
	LControl & w::Send,^{w}
	LControl & e::Send,^{e}
	LControl & r::Send,^{r}

  ;LWin系は直接定義(LWin & *)すると通常側がバグるので、LCMD()で検知して対処
  *q::
    if LCMD()
      Send,!{q}
    else
      mbind_q()
  return
  *w::
    if LCMD()
      Send,!{w}
    else
      mbind_w()
  return
  *e::
    if LCMD()
      Send,!{e}
    else
      mbind_e()
  return
  *r::
    if LCMD()
      Send,!{r}
    else
      mbind_r()
  return
  *1::
    if LCMD()
      Send,!{1}
    else
      mbind_1()
  return
  *2::
    if LCMD()
      Send,!{2}
    else
      mbind_2()
  return
  *3::
    if LCMD()
      Send,!{3}
    else
      mbind_3()
  return

#IfWinActive