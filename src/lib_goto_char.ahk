;; This script provides: goto_char command / function

gc_tt := alloc_tt()

;; --------
;; function
;; --------

gc_last_char =

search_one_char_again()
{ Global
    send("^f")
    send(gc_last_char)
    send("{enter}{escape}")
}

search_one_char()
{ Global
    ToolTip, GotoChar:, , , %gc_tt%
    gc_last_char := read_char()
    ToolTip, , , , %gc_tt%
    search_one_char_again()
}

;; -------
;; command
;; -------

goto_char()
{
    run_hooks("pre_command_hook")
    search_one_char()
    send("{left}")
    run_hooks("post_command_hook")
}

goto_char_repeat()
{
    run_hooks("pre_command_hook")
    search_one_char_again()
    send("{left}")
    run_hooks("post_command_hook")
}
