;; the default EWOW setting script

;;
;; Load main libraries:
;;

#Include ewow.ahk
#Include fundamental.ahk

;;
;; "ewow.ahk" provides some basic functions and environment.
;; "fundamental.ahk" is implementations of fundamental Emacs commands
;; that works on Windows, under "ewow.ahk".
;;
;; You may also load some additional libraries here:
;;

#Include lib_autopair.ahk

;;
;; After load all libraries, you may do customizations.
;; Some examples are given below:
;;

;; the variable "ignored_frames" defines list of window-classes EWOW should be disabled in
ignored_frames = ConsoleWindowClass,cygwin/x X rl-xterm-XTerm-0,mintty,MEADOW,Vim,Emacs,XEmacs,SunAwtFrame,Xming X

;; enable following keybinds only when we are not in "ignored_frames" and C-x is not pressed
#If !ignored_frame() && !cx

;; bind "," to "smart_colon" command
,:: smart_colon()
;; "[" to "smart_bracket"
[:: smart_bracket()

;; '+' stands for "shift-"
+9:: insert_parentheses()
+[:: smart_brace()
+':: smart_dquot()

;; "^" stands for "ctrl-"
^h:: delete_backward_char()

;;
;; At last, load "keybinds.ahk" to enable default bindings for other keys.
;; This must be loaded AT LAST so that default bindings are given least priority.
;;
;; The list of available commands, and default keybinds are also found in that file.
;;

#Include keybinds.ahk
