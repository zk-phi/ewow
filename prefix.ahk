;; This script provides: mark, prefix C-x, prefix argument

;; <variables>

;; - cx   ... true if C-x is prefixed
;; - mark ... true if mark is active
;; - arg  ... digit argument as an integer

;; <setters>

;; - set_cx()/reset_cx()
;; - set_mark()/reset_mark()
;; - set_digit_argument(n)

prefix_tt := alloc_tt()
mark_tt := alloc_tt()

;; --------------
;; set/reset mark
;; --------------

mark = 0

set_mark()
{ Global
    mark := 1
    ToolTip, mark, 45, 0, %mark_tt%
}

reset_mark()
{ Global
    mark := 0
    ToolTip, , , , %mark_tt%
}

add_hook("after_change_hook", "reset_mark")
add_hook("after_display_transition_hook", "reset_mark")

;; ----------
;; prefix C-x
;; ----------

cx = 0

set_cx()
{ Global
    cx := 1
    ToolTip, C-x -, 1, 0, %prefix_tt%
}

reset_cx()
{ Global
    cx := 0
    ToolTip, , , , %prefix_tt%
}

add_hook("pre_command_hook", "reset_cx")

;; --------------
;; digit argument
;; --------------

arg = 0
arg_internal = 0

set_digit_argument(n)
{ Global
    arg_internal := n
    ToolTip, %arg_internal%, 1, 0, %prefix_tt%
}

;; retrive arg from arg_internal
get_argument()
{ Global
    arg := arg_internal
    arg_internal = 0
    ToolTip, , , , %prefix_tt%
}

add_hook("pre_command_hook", "get_argument")
