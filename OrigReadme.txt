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


  OVERVIEW
-------------------------------------------------------------------------------

  Unofficial Apple Wireless Keyboard Support (UAWKS) is a small package that
  allows Windows users to make full use of Apple's uber-sexy bluetooth keyboard.
  Most importantly, it provides support for essential keys that don't work out
  of the box:

          | Function                    | Key Combination            |
          |----------------------------------------------------------|
          | Forward Delete              | Fn + Delete                |
          | Home, End, Page Up and Down | Fn + Arrow Keys            |
          | Media and volume control    | Fn + F7-F12                |
          | Print Screen                | Fn + F3                    |
          | CTRL-ALT-DEL                | Control + Alt + Delete     |
          | Eject                       | Eject                      |

  Other features (enable expert mode, then right-click the notification icon to
  toggle optional ones):

  - Translucent volume overlay (optional, uncheck "I use Windows Vista").
  - Use Command (Apple) keys as Control keys (optional, on by default).
  - Use left control as a Windows key (optional, on by default).
  - Use media/volume keys without holding down Fn (optional).
  - Use Control-` as Shift-Control-Tab (optional).
  - Use Right Option key as an extra Fn key (optional).
  - Use caps lock as an extra control key (optional).


  SOURCE
-------------------------------------------------------------------------------

  See http://code.google.com/p/uawks/


  RELEASE NOTES
-------------------------------------------------------------------------------

  2008.9.17
  
    - Experimental bug fixes for Vista and European keyboard layouts

	- RAlt keyboard hooks are now bound at run-time to avoid messing with AltGr
	    (disable "Use right option key as extra fn key" in the expert menu)

	- Added expert menu option to disable volume overlays and use media keys
	    instead of AutoHotkey's SoundGet and SoundSet (incompatible with Vista)


  2008.8.16
  
    - Added expert configuration mode, defaults to more beginner-friendly mode
	
    - Added ability to sync wave device
	
    - Created separate source installer


  2008.8.13
  
    - Minor bugfix release


  2008.8.12
  
    - First release


  ACKNOWLEDGEMENTS
-------------------------------------------------------------------------------

  - UAWKS is implemented with AutoHotkey (http://www.autohotkey.com/)

  - The code which interfaces with bluetooth HID devices was created by Micha.

  - Code which adapts this for use with the Apple Wireless Keyboard was
    originally created by Veil (see http://yotz.eu/fnkey/ for more information
    from Veil about using Micha's DLL with bluetooth devices).
