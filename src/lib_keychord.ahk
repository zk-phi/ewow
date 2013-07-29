;; this script provides : key-chord like features

add_hook("pre_command_hook", "keychord_pre_command")

keychord_delay = 200

keychord_pred = 0
keychord_pending = 0

keychord_pre_command()
{ Global
    If keychord_pending && A_ThisHotKey != keychord_pending{
        keychord_pending = 0
        SetTimer, keychord_timeout, off
        send(keychord_pred)
    }
}

keychord(pending, fun)
{ Global
    run_hooks("pre_command_hook")
    If keychord_pending{
        keychord_pending = 0
        SetTimer, keychord_timeout, off
        %fun%()
    }Else{
        keychord_pred := A_ThisHotKey
        keychord_pending := pending
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
