;Windowsキーを潰すためのAHK
;LWinはCtrl動作を想定
RShift & RWin::Return
RWin & RShift::Return
LWin & WheelUp::Send,^{WheelUp}
LWin & WheelDown::Send,^{WheelDown}
LWin & XButton1::Send,^{XButton1}
LWin & XButton2::Send,^{XButton}
RWin & LWin::Return
LWin & RWin::Return
*LWin::Return
*RWin::Return
RWin::Return
LWin::Return
