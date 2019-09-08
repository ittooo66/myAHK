; イベントフック定義
; Windowsの各イベントをフックしてイベントに応じた処理を実施するための定義一式。
; 処理内容はEventHook.ahkに記載
; returntが直接記載される前に呼んでおかないと機能しないので、上の方でincludeしておくこと。


; ######### イベント変数一式 定義 #########
EVENT_MIN                         = 0x00000001
EVENT_SYSTEM_SOUND                = 0x00000001
EVENT_SYSTEM_ALERT                = 0x00000002
EVENT_SYSTEM_FOREGROUND           = 0x00000003
EVENT_SYSTEM_MENUSTART            = 0x00000004
EVENT_SYSTEM_MENUEND              = 0x00000005
EVENT_SYSTEM_MENUPOPUPSTART       = 0x00000006
EVENT_SYSTEM_MENUPOPUPEND         = 0x00000007
EVENT_SYSTEM_CAPTURESTART         = 0x00000008
EVENT_SYSTEM_CAPTUREEND           = 0x00000009
EVENT_SYSTEM_MOVESIZESTART        = 0x0000000a
EVENT_SYSTEM_MOVESIZEEND          = 0x0000000b
EVENT_SYSTEM_CONTEXTHELPSTART     = 0x0000000c
EVENT_SYSTEM_CONTEXTHELPEND       = 0x0000000d
EVENT_SYSTEM_DRAGDROPSTART        = 0x0000000e
EVENT_SYSTEM_DRAGDROPEND          = 0x0000000f
EVENT_SYSTEM_DIALOGSTART          = 0x00000010
EVENT_SYSTEM_DIALOGEND            = 0x00000011
EVENT_SYSTEM_SCROLLINGSTART       = 0x00000012
EVENT_SYSTEM_SCROLLINGEND         = 0x00000013
EVENT_SYSTEM_SWITCHSTART          = 0x00000014
EVENT_SYSTEM_SWITCHEND            = 0x00000015
EVENT_SYSTEM_MINIMIZESTART        = 0x00000016
EVENT_SYSTEM_MINIMIZEEND          = 0x00000017
EVENT_OBJECT_CREATE               = 0x00008000
EVENT_OBJECT_DESTROY              = 0x00008001
EVENT_OBJECT_SHOW                 = 0x00008002
EVENT_OBJECT_HIDE                 = 0x00008003
EVENT_OBJECT_REORDER              = 0x00008004
EVENT_OBJECT_FOCUS                = 0x00008005
EVENT_OBJECT_SELECTION            = 0x00008006
EVENT_OBJECT_SELECTIONADD         = 0x00008007
EVENT_OBJECT_SELECTIONREMOVE      = 0x00008008
EVENT_OBJECT_SELECTIONWITHIN      = 0x00008009
EVENT_OBJECT_STATECHANGE          = 0x0000800a
EVENT_OBJECT_LOCATIONCHANGE       = 0x0000800b
EVENT_OBJECT_NAMECHANGE           = 0x0000800c
EVENT_OBJECT_DESCRIPTIONCHANGE    = 0x0000800d
EVENT_OBJECT_VALUECHANGE          = 0x0000800e
EVENT_OBJECT_PARENTCHANGE         = 0x0000800f
EVENT_OBJECT_HELPCHANGE           = 0x00008010
EVENT_OBJECT_DEFACTIONCHANGE      = 0x00008011
EVENT_OBJECT_ACCELERATORCHANGE    = 0x00008012
; XP or lator
EVENT_CONSOLE_CARET               = 0x00004001
EVENT_CONSOLE_CARET_SELECTION     = 0x00000001
EVENT_CONSOLE_CARET_VISIBLE       = 0x00000002
EVENT_CONSOLE_UPDATE_REGION       = 0x00004002
EVENT_CONSOLE_UPDATE_SIMPLE       = 0x00004003
EVENT_CONSOLE_UPDATE_SCROLL       = 0x00004004
EVENT_CONSOLE_LAYOUT              = 0x00004005
EVENT_CONSOLE_START_APPLICATION   = 0x00004006
EVENT_CONSOLE_APPLICATION_16BIT   = 0x00000001
EVENT_CONSOLE_END_APPLICATION     = 0x00004007
EVENT_MAX                         = 0x7fffffff
; Vista or lator
EVENT_SYSTEM_DESKTOPSWITCH        = 0x00000020
EVENT_OBJECT_INVOKED              = 0x00008013
EVENT_OBJECT_TEXTSELECTIONCHANGED = 0x00008014
EVENT_OBJECT_CONTENTSCROLLED      = 0x00008015

; ######### イベントフック関数定義 一式 #########
FUNC_EVENT_MIN                         := RegisterCallback("EventHandlerMin")
FUNC_EVENT_SYSTEM_SOUND                := RegisterCallback("EventHandlerSystemSound")
FUNC_EVENT_SYSTEM_ALERT                := RegisterCallback("EventHandlerSystemAlert")
FUNC_EVENT_SYSTEM_FOREGROUND           := RegisterCallback("EventHandlerSystemForeGround")
FUNC_EVENT_SYSTEM_MENUSTART            := RegisterCallback("EventHandlerSystemMenuStart")
FUNC_EVENT_SYSTEM_MENUEND              := RegisterCallback("EventHandlerSystemMenuEnd")
FUNC_EVENT_SYSTEM_MENUPOPUPSTART       := RegisterCallback("EventHandlerSystemMenuPopupStart")
FUNC_EVENT_SYSTEM_MENUPOPUPEND         := RegisterCallback("EventHandlerSystemMenuPopupEnd")
FUNC_EVENT_SYSTEM_CAPTURESTART         := RegisterCallback("EventHandlerSystemCaptureStart")
FUNC_EVENT_SYSTEM_CAPTUREEND           := RegisterCallback("EventHandlerSystemCaptureEnd")
FUNC_EVENT_SYSTEM_MOVESIZESTART        := RegisterCallback("EventHandlerSystemMoveSizeStart")
FUNC_EVENT_SYSTEM_MOVESIZEEND          := RegisterCallback("EventHandlerSystemMoveSizeEnd")
FUNC_EVENT_SYSTEM_CONTEXTHELPSTART     := RegisterCallback("EventHandlerSystemContextHelpStart")
FUNC_EVENT_SYSTEM_CONTEXTHELPEND       := RegisterCallback("EventHandlerSystemContextHelpEnd")
FUNC_EVENT_SYSTEM_DRAGDROPSTART        := RegisterCallback("EventHandlerSystemDragDropStart")
FUNC_EVENT_SYSTEM_DRAGDROPEND          := RegisterCallback("EventHandlerSystemDragDropEnd")
FUNC_EVENT_SYSTEM_DIALOGSTART          := RegisterCallback("EventHandlerSystemDialogStart")
FUNC_EVENT_SYSTEM_DIALOGEND            := RegisterCallback("EventHandlerSystemDialogEnd")
FUNC_EVENT_SYSTEM_SCROLLINGSTART       := RegisterCallback("EventHandlerSystemScrollingStart")
FUNC_EVENT_SYSTEM_SCROLLINGEND         := RegisterCallback("EventHandlerSystemScrollingEnd")
FUNC_EVENT_SYSTEM_SWITCHSTART          := RegisterCallback("EventHandlerSystemSwitchStart")
FUNC_EVENT_SYSTEM_SWITCHEND            := RegisterCallback("EventHandlerSystemSwitchEnd")
FUNC_EVENT_SYSTEM_MINIMIZESTART        := RegisterCallback("EventHandlerSystemMinimizeStart")
FUNC_EVENT_SYSTEM_MINIMIZEEND          := RegisterCallback("EventHandlerSystemMinimizeEnd")
FUNC_EVENT_OBJECT_CREATE               := RegisterCallback("EventHandlerObjectCreate")
FUNC_EVENT_OBJECT_DESTROY              := RegisterCallback("EventHandlerObjectDestroy")
FUNC_EVENT_OBJECT_SHOW                 := RegisterCallback("EventHandlerObjectShow")
FUNC_EVENT_OBJECT_HIDE                 := RegisterCallback("EventHandlerObjectHide")
FUNC_EVENT_OBJECT_REORDER              := RegisterCallback("EventHandlerObjectReorder")
FUNC_EVENT_OBJECT_FOCUS                := RegisterCallback("EventHandlerObjectFocus")
FUNC_EVENT_OBJECT_SELECTION            := RegisterCallback("EventHandlerObjectSelection")
FUNC_EVENT_OBJECT_SELECTIONADD         := RegisterCallback("EventHandlerObjectSelectionAdd")
FUNC_EVENT_OBJECT_SELECTIONREMOVE      := RegisterCallback("EventHandlerObjectSelectionRemove")
FUNC_EVENT_OBJECT_SELECTIONWITHIN      := RegisterCallback("EventHandlerObjectSelectionWithin")
FUNC_EVENT_OBJECT_STATECHANGE          := RegisterCallback("EventHandlerObjectStateChange")
FUNC_EVENT_OBJECT_LOCATIONCHANGE       := RegisterCallback("EventHandlerObjectLocationChange")
FUNC_EVENT_OBJECT_NAMECHANGE           := RegisterCallback("EventHandlerObjectNameChange")
FUNC_EVENT_OBJECT_DESCRIPTIONCHANGE    := RegisterCallback("EventHandlerObjectDescriptionChange")
FUNC_EVENT_OBJECT_VALUECHANGE          := RegisterCallback("EventHandlerObjectValueChange")
FUNC_EVENT_OBJECT_PARENTCHANGE         := RegisterCallback("EventHandlerObjectParentChange")
FUNC_EVENT_OBJECT_HELPCHANGE           := RegisterCallback("EventHandlerObjectHelpChange")
FUNC_EVENT_OBJECT_DEFACTIONCHANGE      := RegisterCallback("EventHandlerObjectDefactionChange")
FUNC_EVENT_OBJECT_ACCELERATORCHANGE    := RegisterCallback("EventHandlerObjectAcceleratorChange")
FUNC_EVENT_CONSOLE_CARET               := RegisterCallback("EventHandlerConsoleCaret")
FUNC_EVENT_CONSOLE_CARET_SELECTION     := RegisterCallback("EventHandlerConsoleCaretSelection")
FUNC_EVENT_CONSOLE_CARET_VISIBLE       := RegisterCallback("EventHandlerConsoleCaretVisible")
FUNC_EVENT_CONSOLE_UPDATE_REGION       := RegisterCallback("EventHandlerConsoleUpdateRegion")
FUNC_EVENT_CONSOLE_UPDATE_SIMPLE       := RegisterCallback("EventHandlerConsoleUpdateSimple")
FUNC_EVENT_CONSOLE_UPDATE_SCROLL       := RegisterCallback("EventHandlerConsoleUpdateScroll")
FUNC_EVENT_CONSOLE_LAYOUT              := RegisterCallback("EventHandlerConsoleLayout")
FUNC_EVENT_CONSOLE_START_APPLICATION   := RegisterCallback("EventHandlerConsoleStartApplication")
FUNC_EVENT_CONSOLE_APPLICATION_16BIT   := RegisterCallback("EventHandlerConsoleApplication16bit")
FUNC_EVENT_CONSOLE_END_APPLICATION     := RegisterCallback("EventHandlerConsoleEndApplication")
FUNC_EVENT_MAX                         := RegisterCallback("EventHandlerMax")
FUNC_EVENT_SYSTEM_DESKTOPSWITCH        := RegisterCallback("EventHandlerSystemDesktopSwitch")
FUNC_EVENT_OBJECT_INVOKED              := RegisterCallback("EventHandlerObjectInvoked")
FUNC_EVENT_OBJECT_TEXTSELECTIONCHANGED := RegisterCallback("EventHandlerObjectTextSelectionChanged")
FUNC_EVENT_OBJECT_CONTENTSCROLLED      := RegisterCallback("EventHandlerObjectContentScrolled")


; ######### DLL呼び出し定義 一式 #########
HOOK_EVENT_MIN                         := DllCall("SetWinEventHook"
 , "UInt", EVENT_MIN								; eventMin
 , "UInt", EVENT_MIN								; eventMax
 , "UInt", 0										; hModule       : self
 , "UInt", FUNC_EVENT_MIN							; hWinEventProc : 
 , "UInt", 0										; idProcess     : All process
 , "UInt", 0										; idThread      : All threads
 , "UInt", 0x0003									; dwFlags       : WINEVENT_SKIPOWNTHREAD | WINEVENT_SKIPOWNPROCESS
 , "UInt")
HOOK_EVENT_SYSTEM_SOUND                := DllCall("SetWinEventHook"
 , "UInt", EVENT_SYSTEM_SOUND						; eventMin
 , "UInt", EVENT_SYSTEM_SOUND						; eventMax
 , "UInt", 0										; hModule       : self
 , "UInt", FUNC_EVENT_SYSTEM_SOUND					; hWinEventProc : 
 , "UInt", 0										; idProcess     : All process
 , "UInt", 0										; idThread      : All threads
 , "UInt", 0x0003									; dwFlags       : WINEVENT_SKIPOWNTHREAD | WINEVENT_SKIPOWNPROCESS
 , "UInt")
HOOK_EVENT_SYSTEM_ALERT                := DllCall("SetWinEventHook"
 , "UInt", EVENT_SYSTEM_ALERT						; eventMin
 , "UInt", EVENT_SYSTEM_ALERT						; eventMax
 , "UInt", 0										; hModule       : self
 , "UInt", FUNC_EVENT_SYSTEM_ALERT					; hWinEventProc : 
 , "UInt", 0										; idProcess     : All process
 , "UInt", 0										; idThread      : All threads
 , "UInt", 0x0003									; dwFlags       : WINEVENT_SKIPOWNTHREAD | WINEVENT_SKIPOWNPROCESS
 , "UInt")
HOOK_EVENT_SYSTEM_FOREGROUND           := DllCall("SetWinEventHook"
 , "UInt", EVENT_SYSTEM_FOREGROUND					; eventMin
 , "UInt", EVENT_SYSTEM_FOREGROUND					; eventMax
 , "UInt", 0										; hModule       : self
 , "UInt", FUNC_EVENT_SYSTEM_FOREGROUND				; hWinEventProc : 
 , "UInt", 0										; idProcess     : All process
 , "UInt", 0										; idThread      : All threads
 , "UInt", 0x0003									; dwFlags       : WINEVENT_SKIPOWNTHREAD | WINEVENT_SKIPOWNPROCESS
 , "UInt")
HOOK_EVENT_SYSTEM_MENUSTART            := DllCall("SetWinEventHook"
 , "UInt", EVENT_SYSTEM_MENUSTART					; eventMin
 , "UInt", EVENT_SYSTEM_MENUSTART					; eventMax
 , "UInt", 0										; hModule       : self
 , "UInt", FUNC_EVENT_SYSTEM_MENUSTART				; hWinEventProc : 
 , "UInt", 0										; idProcess     : All process
 , "UInt", 0										; idThread      : All threads
 , "UInt", 0x0003									; dwFlags       : WINEVENT_SKIPOWNTHREAD | WINEVENT_SKIPOWNPROCESS
 , "UInt")
HOOK_EVENT_SYSTEM_MENUEND              := DllCall("SetWinEventHook"
 , "UInt", EVENT_SYSTEM_MENUEND						; eventMin
 , "UInt", EVENT_SYSTEM_MENUEND						; eventMax
 , "UInt", 0										; hModule       : self
 , "UInt", FUNC_EVENT_SYSTEM_MENUEND				; hWinEventProc : 
 , "UInt", 0										; idProcess     : All process
 , "UInt", 0										; idThread      : All threads
 , "UInt", 0x0003									; dwFlags       : WINEVENT_SKIPOWNTHREAD | WINEVENT_SKIPOWNPROCESS
 , "UInt")
HOOK_EVENT_SYSTEM_MENUPOPUPSTART       := DllCall("SetWinEventHook"
 , "UInt", EVENT_SYSTEM_MENUPOPUPSTART				; eventMin
 , "UInt", EVENT_SYSTEM_MENUPOPUPSTART				; eventMax
 , "UInt", 0										; hModule       : self
 , "UInt", FUNC_EVENT_SYSTEM_MENUPOPUPSTART			; hWinEventProc : 
 , "UInt", 0										; idProcess     : All process
 , "UInt", 0										; idThread      : All threads
 , "UInt", 0x0003									; dwFlags       : WINEVENT_SKIPOWNTHREAD | WINEVENT_SKIPOWNPROCESS
 , "UInt")
HOOK_EVENT_SYSTEM_MENUPOPUPEND         := DllCall("SetWinEventHook"
 , "UInt", EVENT_SYSTEM_MENUPOPUPEND				; eventMin
 , "UInt", EVENT_SYSTEM_MENUPOPUPEND				; eventMax
 , "UInt", 0										; hModule       : self
 , "UInt", FUNC_EVENT_SYSTEM_MENUPOPUPEND			; hWinEventProc : 
 , "UInt", 0										; idProcess     : All process
 , "UInt", 0										; idThread      : All threads
 , "UInt", 0x0003									; dwFlags       : WINEVENT_SKIPOWNTHREAD | WINEVENT_SKIPOWNPROCESS
 , "UInt")
HOOK_EVENT_SYSTEM_CAPTURESTART         := DllCall("SetWinEventHook"
 , "UInt", EVENT_SYSTEM_CAPTURESTART				; eventMin
 , "UInt", EVENT_SYSTEM_CAPTURESTART				; eventMax
 , "UInt", 0										; hModule       : self
 , "UInt", FUNC_EVENT_SYSTEM_CAPTURESTART			; hWinEventProc : 
 , "UInt", 0										; idProcess     : All process
 , "UInt", 0										; idThread      : All threads
 , "UInt", 0x0003									; dwFlags       : WINEVENT_SKIPOWNTHREAD | WINEVENT_SKIPOWNPROCESS
 , "UInt")
HOOK_EVENT_SYSTEM_CAPTUREEND           := DllCall("SetWinEventHook"
 , "UInt", EVENT_SYSTEM_CAPTUREEND					; eventMin
 , "UInt", EVENT_SYSTEM_CAPTUREEND					; eventMax
 , "UInt", 0										; hModule       : self
 , "UInt", FUNC_EVENT_SYSTEM_CAPTUREEND				; hWinEventProc : 
 , "UInt", 0										; idProcess     : All process
 , "UInt", 0										; idThread      : All threads
 , "UInt", 0x0003									; dwFlags       : WINEVENT_SKIPOWNTHREAD | WINEVENT_SKIPOWNPROCESS
 , "UInt")
HOOK_EVENT_SYSTEM_MOVESIZESTART        := DllCall("SetWinEventHook"
 , "UInt", EVENT_SYSTEM_MOVESIZESTART 				; eventMin
 , "UInt", EVENT_SYSTEM_MOVESIZESTART 				; eventMax
 , "UInt", 0										; hModule       : self
 , "UInt", FUNC_EVENT_SYSTEM_MOVESIZESTART 			; hWinEventProc : 
 , "UInt", 0										; idProcess     : All process
 , "UInt", 0										; idThread      : All threads
 , "UInt", 0x0003									; dwFlags       : WINEVENT_SKIPOWNTHREAD | WINEVENT_SKIPOWNPROCESS
 , "UInt")
HOOK_EVENT_SYSTEM_MOVESIZEEND          := DllCall("SetWinEventHook"
 , "UInt", EVENT_SYSTEM_MOVESIZEEND					; eventMin
 , "UInt", EVENT_SYSTEM_MOVESIZEEND					; eventMax
 , "UInt", 0										; hModule       : self
 , "UInt", FUNC_EVENT_SYSTEM_MOVESIZEEND			; hWinEventProc : 
 , "UInt", 0										; idProcess     : All process
 , "UInt", 0										; idThread      : All threads
 , "UInt", 0x0003									; dwFlags       : WINEVENT_SKIPOWNTHREAD | WINEVENT_SKIPOWNPROCESS
 , "UInt")
HOOK_EVENT_SYSTEM_CONTEXTHELPSTART     := DllCall("SetWinEventHook"
 , "UInt", EVENT_SYSTEM_CONTEXTHELPSTART			; eventMin
 , "UInt", EVENT_SYSTEM_CONTEXTHELPSTART			; eventMax
 , "UInt", 0										; hModule       : self
 , "UInt", FUNC_EVENT_SYSTEM_CONTEXTHELPSTART		; hWinEventProc : 
 , "UInt", 0										; idProcess     : All process
 , "UInt", 0										; idThread      : All threads
 , "UInt", 0x0003									; dwFlags       : WINEVENT_SKIPOWNTHREAD | WINEVENT_SKIPOWNPROCESS
 , "UInt")
HOOK_EVENT_SYSTEM_CONTEXTHELPEND       := DllCall("SetWinEventHook"
 , "UInt", EVENT_SYSTEM_CONTEXTHELPEND				; eventMin
 , "UInt", EVENT_SYSTEM_CONTEXTHELPEND				; eventMax
 , "UInt", 0										; hModule       : self
 , "UInt", FUNC_EVENT_SYSTEM_CONTEXTHELPEND			; hWinEventProc : 
 , "UInt", 0										; idProcess     : All process
 , "UInt", 0										; idThread      : All threads
 , "UInt", 0x0003									; dwFlags       : WINEVENT_SKIPOWNTHREAD | WINEVENT_SKIPOWNPROCESS
 , "UInt")
HOOK_EVENT_SYSTEM_DRAGDROPSTART        := DllCall("SetWinEventHook"
 , "UInt", EVENT_SYSTEM_DRAGDROPSTART				; eventMin
 , "UInt", EVENT_SYSTEM_DRAGDROPSTART				; eventMax
 , "UInt", 0										; hModule       : self
 , "UInt", FUNC_EVENT_SYSTEM_DRAGDROPSTART			; hWinEventProc : 
 , "UInt", 0										; idProcess     : All process
 , "UInt", 0										; idThread      : All threads
 , "UInt", 0x0003									; dwFlags       : WINEVENT_SKIPOWNTHREAD | WINEVENT_SKIPOWNPROCESS
 , "UInt")
HOOK_EVENT_SYSTEM_DRAGDROPEND          := DllCall("SetWinEventHook"
 , "UInt", EVENT_SYSTEM_DRAGDROPEND					; eventMin
 , "UInt", EVENT_SYSTEM_DRAGDROPEND					; eventMax
 , "UInt", 0										; hModule       : self
 , "UInt", FUNC_EVENT_SYSTEM_DRAGDROPEND			; hWinEventProc : 
 , "UInt", 0										; idProcess     : All process
 , "UInt", 0										; idThread      : All threads
 , "UInt", 0x0003									; dwFlags       : WINEVENT_SKIPOWNTHREAD | WINEVENT_SKIPOWNPROCESS
 , "UInt")
HOOK_EVENT_SYSTEM_DIALOGSTART          := DllCall("SetWinEventHook"
 , "UInt", EVENT_SYSTEM_DIALOGSTART					; eventMin
 , "UInt", EVENT_SYSTEM_DIALOGSTART					; eventMax
 , "UInt", 0										; hModule       : self
 , "UInt", FUNC_EVENT_SYSTEM_DIALOGSTART			; hWinEventProc : 
 , "UInt", 0										; idProcess     : All process
 , "UInt", 0										; idThread      : All threads
 , "UInt", 0x0003									; dwFlags       : WINEVENT_SKIPOWNTHREAD | WINEVENT_SKIPOWNPROCESS
 , "UInt")
HOOK_EVENT_SYSTEM_DIALOGEND            := DllCall("SetWinEventHook"
 , "UInt", EVENT_SYSTEM_DIALOGEND					; eventMin
 , "UInt", EVENT_SYSTEM_DIALOGEND					; eventMax
 , "UInt", 0										; hModule       : self
 , "UInt", FUNC_EVENT_SYSTEM_DIALOGEND				; hWinEventProc : 
 , "UInt", 0										; idProcess     : All process
 , "UInt", 0										; idThread      : All threads
 , "UInt", 0x0003									; dwFlags       : WINEVENT_SKIPOWNTHREAD | WINEVENT_SKIPOWNPROCESS
 , "UInt")
HOOK_EVENT_SYSTEM_SCROLLINGSTART       := DllCall("SetWinEventHook"
 , "UInt", EVENT_SYSTEM_SCROLLINGSTART				; eventMin
 , "UInt", EVENT_SYSTEM_SCROLLINGSTART				; eventMax
 , "UInt", 0										; hModule       : self
 , "UInt", FUNC_EVENT_SYSTEM_SCROLLINGSTART			; hWinEventProc : 
 , "UInt", 0										; idProcess     : All process
 , "UInt", 0										; idThread      : All threads
 , "UInt", 0x0003									; dwFlags       : WINEVENT_SKIPOWNTHREAD | WINEVENT_SKIPOWNPROCESS
 , "UInt")
HOOK_EVENT_SYSTEM_SCROLLINGEND         := DllCall("SetWinEventHook"
 , "UInt", EVENT_SYSTEM_SCROLLINGEND				; eventMin
 , "UInt", EVENT_SYSTEM_SCROLLINGEND				; eventMax
 , "UInt", 0										; hModule       : self
 , "UInt", FUNC_EVENT_SYSTEM_SCROLLINGEND			; hWinEventProc : 
 , "UInt", 0										; idProcess     : All process
 , "UInt", 0										; idThread      : All threads
 , "UInt", 0x0003									; dwFlags       : WINEVENT_SKIPOWNTHREAD | WINEVENT_SKIPOWNPROCESS
 , "UInt")
HOOK_EVENT_SYSTEM_SWITCHSTART          := DllCall("SetWinEventHook"
 , "UInt", EVENT_SYSTEM_SWITCHSTART					; eventMin
 , "UInt", EVENT_SYSTEM_SWITCHSTART					; eventMax
 , "UInt", 0										; hModule       : self
 , "UInt", FUNC_EVENT_SYSTEM_SWITCHSTART			; hWinEventProc : 
 , "UInt", 0										; idProcess     : All process
 , "UInt", 0										; idThread      : All threads
 , "UInt", 0x0003									; dwFlags       : WINEVENT_SKIPOWNTHREAD | WINEVENT_SKIPOWNPROCESS
 , "UInt")
HOOK_EVENT_SYSTEM_SWITCHEND            := DllCall("SetWinEventHook"
 , "UInt", EVENT_SYSTEM_SWITCHEND					; eventMin
 , "UInt", EVENT_SYSTEM_SWITCHEND					; eventMax
 , "UInt", 0										; hModule       : self
 , "UInt", FUNC_EVENT_SYSTEM_SWITCHEND				; hWinEventProc : 
 , "UInt", 0										; idProcess     : All process
 , "UInt", 0										; idThread      : All threads
 , "UInt", 0x0003									; dwFlags       : WINEVENT_SKIPOWNTHREAD | WINEVENT_SKIPOWNPROCESS
 , "UInt")
HOOK_EVENT_SYSTEM_MINIMIZESTART        := DllCall("SetWinEventHook"
 , "UInt", EVENT_SYSTEM_MINIMIZESTART				; eventMin
 , "UInt", EVENT_SYSTEM_MINIMIZESTART				; eventMax
 , "UInt", 0										; hModule       : self
 , "UInt", FUNC_EVENT_SYSTEM_MINIMIZESTART			; hWinEventProc : 
 , "UInt", 0										; idProcess     : All process
 , "UInt", 0										; idThread      : All threads
 , "UInt", 0x0003									; dwFlags       : WINEVENT_SKIPOWNTHREAD | WINEVENT_SKIPOWNPROCESS
 , "UInt")
HOOK_EVENT_SYSTEM_MINIMIZEEND          := DllCall("SetWinEventHook"
 , "UInt", EVENT_SYSTEM_MINIMIZEEND					; eventMin
 , "UInt", EVENT_SYSTEM_MINIMIZEEND					; eventMax
 , "UInt", 0										; hModule       : self
 , "UInt", FUNC_EVENT_SYSTEM_MINIMIZEEND			; hWinEventProc : 
 , "UInt", 0										; idProcess     : All process
 , "UInt", 0										; idThread      : All threads
 , "UInt", 0x0003									; dwFlags       : WINEVENT_SKIPOWNTHREAD | WINEVENT_SKIPOWNPROCESS
 , "UInt")
HOOK_EVENT_OBJECT_CREATE               := DllCall("SetWinEventHook"
 , "UInt", EVENT_OBJECT_CREATE						; eventMin
 , "UInt", EVENT_OBJECT_CREATE						; eventMax
 , "UInt", 0										; hModule       : self
 , "UInt", FUNC_EVENT_OBJECT_CREATE					; hWinEventProc : 
 , "UInt", 0										; idProcess     : All process
 , "UInt", 0										; idThread      : All threads
 , "UInt", 0x0003									; dwFlags       : WINEVENT_SKIPOWNTHREAD | WINEVENT_SKIPOWNPROCESS
 , "UInt")
HOOK_EVENT_OBJECT_DESTROY              := DllCall("SetWinEventHook"
 , "UInt", EVENT_OBJECT_DESTROY						; eventMin
 , "UInt", EVENT_OBJECT_DESTROY						; eventMax
 , "UInt", 0										; hModule       : self
 , "UInt", FUNC_EVENT_OBJECT_DESTROY				; hWinEventProc : 
 , "UInt", 0										; idProcess     : All process
 , "UInt", 0										; idThread      : All threads
 , "UInt", 0x0003									; dwFlags       : WINEVENT_SKIPOWNTHREAD | WINEVENT_SKIPOWNPROCESS
 , "UInt")
HOOK_EVENT_OBJECT_SHOW                 := DllCall("SetWinEventHook"
 , "UInt", EVENT_OBJECT_SHOW						; eventMin
 , "UInt", EVENT_OBJECT_SHOW						; eventMax
 , "UInt", 0										; hModule       : self
 , "UInt", FUNC_EVENT_OBJECT_SHOW					; hWinEventProc : 
 , "UInt", 0										; idProcess     : All process
 , "UInt", 0										; idThread      : All threads
 , "UInt", 0x0003									; dwFlags       : WINEVENT_SKIPOWNTHREAD | WINEVENT_SKIPOWNPROCESS
 , "UInt")
HOOK_EVENT_OBJECT_HIDE                 := DllCall("SetWinEventHook"
 , "UInt", EVENT_OBJECT_HIDE						; eventMin
 , "UInt", EVENT_OBJECT_HIDE						; eventMax
 , "UInt", 0										; hModule       : self
 , "UInt", FUNC_EVENT_OBJECT_HIDE					; hWinEventProc : 
 , "UInt", 0										; idProcess     : All process
 , "UInt", 0										; idThread      : All threads
 , "UInt", 0x0003									; dwFlags       : WINEVENT_SKIPOWNTHREAD | WINEVENT_SKIPOWNPROCESS
 , "UInt")
HOOK_EVENT_OBJECT_REORDER              := DllCall("SetWinEventHook"
 , "UInt", EVENT_OBJECT_REORDER						; eventMin
 , "UInt", EVENT_OBJECT_REORDER						; eventMax
 , "UInt", 0										; hModule       : self
 , "UInt", FUNC_EVENT_OBJECT_REORDER				; hWinEventProc : 
 , "UInt", 0										; idProcess     : All process
 , "UInt", 0										; idThread      : All threads
 , "UInt", 0x0003									; dwFlags       : WINEVENT_SKIPOWNTHREAD | WINEVENT_SKIPOWNPROCESS
 , "UInt")
HOOK_EVENT_OBJECT_FOCUS                := DllCall("SetWinEventHook"
 , "UInt", EVENT_OBJECT_FOCUS						; eventMin
 , "UInt", EVENT_OBJECT_FOCUS						; eventMax
 , "UInt", 0										; hModule       : self
 , "UInt", FUNC_EVENT_OBJECT_FOCUS					; hWinEventProc : 
 , "UInt", 0										; idProcess     : All process
 , "UInt", 0										; idThread      : All threads
 , "UInt", 0x0003									; dwFlags       : WINEVENT_SKIPOWNTHREAD | WINEVENT_SKIPOWNPROCESS
 , "UInt")
HOOK_EVENT_OBJECT_SELECTION            := DllCall("SetWinEventHook"
 , "UInt", EVENT_OBJECT_SELECTION					; eventMin
 , "UInt", EVENT_OBJECT_SELECTION					; eventMax
 , "UInt", 0										; hModule       : self
 , "UInt", FUNC_EVENT_OBJECT_SELECTION				; hWinEventProc : 
 , "UInt", 0										; idProcess     : All process
 , "UInt", 0										; idThread      : All threads
 , "UInt", 0x0003									; dwFlags       : WINEVENT_SKIPOWNTHREAD | WINEVENT_SKIPOWNPROCESS
 , "UInt")
HOOK_EVENT_OBJECT_SELECTIONADD         := DllCall("SetWinEventHook"
 , "UInt", EVENT_OBJECT_SELECTIONADD 				; eventMin
 , "UInt", EVENT_OBJECT_SELECTIONADD 				; eventMax
 , "UInt", 0										; hModule       : self
 , "UInt", FUNC_EVENT_OBJECT_SELECTIONADD 			; hWinEventProc : 
 , "UInt", 0										; idProcess     : All process
 , "UInt", 0										; idThread      : All threads
 , "UInt", 0x0003									; dwFlags       : WINEVENT_SKIPOWNTHREAD | WINEVENT_SKIPOWNPROCESS
 , "UInt")
HOOK_EVENT_OBJECT_SELECTIONREMOVE      := DllCall("SetWinEventHook"
 , "UInt", EVENT_OBJECT_SELECTIONREMOVE				; eventMin
 , "UInt", EVENT_OBJECT_SELECTIONREMOVE				; eventMax
 , "UInt", 0										; hModule       : self
 , "UInt", FUNC_EVENT_OBJECT_SELECTIONREMOVE		; hWinEventProc : 
 , "UInt", 0										; idProcess     : All process
 , "UInt", 0										; idThread      : All threads
 , "UInt", 0x0003									; dwFlags       : WINEVENT_SKIPOWNTHREAD | WINEVENT_SKIPOWNPROCESS
 , "UInt")
HOOK_EVENT_OBJECT_SELECTIONWITHIN      := DllCall("SetWinEventHook"
 , "UInt", EVENT_OBJECT_SELECTIONWITHIN				; eventMin
 , "UInt", EVENT_OBJECT_SELECTIONWITHIN				; eventMax
 , "UInt", 0										; hModule       : self
 , "UInt", FUNC_EVENT_OBJECT_SELECTIONWITHIN		; hWinEventProc : 
 , "UInt", 0										; idProcess     : All process
 , "UInt", 0										; idThread      : All threads
 , "UInt", 0x0003									; dwFlags       : WINEVENT_SKIPOWNTHREAD | WINEVENT_SKIPOWNPROCESS
 , "UInt")
HOOK_EVENT_OBJECT_STATECHANGE          := DllCall("SetWinEventHook"
 , "UInt", EVENT_OBJECT_STATECHANGE					; eventMin
 , "UInt", EVENT_OBJECT_STATECHANGE					; eventMax
 , "UInt", 0										; hModule       : self
 , "UInt", FUNC_EVENT_OBJECT_STATECHANGE			; hWinEventProc : 
 , "UInt", 0										; idProcess     : All process
 , "UInt", 0										; idThread      : All threads
 , "UInt", 0x0003									; dwFlags       : WINEVENT_SKIPOWNTHREAD | WINEVENT_SKIPOWNPROCESS
 , "UInt")
HOOK_EVENT_OBJECT_LOCATIONCHANGE       := DllCall("SetWinEventHook"
 , "UInt", EVENT_OBJECT_LOCATIONCHANGE				; eventMin
 , "UInt", EVENT_OBJECT_LOCATIONCHANGE				; eventMax
 , "UInt", 0										; hModule       : self
 , "UInt", FUNC_EVENT_OBJECT_LOCATIONCHANGE			; hWinEventProc : 
 , "UInt", 0										; idProcess     : All process
 , "UInt", 0										; idThread      : All threads
 , "UInt", 0x0003									; dwFlags       : WINEVENT_SKIPOWNTHREAD | WINEVENT_SKIPOWNPROCESS
 , "UInt")
HOOK_EVENT_OBJECT_NAMECHANGE           := DllCall("SetWinEventHook"
 , "UInt", EVENT_OBJECT_NAMECHANGE					; eventMin
 , "UInt", EVENT_OBJECT_NAMECHANGE					; eventMax
 , "UInt", 0										; hModule       : self
 , "UInt", FUNC_EVENT_OBJECT_NAMECHANGE				; hWinEventProc : 
 , "UInt", 0										; idProcess     : All process
 , "UInt", 0										; idThread      : All threads
 , "UInt", 0x0003									; dwFlags       : WINEVENT_SKIPOWNTHREAD | WINEVENT_SKIPOWNPROCESS
 , "UInt")
HOOK_EVENT_OBJECT_DESCRIPTIONCHANGE    := DllCall("SetWinEventHook"
 , "UInt", EVENT_OBJECT_DESCRIPTIONCHANGE			; eventMin
 , "UInt", EVENT_OBJECT_DESCRIPTIONCHANGE			; eventMax
 , "UInt", 0										; hModule       : self
 , "UInt", FUNC_EVENT_OBJECT_DESCRIPTIONCHANGE		; hWinEventProc : 
 , "UInt", 0										; idProcess     : All process
 , "UInt", 0										; idThread      : All threads
 , "UInt", 0x0003									; dwFlags       : WINEVENT_SKIPOWNTHREAD | WINEVENT_SKIPOWNPROCESS
 , "UInt")
HOOK_EVENT_OBJECT_VALUECHANGE          := DllCall("SetWinEventHook"
 , "UInt", EVENT_OBJECT_VALUECHANGE					; eventMin
 , "UInt", EVENT_OBJECT_VALUECHANGE					; eventMax
 , "UInt", 0										; hModule       : self
 , "UInt", FUNC_EVENT_OBJECT_VALUECHANGE			; hWinEventProc : 
 , "UInt", 0										; idProcess     : All process
 , "UInt", 0										; idThread      : All threads
 , "UInt", 0x0003									; dwFlags       : WINEVENT_SKIPOWNTHREAD | WINEVENT_SKIPOWNPROCESS
 , "UInt")
HOOK_EVENT_OBJECT_PARENTCHANGE         := DllCall("SetWinEventHook"
 , "UInt", EVENT_OBJECT_PARENTCHANGE				; eventMin
 , "UInt", EVENT_OBJECT_PARENTCHANGE				; eventMax
 , "UInt", 0										; hModule       : self
 , "UInt", FUNC_EVENT_OBJECT_PARENTCHANGE			; hWinEventProc : 
 , "UInt", 0										; idProcess     : All process
 , "UInt", 0										; idThread      : All threads
 , "UInt", 0x0003									; dwFlags       : WINEVENT_SKIPOWNTHREAD | WINEVENT_SKIPOWNPROCESS
 , "UInt")
HOOK_EVENT_OBJECT_HELPCHANGE           := DllCall("SetWinEventHook"
 , "UInt", EVENT_OBJECT_HELPCHANGE					; eventMin
 , "UInt", EVENT_OBJECT_HELPCHANGE					; eventMax
 , "UInt", 0										; hModule       : self
 , "UInt", FUNC_EVENT_OBJECT_HELPCHANGE				; hWinEventProc : 
 , "UInt", 0										; idProcess     : All process
 , "UInt", 0										; idThread      : All threads
 , "UInt", 0x0003									; dwFlags       : WINEVENT_SKIPOWNTHREAD | WINEVENT_SKIPOWNPROCESS
 , "UInt")
HOOK_EVENT_OBJECT_DEFACTIONCHANGE      := DllCall("SetWinEventHook"
 , "UInt", EVENT_OBJECT_DEFACTIONCHANGE				; eventMin
 , "UInt", EVENT_OBJECT_DEFACTIONCHANGE				; eventMax
 , "UInt", 0										; hModule       : self
 , "UInt", FUNC_EVENT_OBJECT_DEFACTIONCHANGE		; hWinEventProc : 
 , "UInt", 0										; idProcess     : All process
 , "UInt", 0										; idThread      : All threads
 , "UInt", 0x0003									; dwFlags       : WINEVENT_SKIPOWNTHREAD | WINEVENT_SKIPOWNPROCESS
 , "UInt")
HOOK_EVENT_OBJECT_ACCELERATORCHANGE    := DllCall("SetWinEventHook"
 , "UInt", EVENT_OBJECT_ACCELERATORCHANGE			; eventMin
 , "UInt", EVENT_OBJECT_ACCELERATORCHANGE			; eventMax
 , "UInt", 0										; hModule       : self
 , "UInt", FUNC_EVENT_OBJECT_ACCELERATORCHANGE		; hWinEventProc : 
 , "UInt", 0										; idProcess     : All process
 , "UInt", 0										; idThread      : All threads
 , "UInt", 0x0003									; dwFlags       : WINEVENT_SKIPOWNTHREAD | WINEVENT_SKIPOWNPROCESS
 , "UInt")
HOOK_EVENT_CONSOLE_CARET               := DllCall("SetWinEventHook"
 , "UInt", EVENT_CONSOLE_CARET						; eventMin
 , "UInt", EVENT_CONSOLE_CARET						; eventMax
 , "UInt", 0										; hModule       : self
 , "UInt", FUNC_EVENT_CONSOLE_CARET					; hWinEventProc : 
 , "UInt", 0										; idProcess     : All process
 , "UInt", 0										; idThread      : All threads
 , "UInt", 0x0003									; dwFlags       : WINEVENT_SKIPOWNTHREAD | WINEVENT_SKIPOWNPROCESS
 , "UInt")
HOOK_EVENT_CONSOLE_CARET_SELECTION           := DllCall("SetWinEventHook"
 , "UInt", EVENT_CONSOLE_CARET_SELECTION			; eventMin
 , "UInt", EVENT_CONSOLE_CARET_SELECTION			; eventMax
 , "UInt", 0										; hModule       : self
 , "UInt", FUNC_EVENT_CONSOLE_CARET_SELECTION		; hWinEventProc : 
 , "UInt", 0										; idProcess     : All process
 , "UInt", 0										; idThread      : All threads
 , "UInt", 0x0003									; dwFlags       : WINEVENT_SKIPOWNTHREAD | WINEVENT_SKIPOWNPROCESS
 , "UInt")
HOOK_EVENT_CONSOLE_CARET_VISIBLE             := DllCall("SetWinEventHook"
 , "UInt", EVENT_CONSOLE_CARET_VISIBLE				; eventMin
 , "UInt", EVENT_CONSOLE_CARET_VISIBLE				; eventMax
 , "UInt", 0										; hModule       : self
 , "UInt", FUNC_EVENT_CONSOLE_CARET_VISIBLE			; hWinEventProc : 
 , "UInt", 0										; idProcess     : All process
 , "UInt", 0										; idThread      : All threads
 , "UInt", 0x0003									; dwFlags       : WINEVENT_SKIPOWNTHREAD | WINEVENT_SKIPOWNPROCESS
 , "UInt")
HOOK_EVENT_CONSOLE_UPDATE_REGION       := DllCall("SetWinEventHook"
 , "UInt", EVENT_CONSOLE_UPDATE_REGION				; eventMin
 , "UInt", EVENT_CONSOLE_UPDATE_REGION				; eventMax
 , "UInt", 0										; hModule       : self
 , "UInt", FUNC_EVENT_CONSOLE_UPDATE_REGION			; hWinEventProc : 
 , "UInt", 0										; idProcess     : All process
 , "UInt", 0										; idThread      : All threads
 , "UInt", 0x0003									; dwFlags       : WINEVENT_SKIPOWNTHREAD | WINEVENT_SKIPOWNPROCESS
 , "UInt")
HOOK_EVENT_CONSOLE_UPDATE_SIMPLE       := DllCall("SetWinEventHook"
 , "UInt", EVENT_CONSOLE_UPDATE_SIMPLE				; eventMin
 , "UInt", EVENT_CONSOLE_UPDATE_SIMPLE				; eventMax
 , "UInt", 0										; hModule       : self
 , "UInt", FUNC_EVENT_CONSOLE_UPDATE_SIMPLE			; hWinEventProc : 
 , "UInt", 0										; idProcess     : All process
 , "UInt", 0										; idThread      : All threads
 , "UInt", 0x0003									; dwFlags       : WINEVENT_SKIPOWNTHREAD | WINEVENT_SKIPOWNPROCESS
 , "UInt")
HOOK_EVENT_CONSOLE_UPDATE_SCROLL       := DllCall("SetWinEventHook"
 , "UInt", EVENT_CONSOLE_UPDATE_SCROLL				; eventMin
 , "UInt", EVENT_CONSOLE_UPDATE_SCROLL				; eventMax
 , "UInt", 0										; hModule       : self
 , "UInt", FUNC_EVENT_CONSOLE_UPDATE_SCROLL			; hWinEventProc : 
 , "UInt", 0										; idProcess     : All process
 , "UInt", 0										; idThread      : All threads
 , "UInt", 0x0003									; dwFlags       : WINEVENT_SKIPOWNTHREAD | WINEVENT_SKIPOWNPROCESS
 , "UInt")
HOOK_EVENT_CONSOLE_LAYOUT              := DllCall("SetWinEventHook"
 , "UInt", EVENT_CONSOLE_LAYOUT						; eventMin
 , "UInt", EVENT_CONSOLE_LAYOUT						; eventMax
 , "UInt", 0										; hModule       : self
 , "UInt", FUNC_EVENT_CONSOLE_LAYOUT				; hWinEventProc : 
 , "UInt", 0										; idProcess     : All process
 , "UInt", 0										; idThread      : All threads
 , "UInt", 0x0003									; dwFlags       : WINEVENT_SKIPOWNTHREAD | WINEVENT_SKIPOWNPROCESS
 , "UInt")
HOOK_EVENT_CONSOLE_START_APPLICATION   := DllCall("SetWinEventHook"
 , "UInt", EVENT_CONSOLE_START_APPLICATION			; eventMin
 , "UInt", EVENT_CONSOLE_START_APPLICATION			; eventMax
 , "UInt", 0										; hModule       : self
 , "UInt", FUNC_EVENT_CONSOLE_START_APPLICATION		; hWinEventProc : 
 , "UInt", 0										; idProcess     : All process
 , "UInt", 0										; idThread      : All threads
 , "UInt", 0x0003									; dwFlags       : WINEVENT_SKIPOWNTHREAD | WINEVENT_SKIPOWNPROCESS
 , "UInt")
HOOK_EVENT_CONSOLE_APPLICATION_16BIT         := DllCall("SetWinEventHook"
 , "UInt", EVENT_CONSOLE_APPLICATION_16BIT			; eventMin
 , "UInt", EVENT_CONSOLE_APPLICATION_16BIT			; eventMax
 , "UInt", 0										; hModule       : self
 , "UInt", FUNC_EVENT_CONSOLE_APPLICATION_16BIT		; hWinEventProc : 
 , "UInt", 0										; idProcess     : All process
 , "UInt", 0										; idThread      : All threads
 , "UInt", 0x0003									; dwFlags       : WINEVENT_SKIPOWNTHREAD | WINEVENT_SKIPOWNPROCESS
 , "UInt")
HOOK_EVENT_CONSOLE_END_APPLICATION     := DllCall("SetWinEventHook"
 , "UInt", EVENT_CONSOLE_END_APPLICATION			; eventMin
 , "UInt", EVENT_CONSOLE_END_APPLICATION			; eventMax
 , "UInt", 0										; hModule       : self
 , "UInt", FUNC_EVENT_CONSOLE_END_APPLICATION		; hWinEventProc : 
 , "UInt", 0										; idProcess     : All process
 , "UInt", 0										; idThread      : All threads
 , "UInt", 0x0003									; dwFlags       : WINEVENT_SKIPOWNTHREAD | WINEVENT_SKIPOWNPROCESS
 , "UInt")
HOOK_EVENT_MAX                         := DllCall("SetWinEventHook"
 , "UInt", EVENT_MAX								; eventMin
 , "UInt", EVENT_MAX								; eventMax
 , "UInt", 0										; hModule       : self
 , "UInt", FUNC_EVENT_MAX							; hWinEventProc : 
 , "UInt", 0										; idProcess     : All process
 , "UInt", 0										; idThread      : All threads
 , "UInt", 0x0003									; dwFlags       : WINEVENT_SKIPOWNTHREAD | WINEVENT_SKIPOWNPROCESS
 , "UInt")
HOOK_EVENT_SYSTEM_DESKTOPSWITCH        := DllCall("SetWinEventHook"
 , "UInt", EVENT_SYSTEM_DESKTOPSWITCH				; eventMin
 , "UInt", EVENT_SYSTEM_DESKTOPSWITCH				; eventMax
 , "UInt", 0										; hModule       : self
 , "UInt", FUNC_EVENT_SYSTEM_DESKTOPSWITCH			; hWinEventProc : 
 , "UInt", 0										; idProcess     : All process
 , "UInt", 0										; idThread      : All threads
 , "UInt", 0x0003									; dwFlags       : WINEVENT_SKIPOWNTHREAD | WINEVENT_SKIPOWNPROCESS
 , "UInt")
HOOK_EVENT_OBJECT_INVOKED              := DllCall("SetWinEventHook"
 , "UInt", EVENT_OBJECT_INVOKED						; eventMin
 , "UInt", EVENT_OBJECT_INVOKED						; eventMax
 , "UInt", 0										; hModule       : self
 , "UInt", FUNC_EVENT_OBJECT_INVOKED				; hWinEventProc : 
 , "UInt", 0										; idProcess     : All process
 , "UInt", 0										; idThread      : All threads
 , "UInt", 0x0003									; dwFlags       : WINEVENT_SKIPOWNTHREAD | WINEVENT_SKIPOWNPROCESS
 , "UInt")
HOOK_EVENT_OBJECT_TEXTSELECTIONCHANGED := DllCall("SetWinEventHook"
 , "UInt", EVENT_OBJECT_TEXTSELECTIONCHANGED		; eventMin
 , "UInt", EVENT_OBJECT_TEXTSELECTIONCHANGED		; eventMax
 , "UInt", 0										; hModule       : self
 , "UInt", FUNC_EVENT_OBJECT_TEXTSELECTIONCHANGED	; hWinEventProc : 
 , "UInt", 0										; idProcess     : All process
 , "UInt", 0										; idThread      : All threads
 , "UInt", 0x0003									; dwFlags       : WINEVENT_SKIPOWNTHREAD | WINEVENT_SKIPOWNPROCESS
 , "UInt")
HOOK_EVENT_OBJECT_CONTENTSCROLLED      := DllCall("SetWinEventHook"
 , "UInt", EVENT_OBJECT_CONTENTSCROLLED				; eventMin
 , "UInt", EVENT_OBJECT_CONTENTSCROLLED				; eventMax
 , "UInt", 0										; hModule       : self
 , "UInt", FUNC_EVENT_OBJECT_CONTENTSCROLLED		; hWinEventProc : 
 , "UInt", 0										; idProcess     : All process
 , "UInt", 0										; idThread      : All threads
 , "UInt", 0x0003									; dwFlags       : WINEVENT_SKIPOWNTHREAD | WINEVENT_SKIPOWNPROCESS
 , "UInt")
