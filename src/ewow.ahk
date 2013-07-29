;; This script provides: fundamental functions, environment

;; -------------------------
;; what this script provides
;; -------------------------

;; + send()       ... a wrapper function of "Send"
;; + macro_start(), macro_end(), macro_call()

;; + ignored_frame() ... decide if EWOW should be disbaled
;; => configure with "ignored_frames" variable

;; + last_command ... keys sent last
;; + arg          ... digit argument (> 0)
;; => automatically updated

;; + cx           ... true if C-x is prefixed
;; + mark         ... true if mark is active
;; => use setter functions

;; pre_command_hook
;; post_command_hook
;; after_change_hook
;; after_display_transition_hook
;; => use "add_hook" and "run_hooks"

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

;; -----------------
;; utility functions
;; -----------------

ignored_frames =

ignored_frame()
{ Global
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
after_display_transition_hook =

run_hooks(list)
{ Global
    Loop, Parse, %list%, `,, `r `n
    {
        If isFunc(A_LoopField)
            %A_LoopField%()
    }
}

add_hook(list, fun)
{ Local varname
    varname := %list%
    %list% = %varname%,%fun%
}

;; ----------------
;; send/record keys
;; ----------------

last_command =
macro_recording = 0
macro_count = 0

;; a wrapper function of "Send"
send(key)
{ Global
    Send, %key%
    last_command := key
    If macro_recording{
        macro_count++
        macro%macro_count% := key
        ToolTip, %key%, , , 3
    }
}

macro_start()
{ Global
    macro_recording = 1
    macro_count = 0
    ToolTip, REC, , , 3
}

macro_end()
{ Global
    macro_recording = 0
    ToolTip, , , , 3
}

macro_call()
{ Global
    Local varname
    Loop, %macro_count%{
        varname := macro%A_Index%
        Send, %varname%
    }
}

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
    arg_internal := arg * 10 + n
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
