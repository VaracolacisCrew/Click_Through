; Created by 		Cristófano Varacolaci
; For 			 	ObsessedDesigns Studios™, Inc.
; Version 			1.0.0
; Build             10:30 2022.01.13
/*
**************************
PROGRAM VARIABLES GLOBALS
**************************
*/
global PROGNAME 			:= "Click Through"
global VERSION 				:= "1.0.0.0"
global RELEASEDATE 			:= "Jan 13, 2022"
global AUTHOR 				:= "Cristófano Varacolaci"
global ODESIGNS 			:= "obsessedDesigns Studios™, Inc."
global AUTHOR_PAGE 			:= "http://obsesseddesigns.com"
global AUTHOR_MAIL 			:= "cristo@obsesseddesigns.com"

global DATA_FOLDER			:= "Data"
global CONFIGURATION_FILE	:= % Data . "\__settings.ini"

global H_Compiled := RegexMatch(Substr(A_AhkPath, Instr(A_AhkPath, "\", 0, 0)+1), "iU)^(Click Through).*(\.exe)$") && (!A_IsCompiled) ? 1 : 0
global mainIconPath := H_Compiled || A_IsCompiled ? A_AhkPath : "Data\icons\main.ico"

;read ini file for VARIABLES
variablesFromIni(CONFIGURATION_FILE)

VERSION := SYSTEM_version
VERSION := ((!VERSION) ? ("1.0.0.0") : (VERSION))

ini_LANG := SYSTEM_lang
ini_LANG := ((!ini_LANG) ? ("english") : (ini_LANG))


;---- [initial values]
TrayTitle           :=  PROGNAME WinName 
SelectWindowTt      :=  "Select window"

;---- [Initilization]
Change_Icon(mainIconPath)