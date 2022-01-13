; Created by 		Cristófano Varacolaci
; For 			 	ObsessedDesigns Studios™, Inc.
; Version 			1.0.0
; Build             10:30 2022.01.13
MENU:
	Menu, Tray, DeleteAll
	Menu, Tray, NoStandard
	Menu, Tray, Add, % TrayTitle, ABOUT
	Menu, Tray, Default, % TrayTitle
	Menu, Tray, Add,
	Menu, Tray, Add, &Select Window, SELECT
	Menu, Tray, Add,  - Make Transparent, TRANSP
	Menu, Tray, Add,  - Make Top Most, AONTOP
	Menu, Tray, Add,  - Make Click Through, CTHROUGH
	Menu, Tray, Add,
	Menu, Tray, Add, &About...,ABOUT
	Menu, Tray, Add, &Exit, END
	Menu, Tray, Tip, % PROGNAME VERSION

	Menu, Tray, Disable,  - Make Transparent
	Menu, Tray, Disable,  - Make Top Most
	Menu, Tray, Disable,  - Make Click Through
    Gosub, MAIN
Return

; [MENU ABOUT]
ABOUT:
    Gui,2:Destroy
	Gui 2:Font, s13 w600 c0x333333, Segoe UI
	Gui 2:Add, Text, x55 y3 w167 h23 +0x200, % PROGNAME
	Gui 2:Font
	Gui 2:Font, s8 c0x333333, Segoe UI
	Gui 2:Add, Text, x26 y22 w165 h23 +0x200, % ODESIGNS
	Gui 2:Font
	Gui 2:Font, s9 c0x333333
	Gui 2:Add, Text, x30 y50 w120 h23 +0x200, % "File Version:`t" VERSION
	Gui 2:Add, Text, x30 y70 w160 h23 +0x200, % "Release Date:`t" RELEASEDATE
	Gui 2:Font
	Gui 2:Font, s9 c0x808080, Segoe UI
	Gui 2:Add, Link, x46 y100 w171 h23, % "<a href=""" PROGNAME """>" AUTHOR "</a>"
	Gui 2:Font
	Gui 2:Add, Button, x83 y123 w44 h23 gGuiClose2, &OK

	Gui 2:Show, w210 h150, % "About"
Return

GUICLOSE2:
	Gui 2:Hide
Return
