;アイコン
Menu, Tray, Icon, C:\Users\AHK\Dropbox\bcd\AHK\GamingAHK\CSGO.ico, 1

;UACに注意、LoL等の管理者権限で動くAppに当てる時は管理者権限で起動すること
#IfWinActive,ahk_class Valve001
    RControl::Ctrl
    LControl::Alt
    LControl & Space::Send,!{``}

    XButton2 & WheelUp::Send,{3}
    XButton2 & WheelDown::Send,{4}

    XButton1::Send,{5}
    XButton1 & LButton::Send,{6}
    XButton1 & WheelUp::Send,{7}
    XButton1 & WheelDown::Send,{8}
    XButton1 & RButton::Send,{9}
    XButton1 & XButton2::Send,{0}
#IfWinActive
