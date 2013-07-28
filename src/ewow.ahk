;; This script provides: fundamental functions, environment

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

ignored_frame()
{ Global
    WinGetClass, test, A
    If test in %ignored_frames%
        Return 1
    Else
        Return 0
}

;; all send commands must be done via this function,
;; so that kmacro can record it
send(key)
{
    Send, %key%
    command_history_update(key)
}

;; ----------------
;; alttab detection
;; ----------------

alt_pressed = 0

#If, alt_pressed
alt up:: alttab_end()
#If,
!tab:: alttab_next()

alttab_next()
{ Global
    reset_cx()
    alt_pressed = 1
    send("{alt down}{tab}")
    reset_mark()
    after_display_transition_hook()
}

alttab_end()
{ Global
    alt_pressed = 0
    send("{alt up}")
}

;; ---
;; C-x
;; ---

cx = 0

set_cx()
{ Global
    cx = 1
    ToolTip, C-x -, 1, 0, 1
}

reset_cx()
{ Global
    cx = 0
    ToolTip, , , , 1
}

;; ----
;; mark
;; ----

mark = 0

set_mark()
{ Global
    mark = 1
    ToolTip, mark, 45, 0, 2
}

reset_mark()
{ Global
    mark = 0
    ToolTip, , , , 2
}

;; --------------------------------
;; keyboard macro / command history
;; --------------------------------

;; should ewow record mouse clicks too ?

kmacro_recording = 0
kmacro_count = 0
kmacro =
last_command =

command_history_update(key)
{ Global
    last_command := key
    If kmacro_recording
    {
        ToolTip, %key%, , , 3
        kmacro_count++
        kmacro%kmacro_count% := key
    }
}

set_macro()
{ Global
    kmacro_recording = 1
    kmacro_count = 0
    ToolTip, REC, , , 3
}

reset_macro()
{ Global
    kmacro_recording = 0
    ToolTip, , , , 3
}

;; --------------
;; digit argument
;; --------------

digit_argument = 0

digit_argument()
{ local tmp
    StringTrimLeft, tmp, A_ThisHotKey, 1
    digit_argument *= 10
    digit_argument += %tmp%
    ToolTip, %digit_argument%, 1, 0, 1
}

get_argument()
{ local tmp
    tmp = % digit_argument ? digit_argument : 1
    digit_argument = 0
    ToolTip, , 1, 0, 1
    Return tmp
}
