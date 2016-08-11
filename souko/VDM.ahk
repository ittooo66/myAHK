; DesktopSwitch
;
; AutoHotkey Version: 1.0.40.00 (that's at least the version I'm using)
; Language:       English
; Platform:       Win9x/NT/XP
; Author:         Christian Schüler <c_schueler@gmx.at>
; last changes:   22. Nov. 2005
;
; Script Function:
;
; A small tool for switching between multiple virtual desktops.
; Use Alt-<desktop index> (e.g. Alt-2) to switch between desktops and
; Alt-0 to quit the script, showing all windows on all virtual desktops
; at once. Currently, 4 desktops are supported, because more will start
; to confuse me...
;
; Version history:
;
; v1.11, 22. Nov. 2005
; Fixed bug: windows are now corrrectly activated after switching/sending
;
; v1.1, 05. Nov. 2005
; Added feature: pressing Ctrl/Alt-<index> sends the active window to the desktop <index>.
;
; v1.0, 04. Nov. 2005
; It works!
; Switching can be done using Alt-<desktop index>, e.g. Alt-1. Pressing
; Alt-0 will exit the script and show all windows from all virtual desktops
; at once.


; ***** initialization *****

SetBatchLines, -1   ; maximize script speed!
SetWinDelay, -1
OnExit, CleanUp      ; clean up in case of error (otherwise some windows will get lost)

numDesktops := 4   ; maximum number of desktops
curDesktop := 1      ; index number of current desktop

WinGet, windows1, List   ; get list of all currently visible windows


; ***** hotkeys *****

!1::SwitchToDesktop(1)
!2::SwitchToDesktop(2)

^!1::SendActiveToDesktop(1)
^!2::SendActiveToDesktop(2)

!0::ExitApp


; ***** functions *****

; switch to the desktop with the given index number
SwitchToDesktop(newDesktop)
{
   global

   if (curDesktop <> newDesktop)
   {
      GetCurrentWindows(curDesktop)

      ;WinGet, windows%curDesktop%, List,,, Program Manager   ; get list of all visible windows

      ShowHideWindows(curDesktop, false)
      ShowHideWindows(newDesktop, true)

      curDesktop := newDesktop

      Send, {ALT DOWN}{TAB}{ALT UP}	; activate the right window
   }

   return
}

; sends the given window from the current desktop to the given desktop
SendToDesktop(windowID, newDesktop)
{
   global
   RemoveWindowID(curDesktop, windowID)

   ; add window to destination desktop
   windows%newDesktop% += 1
   i := windows%newDesktop%

   windows%newDesktop%%i% := windowID

   WinHide, ahk_id %windowID%

   Send, {ALT DOWN}{TAB}{ALT UP}	; activate the right window
}

; sends the currently active window to the given desktop
SendActiveToDesktop(newDesktop)
{
   WinGet, id, ID, A
   SendToDesktop(id, newDesktop)
}

; removes the given window id from the desktop <desktopIdx>
RemoveWindowID(desktopIdx, ID)
{
   global
   Loop, % windows%desktopIdx%
   {
      if (windows%desktopIdx%%A_Index% = ID)
      {
         RemoveWindowID_byIndex(desktopIdx, A_Index)
         Break
      }
   }
}

; this removes the window id at index <ID_idx> from desktop number <desktopIdx>
RemoveWindowID_byIndex(desktopIdx, ID_idx)
{
   global
   Loop, % windows%desktopIdx% - ID_idx
   {
      idx1 := % A_Index + ID_idx - 1
      idx2 := % A_Index + ID_idx
      windows%desktopIdx%%idx1% := windows%desktopIdx%%idx2%
   }
   windows%desktopIdx% -= 1
}

; this builds a list of all currently visible windows in stores it in desktop <index>
GetCurrentWindows(index)
{
   global
   WinGet, windows%index%, List,,, Program Manager      ; get list of all visible windows

   ; now remove task bar "window" (is there a simpler way?)
   Loop, % windows%index%
   {
      id := % windows%index%%A_Index%

      WinGetClass, windowClass, ahk_id %id%
      if windowClass = Shell_TrayWnd      ; remove task bar window id
      {
         RemoveWindowID_byIndex(index, A_Index)
         Break
      }
   }
}

; if show=true then shows windows of desktop %index%, otherwise hides them
ShowHideWindows(index, show)
{
   global

   Loop, % windows%index%
   {
      id := % windows%index%%A_Index%

      if show
         WinShow, ahk_id %id%
      else
         WinHide, ahk_id %id%
   }
}

; show all windows from all desktops on exit
CleanUp:
Loop, %numDesktops%
   ShowHideWindows(A_Index, true)
ExitApp
