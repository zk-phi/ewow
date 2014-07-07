;; This script provides: fundamental functions, environment

;; <utility functions>

;; - foreach(list, fnname)               ... apply function to all elements in a list
;; - add_to_list(listname, element)      ... add an element to a list
;; - remove_from_list(listname, element) ... remove an element from a list

;; - make_str(str, n) ... repeat str n-times

;; - funcall(fnname) ... call fucntion with no arguments

;; <functions>

;; - ignored_frame() ... decide if EWOW should be quiet
;; => configure with "ignored_frames" variable

;; - alloc_tt() ... get an id for ToolTip

;; <commands>

;; - send(str) ... a wrapper function of "Send"
;; => ALWAYS USE THIS FUNCTION TO SEND KEYS TO WINDOWS

;; - read_char() ... steal one event from send() and return it

;; <hooks>

;; - pre_command_hook  ... all commands must run at the very beginning
;; - post_command_hook ... all commands must run at the very end
;; - after_change_hook ... all commands must run just after changes
;; => use "run_hooks" to run

;; - before_send_hook              ... automatically run before send()
;; - after_send_hook               ... automatically run after send()
;; - after_display_transition_hook ... automatically run after display transitions
;; => run automatically

;; - add_hook(hookname, fnname)    ... add a function to a hook
;; - remove_hook(hookname, fnname) ... remove a function from a hook
;; - run_hooks(hookname)           ... run all functions in a hook

;; <variables>

;; - last_command   ... the last event (being) sent with send()
;; => you may assume that this variable is already updated in before_send_hook

;; <settings>

;; - ignored_frames ... list of window-classes in which EWOW should be quiet

;; --------------
;; (AHK Tutorial)
;; --------------

;; funname()
;; { Global                     <- use global variables
;;     Local foo                <- but keep variable "foo" local
;;     foo = foo                <- set foo to a string literal "foo"
;;     foo = %foo%              <- set foo to a foo's value
;;     foo := foo               <- (equivalent)
;;     foo = %foo%bar           <- concatenate foo's value and a string literal "bar"
;;     foo .= bar               <- (equivalent)
;;     MsgBox foo is %foo%      <- call command MsgBox with "foo is %foo%"
;;     MsgBox % "foo is " . foo <- equivalent to the previous line
;;     message("foo is " . foo) <- call function message with "foo is %foo%"
;;     message(foo is %foo%)     <- (NO GOOD)
;; }

;; ------------------
;; AHK configurations
;; ------------------

#SingleInstance
#NoEnv
#InstallKeybdHook
#InstallMouseHook
#UseHook
#MaxHotkeysPerInterval 100

SetBatchLines, -1
SetKeyDelay, 0
Sendmode, Input
;; Sendmode, Event
;; CoordMode, Mouse, Screen

;; -----------------
;; Utility Functions
;; -----------------

foreach(list, fnname)
{ Global
    Loop, Parse, list, `,, `r `n
        %fnname%(A_LoopField)
}

add_to_list(listname, element)
{ Global
    Local list
    list := %listname%        ; list = (eval (symbol-value 'listname))
    If element in %list%
        Return
    If list !=
        %listname% = %list%,%element%
    Else
        %listname% = %element%
}

remove_from_list(listname, element)
{ Global
    Local list, regex
    list := %listname%
    regex = ,?%element%
    %listname% := RegExReplace(list, regex, "")
}

funcall(fnname)
{ Global
    If isFunc(fnname)
        %fnname%()
}

make_str(str, n)
{
    out =
    Loop, %n%
        out .= str
    Return out
}

;; -----
;; Hooks
;; -----

pre_command_hook =
post_command_hook =
after_change_hook =
;; => call manually

before_send_hook =
after_send_hook =
;; => called by send()

after_display_transition_hook =
;; => called on WinEventHook

run_hooks(hookname)
{ Global
    foreach(%hookname%, "funcall")
}

remove_hook(hookname, fnname)
{
    remove_from_list(hookname, fnname)
}

add_hook(hookname, fnname)
{
    add_to_list(hookname, fnname)
}

;; ----
;; Send
;; ----

read_char_waiting = 0
last_command =

;; a wrapper function of "Send"
send(str)
{ Global
    last_command := str
    run_hooks("before_send_hook")
    If read_char_waiting
        read_char_waiting = 0
    Else
        Send, %last_command%
    run_hooks("after_send_hook")
}

read_char()
{ Global
    read_char_waiting = 1
    While read_char_waiting
    {}
    Return last_command
}

;; -------------------------
;; Detect Display Transition
;; -------------------------

;; taken from
;; https://sites.google.com/site/agkh6mze/howto/winevent

dt_callback(a, b, c, d, e, f, g)
{
    run_hooks("after_display_transition_hook")
}

dt_event_proc := RegisterCallback("dt_callback")

DllCall("SetWinEventHook"
    , "UInt", 0x00000003, "UInt", 0x00000003, "UInt", 0
    , "UInt", dt_event_proc, "UInt", 0, "UInt", 0, "UInt", 0x0003, "UInt")

;; --------------
;; Ignored Frames
;; --------------

ignored_frames = ConsoleWindowClass,cygwin/x X rl-xterm-XTerm-0,mintty,MEADOW,Vim,Emacs,XEmacs,SunAwtFrame,Xming X,VMPlayerFrame

;; decide if ewow should be quiet
ignored_frame()
{ Global
    Local class
    WinGetClass, class, A
    If class in %ignored_frames%
        Return 1
    Else
        Return 0
}

;; -----------------
;; Manage ToolTip ID
;; -----------------

;; alloc_tt() allocates an id for the new ToolTip
;; and returns it

tt_count = 0

alloc_tt()
{ Global
    tt_count++
    Return tt_count
}
