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


;;
;; Wrapper Functions for Fn Sequences
;;

FnKey(NormalAction, FnAction, FnActionIsDefault = false)
{
	global FnKeyPressed
    SetKeyDelay, -1
    if (FnKeyPressed = FnActionIsDefault) {
		Send {Blind}%NormalAction%
	} else {
		Send {Blind}%FnAction%
	}
}

FnKeyCall(NormalAction, FnActionCall, FnArgs = "", FnActionIsDefault = false)
{
	global FnKeyPressed
    SetKeyDelay, -1
    if (FnKeyPressed = FnActionIsDefault) {
		Send {Blind}%NormalAction%
	} else {
        %FnActionCall%(FnArgs)
	}
}


;;
;; Wrapper Functions for Optional Features
;;

PreferenceKeyDown(normalKey, pref, prefKey) {
	global
	SetKeyDelay, -1
	if (%pref%) {
		Send {Blind}{%prefKey% Down}
	} else {
		Send {Blind}{%normalKey% Down}
	}
}

PreferenceKeyUp(normalKey, pref, prefKey) {
	global
	SetKeyDelay, -1
	if (%pref%) {
		Send {Blind}{%prefKey% Up}
	} else {
		Send {Blind}{%normalKey% Up}
	}
}

PreferenceKeyFnDown(normalKey, pref) {
	global
	SetKeyDelay, -1
	if (%pref%) {
		FnKeyPressed := true
	} else {
		Send {Blind}%normalKey%
	}
}

PreferenceKeyFnUp(normalKey, pref) {
	global
	SetKeyDelay, -1
	if (%pref%) {
		FnKeyPressed := false
	} else {
		Send {Blind}%normalKey%
	}
}


;;
;; Volume Overlay and Helpers
;;

VolumeMute(dummyVar="") {
    Send {Volume_Mute}
	
	if (OptimizeForWindowsVista) {
		Return
	}
	
    GoSub, ProgressOff
    ShowVolume()
}

VolumeDown(dummyVar="") {
    global
	
	if (OptimizeForWindowsVista) {
		Send {Volume_Down}
		Return
	}
	
    SoundSet, -%VolumeDownRate%, Master, Volume
	if (SyncWaveVolumeToMasterVolume) {
		SoundGet, MasterVolume, Master, Volume
		SoundSet, MasterVolume, Wave, Volume
	}
    ShowVolume()
}

VolumeUp(dummyVar="") {
    global
	
	if (OptimizeForWindowsVista) {
		Send {Volume_Up}
		Return
	}
	
    SoundSet, +%VolumeUpRate%, Master, Volume
	if (SyncWaveVolumeToMasterVolume) {
		SoundGet, MasterVolume, Master, Volume
		SoundSet, MasterVolume, Wave, Volume
	}
    ShowVolume()
}

VolumeSet(NewVolume, UnMute = false) {
	global
	
	if (OptimizeForWindowsVista) {
		Return
	}
	
    SoundSet, %NewVolume%, Master, Volume
	if (SyncWaveVolumeToMasterVolume) {
		SoundSet, %NewVolume%, Wave, Volume
	}
    if (UnMute) {
        ; Avoid flicker if already unmuted
        SoundGet, IsMuted, Master, Mute
        if (IsMuted = "On") {
            SoundSet, Off, Master, Mute
            GoSub, ProgressOff
        }
    }
    ShowVolume()
}

ProgressOff:
	SetWinDelay, -1
    SetTimer ProgressOff, Off
	Sleep, 30
	Progress, 1: Off
Return

ShowVolume() {
    global
	
	if (OptimizeForWindowsVista) {
		Return
	}
	
    SoundGet, MasterVolume, Master, Volume
    SoundGet, WaveVolume, Wave, Volume
    
    IfWinNotExist, Master Volume
    {
        SoundGet, MasterMute, Master, Mute
        
        if (MasterMute = "on") {
            bgColor  = %MutedVolumeColorBg%
            barColor = %MutedVolumeColorBar%
        } else {
            bgColor  = %VolumeColorBg%
            barColor = %VolumeColorBar%
        }
        SetWinDelay, -1
		ColorStr = cw%bgColor% ct0000CC cb%barColor%
		SizeStr  =  h%OverlayHeight% w%OverlayWidth% zh%OverlayHeight% zx0 zy0
        Progress, 1: p%MasterVolume% b %SizeStr% %ColorStr%, , , Master Volume, Arial
        
		WinSet, Transparent, %OverlayTransparency%, Master Volume

        ;WinGetPos, X1, Y1, Width1, Height1, Master Volume
		if not OverlayDisplayCentered {
			WinMove, Master Volume, , 0, 0
		}
    }
    else
    {
        Progress, 1: %MasterVolume%
    }

    SetTimer ProgressOff, %OverlayDisplayTime%
}

ActiveWindowIsAMediaPlayer() {
	SetTitleMatchMode RegEx
	IfWinActive, ^Windows Media Player$
		Return true
	IfWinActive, ahk_class iTunes
		Return true
	IfWinActive, ahk_class MediaPlayerClassicW
		Return true
	Return false
}

;;
;; Media Key Support
;;

MediaCommandPrev(dummyVar="") {
    if (ActiveWindowIsAMediaPlayer()) {
		GoTo SendMediaCommandPrev
	}
	
	IfWinExist, ahk_class iTunes
	{
		ControlSend, ahk_parent, ^{Left}^{Left}
		return
	}
	
	SendMediaCommandPrev:
		Send, {Media_Prev}
}

MediaCommandPlay(dummyVar="") {
    if (ActiveWindowIsAMediaPlayer()) {
		GoTo SendMediaCommandPlay
	}
	
	IfWinExist, ahk_class iTunes
	{
		ControlSend, ahk_parent, ^{Space}
		return
	}
	
	SendMediaCommandPlay:
		Send, {Media_Play_Pause}
}

MediaCommandNext(dummyVar="") {
    if (ActiveWindowIsAMediaPlayer()) {
		GoTo SendMediaCommandNext
	}
	
	IfWinExist, ahk_class iTunes
	{
		ControlSend, ahk_parent, ^{Right}
		return
	}
	
	SendMediaCommandNext:
		Send, {Media_Next}
}

