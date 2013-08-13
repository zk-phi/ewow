;; this script provides : key-chord like features

;; Usage:
;;
;; f:: keychord("j", "backward_transpose_chars")
;; j:: keychord("f", "backward_transpose_chars")
;;
;; => press "f" and "j" simultaneously to invoke "backward_transpose_chars"

keychord_delay = 200            ; configurable

keychord_pred = 0               ; char waiting
keychord_pending = 0
keychord_fun = 0

keychord_pre_command()
{ Global
    If !keychord_pending
        Return
    If A_ThisHotKey not in %keychord_pending%
    {
        keychord_pending = 0
        SetTimer, keychord_timeout, off
        send(keychord_pred)
    }
}

keychord(pending, fun)
{ Global
    Local funname
    run_hooks("pre_command_hook")
    If keychord_pending
    {
        SetTimer, keychord_timeout, off
        StringSplit, keychord_pending, keychord_pending, `,
        keychord_pending = 0
        StringSplit, keychord_fun, keychord_fun, `,
        Loop, %keychord_pending0%
        {
            If keychord_pending%A_Index% = %A_ThisHotKey%
            {
                local funname := keychord_fun%A_Index%
                %funname%()
            }
        }
    }Else{
        keychord_pred := A_ThisHotKey
        keychord_pending := pending
        keychord_fun := fun
        SetTimer, keychord_timeout, %keychord_delay%
    }
    run_hooks("post_command_hook")
    Return

    keychord_timeout:
        keychord_pending = 0
        SetTimer, keychord_timeout, off
        send(keychord_pred)
        Return
}

add_hook("pre_command_hook", "keychord_pre_command")
