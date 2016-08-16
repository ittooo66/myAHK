;アイコン
Menu, Tray, Icon, %A_ScriptDir%\CSGO.ico, 1

;UACに注意、LoL等の管理者権限で動くAppに当てる時は管理者権限で起動すること
#IfWinActive,ahk_class Valve001
    XButton1::XButton1
    XButton2::XButton2
#IfWinActive
