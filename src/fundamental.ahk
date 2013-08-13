;; This script provides: fundamental functions, environment

;; -------------------------
;; what this script provides
;; -------------------------

;; + send()       ... a wrapper function of "Send"
;; => ALWAYS USE THIS FUNCTION

;; + read_char() ... steals one event and returns it

;; + ignored_frame() ... decide if EWOW should be disbaled
;; => configure with "ignored_frames" variable

;; + last_command ... keys sent last
;; + arg          ... digit argument (> 0)
;; => automatically updated

;; + cx           ... true if C-x is prefixed
;; + mark         ... true if mark is active
;; => use setter functions

;; + alloc_tt() ... allocate a tooltip id

;; pre_command_hook
;; post_command_hook
;; after_change_hook
;; => use "add_hook" and "run_hooks"

;; after_send_hook
;; after_display_transition_hook
;; => use "add_hook". runned automatically

;; ------------------
;; AHK configurations
;; ------------------

#SingleInstance
#NoEnv
#InstallKeybdHook
#UseHook
#MaxHotkeysPerInterval 100

SetBatchLines, -1
SetKeyDelay, 0
Sendmode Input

;; --------------------
;; check ignored frames
;; --------------------

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

;; -----
;; hooks
;; -----

pre_command_hook =
post_command_hook =
after_change_hook =
;; => call manually

after_send_hook =
;; => called by send()

after_display_transition_hook =
;; => called on WinEventHook

run_hooks(name)
{ Global
    Loop, Parse, %name%, `,, `r `n
    {
        If isFunc(A_LoopField)
            %A_LoopField%()
    }
}

remove_hook(name, fun)
{ Global
    Local list, regex
    list := %name%
    regex = ,?%fun%
    %name% := RegExReplace(list, regex, "")
}

add_hook(name, fun)
{ Global
    Local list
    list := %name%
    If fun in %list%
        Return
    If list !=
        %name% = %list%,%fun%
    Else
        %name% = %fun%
}

;; ---------
;; send keys
;; ---------

read_char_waiting = 0
last_command =

;; a wrapper function of "Send"
send(key)
{ Global
    last_command := key
    If !read_char_waiting
        Send, %key%
    Else
        read_char_waiting = 0
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
;; detect display transition
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

;; -------------
;; set/reset C-x
;; -------------

cx = 0

set_cx()
{ Global
    cx := 1
    ToolTip, C-x -, 1, 0, 1
}

reset_cx()
{ Global
    cx := 0
    ToolTip, , , , 1
}

add_hook("pre_command_hook", "reset_cx")

;; --------------
;; set/reset mark
;; --------------

mark = 0

set_mark()
{ Global
    mark := 1
    ToolTip, mark, 45, 0, 2
}

reset_mark()
{ Global
    mark := 0
    ToolTip, , , , 2
}

add_hook("after_change_hook", "reset_mark")
add_hook("after_display_transition_hook", "reset_mark")

;; --------------
;; digit argument
;; --------------

arg = 0
arg_internal = 0

set_digit_argument(n)
{ Global
    arg_internal := n
    ToolTip, %arg_internal%, 1, 0, 1
}

;; retrive arg from arg_internal
get_argument()
{ Global
    arg := arg_internal
    arg_internal = 0
    ToolTip, , , , 1
}

add_hook("pre_command_hook", "get_argument")

;; -----------
;; allocate tt
;; -----------

;; there are two ToolTips by default :
;; 1 ... reserved by C-x / digit-argument
;; 2 ... reserved by mark

;; alloc_tt() allocates an id for the new ToolTip
;; and returns it

tt_count = 2

alloc_tt()
{ Global
    tt_count++
    Return tt_count
}
