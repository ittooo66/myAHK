Menu, Tray, Icon, C:\Riot Games\League of Legends\lolbind_r.ico, 1

;UACに注意、LoL等の管理者権限で動くAppに当てる時は管理者権限で起動すること
#IfWinActive,ahk_class RiotWindowClass
    ;（レジストリでのRctrlバインドをAHK経由でCtrlにして流す）
    ;治らんかったら再起動！
    RControl::Ctrl
    LControl::Alt
#IfWinActive

Ralt & /::Reload
`::Escape