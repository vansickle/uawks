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


;; {Left Control} --> {Windows Key}
$*LCtrl::PreferenceKeyDown("LCtrl", "RemapLeftControlToWindows", "Control Up}{LWin")
$*LCtrl Up::PreferenceKeyUp("LCtrl", "RemapLeftControlToWindows", "LWin")

;; {Apple Command Key} --> {Control}
$*LWin::PreferenceKeyDown("LWin", "RemapCommandToControl", "LCtrl")
$*LWin Up::PreferenceKeyUp("LWin", "RemapCommandToControl", "LCtrl")
$*RWin::PreferenceKeyDown("RWin", "RemapCommandToControl", "RCtrl")
$*RWin Up::PreferenceKeyUp("RWin", "RemapCommandToControl", "RCtrl")

;; {Right Alt} --> {Apple Fn Key}
RAltFnKeyDown:
	PreferenceKeyFnDown("{RAlt Down}", "RemapRightOptionToFn")
	return
RAltFnKeyUp:
	PreferenceKeyFnUp("{RAlt Up}", "RemapRightOptionToFn")
	return
; Trying to fix problems with AltGr, mostly on european layouts
RAltFnKeyEnable() {
	Hotkey, $*RAlt, RAltFnKeyDown, On UseErrorLevel
	Hotkey, $*RAlt Up, RAltFnKeyUp, On UseErrorLevel
}
RAltFnKeyDisable() {
	Hotkey, $*RAlt, Off, UseErrorLevel
	Hotkey, $*RAlt Up, Off, UseErrorLevel
}

;; {Apple Fn Key}-{Backspace} --> {Forward Delete}
$*Backspace::FnKey("{Backspace}", "{Delete}")

;; {Apple Fn Key}-{F3} --> {Print Screen}
$F3::FnKey("{F3 Down}", "", false)
$F3 Up::FnKey("{F3 Up}", "{PrintScreen}", false)

;; {Control}-{Alt}-{Backspace} --> Ctrl-Alt-Delete
#!Backspace::
^!Backspace::Run taskmgr.exe

;; {Capslock} --> {Control}
$*CapsLock::
	SetKeyDelay, -1
	if (RemapCapsLockToControl) {
		Send, {Blind}{Control Down}
	} else {
		if (GetKeyState("CapsLock", "T")) {
			SetCapsLockState, Off
		} else {
			SetCapsLockState, On
		}
		KeyWait, CapsLock
	}
	Return

$*CapsLock Up::
	SetKeyDelay, -1
	if (RemapCapsLockToControl) {
		Send, {Blind}{Control Up}
	}
	Return

