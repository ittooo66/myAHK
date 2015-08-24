;AutoHotKey for SteelSeries Xai
;LastUpdate 2009/11/16
;http://neue.cc/
;MEMO
;修飾キー: ^ Ctrl , ! Alt , + Shift , # Win
;改行は`r , 変数利用時は%hoge%
;Xaiの右手前をPause、右奥をScrollLockとする
;左手前はXButton1、奥はXButton2
;CenterはCtrlとし、Ctrl＋左右手前をアプリ固有キーとする

;Test用
;F5::Reload

;環境依存固定変数
GyazoPath = "C:\Program Files (x86)\Gyazo\gyazowin.exe"
IrfanViewPath = "C:\Program Files (x86)\IrfanView\i_view32.exe"

;-------------------------------------------
;関数
;-------------------------------------------

;文字列貼り付け用関数
HotString(msg)
{
	bk=%ClipboardAll%
	Clipboard=%msg%
	Send,^v
	Clipboard=%bk%
}

;文字列挟み込み用関数
SandString(start,end)
{
	bk=%ClipboardAll%
	Clipboard=
	Send,^c
	if(Clipboard!="")
		Clipboard = %start%%clipboard%%end%
	else
		Clipboard = %start%%end%
	Send,^v
	Clipboard=%bk%
}

;クリップボードの中身で文字列挟み込み用関数
ClipSandString(start,end)
{
	bk=%ClipboardAll%
	Clipboard = %start%%clipboard%%end%
	Send,^v
	Clipboard=%bk%
}

;選択したテキスト内容でぐぐる・ローカルディレクトリの時はエクスプローラ起動
SearchSelectedText()
{
	bk=%ClipboardAll%
	Clipboard=
	Send,^c
    ClipWait, 1
    SplitPath, Clipboard, name, dir, ext, noext, drive
    IfInString,drive,ttp://
        IfInString,drive,h
            Run,%Clipboard%
        else
            Run,h%Clipboard%
    else If(drive!="")
        Run,%dir%
    else if(Clipboard!="")
        Run,http://www.google.com/search?q=%Clipboard%
    Clipboard=%bk%
}

;一行コピーもどき
LineCopy()
{
	Clipboard=
	Send,^c
	if(Clipboard="")
	{
		Send,{End}+{Home}
		Send,^c{Left}
	}
}

;Window移動用関数
MoveWindow(xStep,yStep)
{
	WinGetPos,X,Y,,,A
	X:=X+xStep
	Y:=Y+yStep
	WinMove A,,X,Y
}

; 指定番号のモニタサイズを取得する
GetMonitor(monitorNo, ByRef mX, ByRef mY, ByRef mW, ByRef mH)
{
    SysGet, m, MonitorWorkArea, %monitorNo%
    mX := mLeft
    mY := mTop
    mW := mRight - mLeft
    mH := mBottom - mTop
}

; アクティブウィンドウの左上座標が含まれるモニタを取得する
GetActiveMonitor(ByRef mX, ByRef mY, ByRef mW, ByRef mH)
{
    WinGet, activeWindowID, ID, A
    WinGetPos, x, y, w, h, ahk_id %activeWindowID%
    SysGet,monitorCount,MonitorCount
    Loop, %monitorCount%
    {
        SysGet, m, MonitorWorkArea, %a_index%
        if (mLeft <= x && x < mRight && mTop <= y && y < mBottom)
        {
            mX := mLeft
            mY := mTop
            mW := mRight - mLeft
            mH := mBottom - mTop
            return
        }
    }
}

;対象モニタにアクティブウィンドウを移動する(高さリサイズ)
SendToTargetMonitor(monitorNo)
{
    WinGetPos, x, y, w, h, A
    GetMonitor(monitorNo, mX, mY, mW, mH)
    Random, rand, 50, 200
    WinMove, A,, mX + rand, mY, w, mH
}

;アクティブなアプリケーションと同一種類のウィンドウを水平垂直に並べる(最大4枚まで)
TileMove()
{
    GetActiveMonitor(mX, mY, mW, mH)
    WinGet, activeWindowID, ID, A
    WinGetClass, activeWindowClass, ahk_id %activeWindowID%
    WinGet, id, list, ahk_class %activeWindowClass%
    Loop, %id%
    {
        w := mW / 2
        h := (id > 2) ? mH / 2 : mH
        x := (Mod(a_index, 2) == 1) ? mX : mX + w
        y := (a_index <= 2) ? mY : mY + h

        StringTrimRight, this_id, id%a_index%, 0
        WinActivate, ahk_id %this_id%
        WinWaitActive, ahk_id %this_id%
        WinMove, ahk_id %this_id%,,x, y, w, h
    }
}

;全てのアプリケーションを元に戻す
RestoreAll()
{
    WinGet, id, list
    Loop, %id%
    {
        StringTrimRight, this_id, id%a_index%, 0
        WinRestore, ahk_id %this_id%
    }
}

;-------------------------------------------
;マウス
;-------------------------------------------

MButton::Shift
;左手前
XButton1::BackSpace
;左奥
XButton2::Send,!{F4}
+XButton2::Send,^!{F4}
;右手前
Pause::SearchSelectedText()
;右奥
ScrollLock::WinMinimize, A
+ScrollLock::WinSet,AlwaysOnTop,TOGGLE,A

;-------------------------------------------
;キーボード
;-------------------------------------------

;無変換
;十字キーゾーン
vk1Dsc07B & e::Send,{Up}
vk1Dsc07B & s::Send,{Left}
vk1Dsc07B & d::Send,{Down}
vk1Dsc07B & f::Send,{Right}
vk1Dsc07B & w::Send,{PgUp}
vk1Dsc07B & r::Send,{PgDn}
vk1Dsc07B & q::Send,{Home}
vk1Dsc07B & a::Send,{End}
vk1Dsc07B & t::Send,^{Home}
vk1Dsc07B & g::Send,^{End}
vk1Dsc07B & z::Send,^{Left}
vk1Dsc07B & c::Send,^{Right}
vk1Dsc07B & x::Send,{End}+{Home}
vk1Dsc07B & v::Send,{End}{Enter}
vk1Dsc07B & b::Send,{Up}{End}{Enter}
vk1Dsc07B & Tab::TileMove()
;矢印キー(マルチディスプレイでのウィンドウ移動)
vk1Dsc07B & Left::SendToTargetMonitor(3)
vk1Dsc07B & Right::SendToTargetMonitor(1)
vk1Dsc07B & Up::SendToTargetMonitor(4)
vk1Dsc07B & Down::SendToTargetMonitor(2)

;変換
vk1Csc079 & a::SandString("<a href="""">","</a>")
vk1Csc079 & c::SandString("<pre lang=""csharp"">`r","`r</pre>")
vk1Csc079 & j::SandString("<pre lang=""javascript"">`r","`r</pre>")
vk1Csc079 & f::SandString("<pre lang=""fsharp"">`r","`r</pre>")
vk1Csc079 & Left::MoveWindow(-100,0)
vk1Csc079 & Right::MoveWindow(100,0)
vk1Csc079 & Up::MoveWindow(0,-100)
vk1Csc079 & Down::MoveWindow(0,100)

;Windowsキー
;アクティブモニタの半分サイズにして左右に寄せる
#Left::
    GetActiveMonitor(x, y, w, h)
    WinGet, id, ID, A
    WinMove, ahk_id %id%,,x, y, w / 2 , h
    return
#Right::
    GetActiveMonitor(x, y, w, h)
    WinGet, id, ID, A
    WinMove, ahk_id %id%,,x + w / 2, y, w / 2 , h
    return
;最小化と復元
#Up::RestoreAll()
#Down::#d

;Insert
Ins::
    Send,!{PrintScreen}
    ClipWait, 1, 1
    Run,%IrfanViewPath% /clippaste
    return
^Ins::Run, %GyazoPath%

;Applicationキー
AppsKey & c::Run,calc.exe
AppsKey & d::Run,cmd.exe
AppsKey & n::Run,notepad.exe

;-------------------------------------------
;アプリケーション固有設定
;-------------------------------------------

;付箋紙
#IfWinActive, ahk_class THUSENSHI
F1::WinMove, A,,,,480,45

; Firefox
#IfWinActive,ahk_class MozillaUIWindowClass
XButton2::Send,^w
^XButton2::Send,!{F4}
+XButton1::Send,^{Left} ;タブを左に移動(Firefox側でキーカスタマイズ済み)
+Pause::Send,^{Right}

;Notepad++
#IfWinActive,ahk_class Notepad++
F5::Reload ;AutoHotKeyのスクリプト更新
^Left::Send,^+{Tab}
^Right::Send,^{Tab}
^c:: LineCopy()

;DOS窓
#IfWinActive,ahk_class ConsoleWindowClass
^v::ControlSend,,%clipboard%

;Visual Studio
#IfWinActive,ahk_class wndclass_desked_gsk
^w::Send,^{F4} ;タブを閉じる
XButton2::Send,^{F4}
+XButton2::Send,!{F4}
+XButton1::Send,^- ;定義から戻る
+Pause::Send,{F12} ;定義へ移動

;変換
vk1Csc079 & c::
	HotString("/// <summary></summary>")
	Loop,10
        Send,{Left}
	return
