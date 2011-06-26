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
;$*LCtrl::PreferenceKeyDown("LCtrl", "RemapLeftControlToWindows", "Control Up}{LWin")
;$*LCtrl Up::PreferenceKeyUp("LCtrl", "RemapLeftControlToWindows", "LWin")

;;Alt-Shift -> Switch Layout
;$*!Space::
;Alt & Space::
;	SetKeyDelay, -1
;	Send {Alt Up}
;	Send {Space Up}
;	GetKeyState, state, Alt
;	if state = D
;		SoundBeep
;	SendInput {Ctrl down}{Shift down}{Shift up}{Ctrl up}
;	return

;; {Apple Command Key} --> {Control}
$*LWin::
;global
	LWinVar := 1
	SetKeyDelay, -1
	Send {Blind}{LCtrl Down}
	return
$*Space::
	if LWinVar = 1
	{
		SetKeyDelay, -1
		Send {Blind}{LCtrl Up}
		LWinVar = 0
		
		SendInput !{Space}
	}
	else
	{
		GetKeyState, state, Alt
		if state = D
		{
			Send {Ctrl down}
			Send {Ctrl up}
			Send {Blind}{Alt Up}
			SendInput {Ctrl down}{Shift down}{Shift up}{Ctrl up}		
		}
		else
			Send {Blind}{Space}
	}
		;SendInput {Raw}
		;Send {Blind}{Space}
	return
$*LWin Up::
	SetKeyDelay, -1
	Send {Blind}{LCtrl Up}
	LWinVar := 0
	return

;$LWin::PreferenceKeyDown("LWin", "RemapCommandToControl", "LCtrl")
;$LWin Up::PreferenceKeyUp("LWin", "RemapCommandToControl", "LCtrl")
$*RWin::PreferenceKeyDown("RWin", "RemapCommandToControl", "RCtrl")
$*RWin Up::PreferenceKeyUp("RWin", "RemapCommandToControl", "RCtrl")

;; Cmd-Space -> Alt-Space (to use app launchers like Launchy the same as Spotlight in mac, cause in Win7 we can't use Win-Space directly)
;$LWin Space::SendInput !{Space}
;#Space::SendInput !{Space}
;LWin & Space::SendInput !{Space}
;{LWin Down}{Space Down}{Space Up}{LWin}::SendInput !{Space}
;#Space::
;^Space::SendInput !{Space}

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
;$*Backspace::FnKey("{Backspace}", "{Delete}")

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
		Send, {Blind}{LWin Down}
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
		Send, {Blind}{LWin Up}
	}
	Return

