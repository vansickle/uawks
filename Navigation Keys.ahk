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


;; {Apple Fn Key}-{Arrow Keys} --> {Home, End, PgUp, PgDn}
$*Left::FnKey("{Left}", "{Home}")
$*Right::FnKey("{Right}", "{End}")
$*Up::FnKey("{Up}", "{PgUp}")
$*Down::FnKey("{Down}", "{PgDn}")

;; {Control}-{Backquote} --> {Control}-{Shift}-{Tab}
^`::
	SetKeyDelay, -1
	if (RemapControlBackquote) {
		Send, ^+{Tab}
	} else {
		Send, ^`
	}
	Return

