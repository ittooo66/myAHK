;アイコン
Menu, Tray, Icon, %A_ScriptDir%\icon\League of Legends.ico, 1

#IfWinActive,ahk_class RiotWindowClass
    ;以下の組み合わせでLCMD+W→Alt+Wを実現。
    ;要:セルフキャストスキル2にAlt+Nの追加
    LWin::LAlt
    !w::n
    XButton2::3
    XButton1::p
#IfWinActive
