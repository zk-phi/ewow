;; This script provides: vim-like commands

;; This script depends on:
#Include lib_goto_char.ahk

evil_tt := alloc_tt()

evil_disable_frames = ,#32770,DV2ControlHost,Shell_TrayWnd ; configurable
evil_auto_mode = 0              ; configurable
evil_mode_hook =                ; configurable

;; ---------
;; variables
;; ---------

evil = 0
preg = 0

set_evil()
{ Global
    evil = 1
    ToolTip, Vi, 1, 0, %evil_tt%
}

reset_evil()
{ Global
    evil = 0
    ToolTip, , , , %evil_tt%
}

set_preg()
{ Global
    If !evil
        Return
    preg = 1
    ToolTip, Vi g, 1, 0, %evil_tt%
}

reset_preg()
{ Global
    If !evil
        Return
    preg = 0
    ToolTip, Vi, 1, 0, %evil_tt%
}

add_hook("after_display_transition_hook", "reset_evil")
add_hook("pre_command_hook", "reset_preg")

;; -------------------------
;; automatically enable evil
;; -------------------------

evil_frames =
IniRead, evil_frames, evil.ini, auto_evil, evil_frames

evil_auto_activate()
{ Global
    Local class
    WinGetClass, class, A
    If evil_auto_mode
        If class in %evil_frames%
            set_evil()
}

evil_frames_update()
{ Global
    Local class
    If evil_auto_mode
    {
        WinGetClass, class, A
        add_hook("evil_frames", class) ; add_to_list
        IniWrite, %evil_frames%, evil.ini, auto_evil, evil_frames
    }
}

add_hook("after_display_transition_hook", "evil_auto_activate")
add_hook("evil_mode_hook", "evil_frames_update")

;; -----------------
;; command skeletons
;; -----------------

evil_pending =
evil_last_sent =
evil_pending_will_change =

evil_command_operator(callback, change)
{ Global
    run_hooks("pre_command_hook")
    If evil_pending
        send("{home}{shift down}{end}{right}{shift up}")
    Else If mark
    {
        If isFunc(callback)
            %callback%()
        Else
            send(callback)
        If change
            run_hooks("after_change_hook")
        Else
            reset_mark()
    }Else
    {
        ToolTip, Vi %A_ThisHotKey%, 1, 0, %evil_tt%
        set_mark()
        evil_pending := callback
        evil_last_sent := last_command
        evil_pending_will_change := change
    }
    run_hooks("post_command_hook")
}

evil_post_command()
{ Global
    If evil_pending
        If evil_last_sent != %last_command%
            evil_run_callback()
}

evil_run_callback()
{ Global
    If isFunc(evil_pending)
        %evil_pending%()
    Else
        send(evil_pending)
    If evil_pending_will_change
        run_hooks("after_change_hook")
    Else
        reset_mark()
    evil_pending = 0
    If evil
        ToolTip, Vi, 1, 0, %evil_tt%
}

evil_command_insert(str, change)
{ Global
    run_hooks("pre_command_hook")
    reset_evil()
    evil_pending = 0
    send(str)
    If change
        run_hooks("after_change_hook")
    run_hooks("post_command_hook")
}

add_hook("post_command_hook", "evil_post_command")

;; --------------------
;; fundamental commands
;; --------------------

evil_mode()
{ Global
    Local class
    WinGetClass, class, A
    If class in %evil_disable_frames%
        keyboard_quit()
    Else
    {
        run_hooks("pre_command_hook")
        set_evil()
        run_hooks("evil_mode_hook")
        run_hooks("post_command_hook")
    }
}

evil_keyboard_quit()
{ Global
    run_hooks("pre_command_hook")
    send("{escape}")
    evil_pending = 0
    reset_mark()
    reset_preg()
    set_evil()
    run_hooks("post_command_hook")
}

evil_preg()
{ Global
    run_hooks("pre_command_hook")
    set_digit_argument(arg)
    set_preg()
    run_hooks("post_command_hook")
}

evil_digit_argument()
{ Global
    run_hooks("pre_command_hook")
    set_digit_argument(arg * 10 + A_ThisHotKey)
    run_hooks("post_command_hook")
}

evil_toggle_macro()
{ Global
    If kmacro_recoding
        kmacro_end_macro()
    Else
        kmacro_start_macro()
}

evil_reflesh()
{
    command_simple("{f5}", 0, 0)
}

evil_ex_command()
{ Global
    Local ch
    run_hooks("pre_command_hook")
    reset_evil()
    ToolTip, Vi :, 1, 0, %evil_tt%
    ch := read_char()
    set_evil()
    If ch = s
        send("^t")              ; split_window
    Else If ch = b
        send("^{tab}")          ; next_buffer
    Else If ch = e
        send("^o")              ; open_file
    Else If ch = w
        send("^s")              ; write_file
    Else If ch = q
        send("!{F4}")           ; quit
    run_hooks("post_command_hook")
}

;; ---------
;; operators
;; ---------

evil_op_change()
{
    evil_command_operator("evil_op_change_callback", 1)
}

evil_op_change_callback()
{
    send("^x")
    reset_evil()
    evil_pending = 0
}

evil_op_copy()
{
    evil_command_operator("^c", 0)
}

evil_op_delete()
{
    evil_command_operator("^x", 1)
}

evil_op_case_conv()
{
    evil_command_operator("evil_op_case_conv_callback", 1)
}

evil_op_case_conv_callback()
{
    safe_cut()
    If RegExMatch(ClipBoard, "[A-Z]")
        StringLower, ClipBoard, ClipBoard
    Else
        StringUpper, ClipBoard, ClipBoard
    send("^v")
}

evil_op_uppercase()
{
    evil_command_operator("evil_op_uppercase_callback", 1)
}

evil_op_uppercase_callback()
{
    safe_cut()
    StringUpper, ClipBoard, ClipBoard
    send("^v")
}

evil_op_lowercase()
{
    evil_command_operator("evil_op_lowercase_callback", 1)
}

evil_op_lowercase_callback()
{
    safe_cut()
    StringLower, ClipBoard, ClipBoard
    send("^v")
}

;; ---------
;; goto_char
;; ---------

evil_last_jump =

evil_find()
{ Global
    Local winname
    evil_last_jump = find
    run_hooks("pre_command_hook")
    WinGetTitle, winname, A
    reset_evil()
    search_one_char()
    send("{left}{right}")
    ;; without waiting, "Evil" tooltip
    ;; perhaps appears in the search window
    WinWaitActive, %winname%
    set_evil()
    run_hooks("post_command_hook")
}

evil_till()
{ Global
    Local winname
    evil_last_jump = till
    run_hooks("pre_command_hook")
    WinGetTitle, winname, A
    reset_evil()
    search_one_char()
    send("{left}")
    ;; without waiting, "Evil" tooltip
    ;; perhaps appears in the search window
    WinWaitActive, %winname%
    set_evil()
    run_hooks("post_command_hook")
}

evil_goto_char_repeat()
{ Global
    run_hooks("pre_command_hook")
    search_one_char_again()
    If evil_last_jump = find
        send("{left}{right}")
    Else If evil_last_jump = till
        send("{left}")
    run_hooks("post_command_hook")
}

;; ------
;; motion
;; ------

evil_beginning_of_previous_line()
{
    command_motion("{up}{home}", 1)
}

evil_beginning_of_next_line()
{
    command_motion("{down}{home}", 1)
}

evil_goto_line()
{ Global
    Local str
    run_hooks("pre_command_hook")
    If mark
    {
        send("{shift down}^{home}{shift up}")
        str = {shift down}{down}{shift up}
    }Else{
        send("^{home}")
        str = {down}
    }
    Loop, % arg ? arg - 1 : 0
        send(str)
    run_hooks("post_command_hook")
}

evil_goto_line_negative()
{ Global
    Local str
    run_hooks("pre_command_hook")
    If mark
    {
        send("{shift down}^{end}{home}{shift up}")
        str = {shift down}{up}{shift up}
    }Else{
        send("^{end}{home}")
        str = {up}
    }
    Loop, % arg ? arg - 1 : 0
        send(str)
    run_hooks("post_command_hook")
}

evil_goto_col()
{ Global
    Local str
    run_hooks("pre_command_hook")
    If mark
    {
        send("{shift down}{home}{shift up}")
        str = {shift down}{right}{shift up}
    }Else{
        send("{home}")
        str = {right}
    }
    Loop, % arg ? arg - 1 : 0
        send(str)
    run_hooks("post_command_hook")
}

evil_adjust_window()
{ Global
    Local ch
    run_hooks("pre_command_hook")
    reset_evil()
    ToolTip, Vi z, 1, 0, %evil_tt%
    ch := read_char()
    set_evil()
    If ch = +h
        scroll_right()
    Else If ch = +l
        scroll_left()
    run_hooks("post_command_hook")
}

evil_search_this_word()
{
    command_simple("^{right}{shift down}^{left}{shift up}^c^f^v", 0, 0)
}

;; a command for "0"
evil_digit_argument_or_bol()
{ Global
    run_hooks("pre_command_hook")
    If arg
        set_digit_argument(arg * 10)
    Else If mark
        send("{shift down}{home}{shift up}")
    Else
        send("{home}")
    run_hooks("post_command_hook")
}

;; ------
;; insert
;; ------

evil_insert()
{ Global
    run_hooks("pre_command_hook")
    reset_evil()
    evil_pending = 0
    reset_mark()
    run_hooks("post_command_hook")
}

evil_open_line()
{
    evil_command_insert("{end}{enter}", 1)
}

evil_open_above()
{
    evil_command_insert("{home}{enter}{left}", 1)
}

evil_append()
{
    evil_command_insert("{right}", 0)
}

evil_subst()
{
    evil_command_insert("{delete}", 0)
}

evil_insert_bol()
{
    evil_command_insert("{home}", 0)
}

evil_append_eol()
{
    evil_command_insert("{end}", 0)
}

evil_subst_line()
{
    evil_command_insert("{home}{shift down}{end}{shift up}^x", 0)
}

evil_change_line()
{
    evil_command_insert("{right}{left}{shift down}{end}{shift up}^x", 0)
}

;; ----
;; edit
;; ----

evil_copy_line()
{
    command_simple("{home}{shift down}{end}{right}{shift up}^c{left}{home}", 0, 0)
}

evil_yank_before()
{
    command_simple("{left}^v", 1, 1)
}

evil_join()
{
    command_simple("{end}{delete}{space}", 1, 1)
}

evil_join_direct()
{
    command_simple("{end}{delete}", 1, 1)
}

;; ------
;; others
;; ------

evil_search_forward()
{
    evil_command_insert("^f", 0)
}

evil_replace_char()
{
    run_hooks("pre_command_hook")
    reset_evil()
    ToolTip, Vi %A_ThisHotKey%, 1, 0, %evil_tt%
    ch := read_char()
    set_evil()
    send("{right}{shift down}{left}{shift up}^x")
    send(ch)
    run_hooks("after_change_hook")
    run_hooks("post_command_hook")
}

evil_replace_chars()
{
    run_hooks("pre_command_hook")
    reset_evil()
    InputBox, txt, Vi %A_ThisHotKey%-, Replace With:
    StringLen, len, txt
    set_evil()
    Loop, %len%
        send("{right}")
    Loop, %len%
        send("{shift down}{left}{shift up}")
    send("^x")
    send(txt)
    run_hooks("after_change_hook")
    run_hooks("post_command_hook")
}

evil_toggle_case()
{
    run_hooks("pre_command_hook")
    send("{right}{shift down}{left}{shift up}")
    safe_cut()
    If InStr("ABCDEFGHIJKLMNOPQRSTUVWXYZ", ClipBoard, 1)
        StringLower, ClipBoard, ClipBoard
    Else
        StringUpper, ClipBoard, ClipBoard
    send("^v")
    run_hooks("after_change_hook")
    run_hooks("post_command_hook")
}
