; マウスカーソル位置の各種情報をクリップボードに取得する(WindowsSpyの代替)

; todo: マウスカーソルが重なったら、他の場所にウィンドウを逃がす

; マウスカーソル位置の各種情報を取得(座標＝アクティブウィンドウからの相対位置)
GetInfoAtMousePosEx(ByRef X, ByRef Y, ByRef WinHWND, ByRef ControlHWND, ByRef ControlClassNN, ByRef WinTitle, ByRef ControlText, ByRef ClassName, ByRef ProcessName)
{
  WM_NCHITTEST=0x84
  ERROR=-1

  ; Get ControlHWND
  MouseGetPos,X,Y,WinHWND,ControlHWND,3
  lParam := (Y << 16) | X
  SendMessage,%WM_NCHITTEST%,0,%lParam%,, ahk_id %ControlHWND%
  IfEqual, ErrorLevel,%ERROR%
    MouseGetPos,,,,ControlHWND,2

  ; Get othe info.
  MouseGetPos,,,,ControlClassNN
  ControlGetText, ControlText, , ahk_id %ControlHWND%
  WinGetClass, ClassName, ahk_id %WinHWND%
  WinGetTitle, WinTitle, ahk_id %WinHWND%

  WinGet, ProcessName, ProcessName, ahk_id %WinHWND%

  return True
}

; --- show form
CustomColor = 0x404040  ; RGB

Gui, Color, %CustomColor%
Gui, Font, s11 cWhite

;cRed=赤、テキストがその後
Gui, Add, Text, cRed , [ESC] : Close
Gui, Add, Text, cRed , [WIN]+[SHIFT]+[C] : Copy Information to clipboard


Gui, Add, Text, cLime xm+0, ProcessName:

Gui, Add, Text, vMyProcessName x+4 w400,

Gui, Add, Text, cLime xm+0, Position:
Gui, Add, Text, vMyPosition x+4 w400,

Gui, Add, Text, cLime xm+0, ProcessID:
Gui, Add, Text, vMyPID x+4 w400,

Gui, Add, Text, cLime xm+0, WinTitle:
Gui, Add, Text, vMyWinTitle x+4 w400,

Gui, Add, Text, cLime xm+0, ClassName:
Gui, Add, Text, vMyClassName x+4 w400,

Gui, Add, Text, cYellow xm+0, ControlName:
Gui, Add, Text, vMyControlName x+4 w400,

Gui, Add, Text, cYellow xm+0, ControlHWND:
Gui, Add, Text, vMyControlHWND x+4 w400,

Gui, Add, Text, cYellow xm+0, ControlText:
Gui, Add, Text, vMyControlText x+4 w400 r2,

;常に最前面に表示（+AlwaysOnTop）
;Gui +AlwaysOnTop

;半透明？
Gui +LastFound
Opacity=210
Winset, Transparent, %Opacity%
;ウィンドウ縁を削除、半透明処理のあとにすること？
Gui, -Caption

;ジャンプ命令。えっぐ。
Gosub, UpdateInfo

;GUI表示（x,y）
;Gui, Show, XCenter YCenter
Gui, Show, x10 y10

Menu, RightClickMenu, Add, Sample Code: Click Control, MakeSnippetControlClick
Menu, RightClickMenu, Add, Sample Code: Click Position, MakeSnippetClickPosition
Menu, RightClickMenu, Add, Sample Code: Wait Window, MakeSnippetWinWait
Menu, RightClickMenu, Add, Sample Code: Send Keys to Control , MakeSnippetControlSend
Menu, RightClickMenu, Add, Sample Code: Check (Radio Button or CheckBox), MakeSnippetCheckButton
Menu, RightClickMenu, Add, Sample Code: UnCheck (Radio Button or CheckBox), MakeSnippetUnCheckButton
Menu, RightClickMenu, Add, Copy All Information, CopyAllInformation

SetTimer, UpdateInfo, 250
return

; --- Event Handler

UpdateInfo:
  GetInfoAtMousePosEx(_MouseX, _MouseY, _WinHWND, _ControlHWND, _ControlClassNN, _WinTitle, _ControlText, _ClassName, _ProcessName)
  GuiControl,, MyPosition, X%_MouseX%, Y%_MouseY%
  GuiControl,, MyPID, %_WinHWND%
  GuiControl,, MyWinTitle, %_WinTitle%
  GuiControl,, MyControlName, %_ControlClassNN%
  GuiControl,, MyControlText, %_ControlText%
  GuiControl,, MyClassName, %_ClassName%
  GuiControl,, MyControlHWND, %_ControlHWND%
  GuiControl,, MyProcessName, %_ProcessName%
return


;Esc入力時に飛んで来るラベル
GuiEscape:
;Close処理時に飛んで来るラベル
GuiClose:
  ExitApp



; --- WIN+SHIFT+C で、カーソル位置の情報を取得する
GuiContextMenu:

#+c::
  GetInfoAtMousePosEx(MouseX, MouseY, WinHWND, ControlHWND, ControlClassNN, WinTitle, ControlText, ClassName, ProcessName)
  Menu, RightClickMenu, Show
return

MakeSnippetCheckButton:
  Clipboard=
(
  Control, Check, , %ControlClassNN%, %WinTitle% ahk_class %ClassName%
)
  TrayTip, クリップボードにコピーしました, %Clipboard%
  return

MakeSnippetUnCheckButton:
  Clipboard=
(
  Control, UnCheck, , %ControlClassNN%, %WinTitle% ahk_class %ClassName%
)
  TrayTip, クリップボードにコピーしました, %Clipboard%
  return

MakeSnippetWinWait:
  Clipboard=
(
  WinWait, %WinTitle% ahk_class %ClassName%
)
  TrayTip, クリップボードにコピーしました, %Clipboard%
  return

MakeSnippetControlClick:
  Clipboard=
(
  ControlClick, %ControlClassNN%, %WinTitle% ahk_class %ClassName%
)
  TrayTip, クリップボードにコピーしました, %Clipboard%
  return

MakeSnippetClickPosition:
  Clipboard=
(
  ControlClick, x%MouseX% y%MouseY%, %WinTitle% ahk_class %ClassName%
)
  TrayTip, クリップボードにコピーしました, %Clipboard%
  return

MakeSnippetControlSend:
  Clipboard=
(
  ControlSend, %ControlClassNN%, {Space}, %WinTitle% ahk_class %ClassName%
)
  TrayTip, クリップボードにコピーしました, %Clipboard%
  return

CopyAllInformation:
  Clipboard=
(
  Text= (X%MouseX%, Y%MouseY%)
  PID= %WinHWND%
  WinTitle= %WinTitle%
  ControlName= %ControlClassNN%
  ControlText= %ControlText%
  ClassName= %ClassName%
  ControlHWND= %ControlHWND%
  ProcessName= %ProcessName%
)
  TrayTip, クリップボードにコピーしました, %Clipboard%
  return
