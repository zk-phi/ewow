;; the default EWOW setting script

;;
;; THEY *MUST BE* DEFINED BEFORE LOADING LIBRARIES:
;;
;; - ignored_frames
;;
;;   list of window-classes in which EWOW should be disabled
;;
;; - after_display_transition_hook()
;;
;;   a function which runs each time on display transition
;;

ignored_frames = ConsoleWindowClass,cygwin/x X rl-xterm-XTerm-0,mintty,MEADOW,Vim,Emacs,XEmacs,SunAwtFrame,Xming X

after_display_transition_hook()
{
}

;;
;; Now we are ready to load main libraries:
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
;; After load libraries, you may do some customizations.
;; Examples are given below:
;;

;; enable following keybinds only when
;; we are not in "ignored_frames" and C-x is not pressed
#If !ignored_frame() && !cx

;; bind "," to "smart_colon" command
,:: smart_colon()
;; "[" to "smart_bracket"
[:: smart_bracket()

;; '+' stands for "shift-"
+9:: smart_paren()
+[:: smart_brace()
+':: smart_dquot()

;; "^" stands for "ctrl-"
^h:: delete_backward_char()

;;
;; At last, load "keybinds.ahk" to enable default bindings for other keys.
;; This must be loaded AT LAST so that default bindings are given least priority.
;;

#Include keybinds.ahk
