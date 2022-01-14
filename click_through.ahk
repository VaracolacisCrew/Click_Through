; Created by 		Cristófano Varacolaci
; For 			 	ObsessedDesigns Studios™, Inc.
; Version 			1.0.0
; Build             10:30 2022.01.13
;#####################################################################################
; INCLUDES
;#####################################################################################
#Include, inc\init.ahk

; creates the tray menu
Gosub, MENU

MAIN:

Return

SELECT:
    DetectHiddenWindows, On
   Loop {
        ToolTip, % SelectWindowTt

        KeyWait, LButton, D T0.02
        If not ErrorLevel
        {
            MouseGetPos,,, WinID, ControlID, 0
            WinGet, WinIDExStyle, ExStyle, ahk_id %WinID%
            Winget, ProccName, ProcessName, ahk_id %WinID%
            WinGetTitle, SelWinTitle, ahk_id %WinID%
            Menu, Tray, Check,  &Select Window
            Menu, Tray, Enable,  - Make Transparent
            Menu, Tray, Enable,  - Make Top Most

            Menu, Tray, Rename, % TrayTitle, % ProccName . " - " . SelWinTitle
            TrayTitle := ProccName . " - " . SelWinTitle

            ToolTip,
            Break
        }

        Sleep, 100
   }

Return

TRANSP:
    InputBox, opacity, Opacity Level, Opacity for the window (10 - 100).,,250, 125,,,,,80
    if ErrorLevel {
	    MsgBox, , Click Through, App will terminate.
	    Goto, END
    }
    else {
        if opacity < 10
            opacity = 10
        if opacity > 100
            opacity = 100

        opacity = % Round((opacity * 255) / 100)
    }
    WinSet, Transparent, % opacity, ahk_id %WinID%
    Menu, Tray, Enable,  - Make Click Through
    Menu, Tray, Insert,  - Make Transparent,  - Make Opaque, OPAQUE
    Menu, Tray, Delete,  - Make Transparent
Return

OPAQUE:
    WinGet, WinIDExStyle, ExStyle, ahk_id %WinID%
    WinSet, Transparent, off, ahk_id %WinID%
    Menu, Tray, Insert,  - Make Opaque,  - Make Transparent, TRANSP
    Menu, Tray, Delete,  - Make Opaque
    if ( WinIDExStyle & 0x20 != 0 )
    {
        CTEnabled := true
        Goto, NCTHROUGH
    } else {
         Menu, Tray, Disable,  - Make Click Through
    }
Return


AONTOP:
    WinSet, AlwaysOnTop, On, ahk_id %WinID%
    WinSet, ExStyle, +0x00000008L, ahk_id %WinID%
    SendMessage, 0x112, 0xF140, 0,, Program Manager
    Menu, Tray, Insert,  - Make Top Most,  - Make Non Top Most, NONTOP
    Menu, Tray, Delete,  - Make Top Most
Return

NONTOP:
    WinSet, AlwaysOnTop, Off, ahk_id %WinID%
    WinSet, ExStyle, -0x00000008L, ahk_id %WinID%
    SendMessage, 0x112, 0xF140, 0,, Program Manager
    Menu, Tray, Insert,  - Make Non Top Most,  - Make Top Most, AONTOP
    Menu, Tray, Delete,  - Make Non Top Most
Return

CTHROUGH:
    WinSet, ExStyle, +0x20L, ahk_id %WinID%
    Menu, Tray, Insert,  - Make Click Through,  - Make Non Click Through, NCTHROUGH
    Menu, Tray, Delete,  - Make Click Through
Return
   
NCTHROUGH:
    WinSet, ExStyle, -0x20L, ahk_id %WinID%
    Menu, Tray, Insert,  - Make Non Click Through,  - Make Click Through, CTHROUGH
    Menu, Tray, Delete,  - Make Non Click Through
    if (CTEnabled)
        Menu, Tray, Disable,  - Make Click Through
    CTEnabled := false
Return

END:
GuiEscape:
GuiClose:
    WinSet, AlwaysOnTop, Off, ahk_id %WinID%
	WinSet, Transparent, off, ahk_id %WinID%
	WinSet, ExStyle, -0x00000008L, ahk_id %WinID%
	WinSet, ExStyle, -0x20L, ahk_id %WinID%
ExitApp