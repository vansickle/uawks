;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                                                           ;;
;;                 Unofficial Apple Wireless Keyboard Support                ;;
;;                       http://code.google.com/p/uawks/                     ;;
;;                                                                           ;;
;;                            Version 2008.09.17                             ;;
;;                                                                           ;;
;;                            by Brian Jorgensen                             ;;
;;                   (based on work by Leon, Veil and Micha)                 ;;
;;                                                                           ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                                                           ;;
;;         See Readme.txt for info on installation and customization         ;;
;;                                                                           ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


SetWorkingDir %A_ScriptDir%

#SingleInstance force
#KeyHistory 100
#NoEnv

;; Notification icon and menu, config file
#Include User Preferences.ahk

;; Interface with the bluetooth HID driver
#Include FnMapper.ahk

;; Convenience functions, volume overlay GUI
#Include AWK Library.ahk

;; Key bindings start here (they have to go after
;; the 'autoexecute' stuff above)
#Include System Keys.ahk
#Include Media Keys.ahk
#Include Navigation Keys.ahk

;; Put your custom bindings in "User Keys.ahk"
;; if possible:
#Include User Keys.ahk

