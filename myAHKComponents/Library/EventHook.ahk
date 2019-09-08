;イベントフック定義。return書く前に呼んでおかないと機能しない
myFunc := RegisterCallback("WinActivateHandler")
myFunc2 := RegisterCallback("WinDisactivateHandler")
myHook := DllCall("SetWinEventHook"
 , "UInt", 0x00000004 ; eventMin      : EVENT_SYSTEM_MENUSTART
 , "UInt", 0x00000004 ; eventMax      : EVENT_SYSTEM_MENUSTART
 , "UInt", 0          ; hModule       : self
 , "UInt", myFunc     ; hWinEventProc : 
 , "UInt", 0          ; idProcess     : All process
 , "UInt", 0          ; idThread      : All threads
 , "UInt", 0x0003     ; dwFlags       : WINEVENT_SKIPOWNTHREAD | WINEVENT_SKIPOWNPROCESS
 , "UInt")
 myHook := DllCall("SetWinEventHook"
 , "UInt", 0x00000005 ; eventMin      : EVENT_SYSTEM_MENUEND
 , "UInt", 0x00000005 ; eventMax      : EVENT_SYSTEM_MENUEND
 , "UInt", 0          ; hModule       : self
 , "UInt", myFunc2     ; hWinEventProc : 
 , "UInt", 0          ; idProcess     : All process
 , "UInt", 0          ; idThread      : All threads
 , "UInt", 0x0003     ; dwFlags       : WINEVENT_SKIPOWNTHREAD | WINEVENT_SKIPOWNPROCESS
 , "UInt")

;イベント検知後処理
WinActivateHandler(hWinEventHook, event, hwnd, idObject, idChild, thread, time) {
	return
}
WinDisactivateHandler(hWinEventHook, event, hwnd, idObject, idChild, thread, time) {
	return
}