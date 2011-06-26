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
;; Media Keys {Apple Fn Key}-(F7, F8, F9)
;;

$F7::FnKeyCall("{F7}", "MediaCommandPrev", "", MediaControlsAreDefault)
$F8::FnKeyCall("{F8}", "MediaCommandPlay", "", MediaControlsAreDefault)
$F9::FnKeyCall("{F9}", "MediaCommandNext", "", MediaControlsAreDefault)


;;
;; Volume Controls {Apple Fn Key}-(F10, F11, F12)
;;

$F10::FnKeyCall("{F10}", "VolumeMute", "", VolumeControlsAreDefault)
$F11::FnKeyCall("{F11}", "VolumeDown", "", VolumeControlsAreDefault)
$F12::FnKeyCall("{F12}", "VolumeUp", "", VolumeControlsAreDefault)

