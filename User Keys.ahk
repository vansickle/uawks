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


;; This file is a good place to put any
;; additional customations you want to
;; try out. Some examples are given
;; below. To use one of them, remove the
;; comment lines (/* and */) surrounding it.


;; This example gives you a small number of
;; volume presets that can be toggled with
;; one hand (if you enable the option to use
;; right option as an extra fn key):

/*
$p::FnKeyCall("p", "VolumeSet", "0")
$[::FnKeyCall("[", "VolumeSet", "33")
$]::FnKeyCall("]", "VolumeSet", "66")
$\::FnKeyCall("\", "VolumeSet", "100")

$-::FnKeyCall("-", "VolumeDown", "", false)
$=::FnKeyCall("=", "VolumeUp", "", false)
*/


;; This example lets you control the volume
;; setting in a very fine-grained way with
;; Fn + a number key:

/*
$`::FnKeyCall("``", "VolumeSet", "0")
$1::FnKeyCall("1", "VolumeSet", "10")
$2::FnKeyCall("2", "VolumeSet", "20")
$3::FnKeyCall("3", "VolumeSet", "30")
$4::FnKeyCall("4", "VolumeSet", "40")
$5::FnKeyCall("5", "VolumeSet", "50")
$6::FnKeyCall("6", "VolumeSet", "60")
$7::FnKeyCall("7", "VolumeSet", "70")
$8::FnKeyCall("8", "VolumeSet", "80")
$9::FnKeyCall("9", "VolumeSet", "90")
$0::FnKeyCall("0", "VolumeSet", "100")
*/

