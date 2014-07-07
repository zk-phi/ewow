;; This script provides: command skeletons

;; <function>

;; command_simple(str, [causechange 0], [repeatable 0])
;; ... send string as a command  (when causechange is t, call after_change_hook)

;; command_motion(str, [repeatable 0])
;; ... send string as a command that can expand the region

;; -----------------
;; command skeletons
;; -----------------

;; command_str(str, moves = 0, changes = 0, repeatable = 0, prestr = "", poststr = "")
;; { Global
;;     Local sendstr = make_str(str, (arg && repeatable) ? arg 1)
;;     If (moves && mark)
;;         sendstr = {shift down}%sendstr%{shift up}
;;     run_hooks("pre_command_hook")
;;     send(sendstr)
;;     run_hooks("post_command_hook")
;; }

;; command_function(fnname, changes = 0, repeatable = 0)
;; { Global
;;     run_hooks("pre_command_hook")
;;     Loop, % (arg && repeatable) ? arg : 1
;;         funcall(fnname)
;;     If changes
;;         run_hooks("after_change_hook")
;;     run_hooks("post_command_hook")
;; }

;; command that simply sends a key or calls a function
;; WILL BE OBSOLETE
command_simple(str, changes, repeatable)
{ Global
    run_hooks("pre_command_hook")
    If isFunc(str)
        Loop, % (arg && repeatable) ? arg : 1
            %str%()
    Else
        Loop, % (arg && repeatable) ? arg : 1
            send(str)
    If changes
        run_hooks("after_change_hook")
    run_hooks("post_command_hook")
}

;; a command that moves cursor position
;; WILL BE OBSOLETE
command_motion(str, repeatable)
{ Global
    run_hooks("pre_command_hook")
    If mark
        str = {shift down}%str%{shift up}
    Loop, % (arg && repeatable) ? arg : 1
        send(str)
    run_hooks("post_command_hook")
}

;; WILL BE OBSOLETE
command_abc(a, b, c, change)
{ Global
    run_hooks("pre_command_hook")
    send(a)
    Loop, % arg ? arg : 1
        send(b)
    send(c)
    If change
        run_hooks("after_change_hook")
    run_hooks("post_command_hook")
}

;; command that inserts a balanced expression
command_pair(str)
{ Global
    run_hooks("pre_command_hook")
    If mark
        send("^x")
    Loop, % arg ? arg : 1
        send(str)
    If mark
        send("^v")
    run_hooks("after_change_hook")
    run_hooks("post_command_hook")
}

;; command that selects something
command_mark(str)
{
    run_hooks("pre_command_hook")
    send(str)
    set_mark()
    run_hooks("post_command_hook")
}
