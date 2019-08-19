#IfWinActive,ahk_class RiotWindowClass

  ;デフォルト化
  RButton::RButton
  Space::Space
  LControl::LControl
  LShift::LShift

  ;LWinを丸ごとバインド変更できなかったため、Windowsキー＋αバインドを以下で定義。
  LWin & q::Send,!{q}
  LWin & w::Send,!{w}
  LWin & e::Send,!{e}
  LWin & r::Send,!{r}
  LWin & d::Send,!{d}
  LWin & f::Send,!{f}
  LWin & 1::Send,!{1}
  LWin & 2::Send,!{2}
  LWin & 3::Send,!{3}
  LWin & 4::Send,!{4}
  LWin & 5::Send,!{5}
  LWin & 6::Send,!{6}

  ;SHOPを開くバインドの追加
  XButton1::Send,{p}

#IfWinActive
