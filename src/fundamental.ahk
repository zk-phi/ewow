;; This script provides: emacs-like simple commands

;; -----------
;; fundamental
;; -----------

;; do nothing
ignore()
{
    reset_cx()
    get_argument()
}

;; send itself ARG times (for ASCII keys)
self_insert_command()
{
    reset_cx()
    reset_mark()
    arg := get_argument()
    Loop, %arg%
        send(A_ThisHotKey)
}

;; send itself ARG times (for non-ASCII keys)
self_send_command()
{
    reset_cx()
    reset_mark()
    arg := get_argument()
    tmp = {%A_ThisHotKey%}
    Loop, %arg%
        send(tmp)
}

;; ------
;; system
;; ------

;; close window (M-F4)
kill_emacs()
{
    reset_cx()
    reset_mark()
    get_argument()
    send("!{f4}")
    after_display_transition_hook()
}

;; start recording macro
kmacro_start_macro()
{
    reset_cx()
    get_argument()
    set_macro()
}

;; end recording macro
kmacro_end_macro()
{
    reset_cx()
    get_argument()
    reset_macro()
}

;; call last recorded macro ARG times
kmacro_call_macro()
{ local arg
    reset_cx()
    arg := get_argument()
    Loop, %arg%
    {
        Loop, %kmacro_count%
        {
            tmp := kmacro%A_Index%
            Send %tmp%
        }
    }
}

;; end macro and call it ARG times
kmacro_end_and_call_macro()
{ local arg
    reset_cx()
    arg := get_argument()
    If kmacro_recording
        kmacro_end_macro()
    Loop, %arg%
        kmacro_call_macro()
}

;; end macro or call macro ARG times
kmacro_end_or_call_macro()
{ local arg
    reset_cx()
    arg := get_argument()
    If kmacro_recording
        kmacro_end_macro()
    Else Loop, %arg%
        kmacro_call_macro()
}

;; repeat last command again ARG times
repeat()
{ local arg
    reset_cx()
    arg := get_argument()
    Loop, %arg%
        Send %last_command%
}

;; send ESC and reset variables
keyboard_quit()
{
    reset_cx()
    reset_mark()
    get_argument()
    send("{escape}")
}

;; help
help()
{
    reset_cx()
    reset_mark()
    get_argument()
    send("{f1}")
    after_display_transition_hook()
}

;; -----
;; files
;; -----

;; save (C-s)
save_buffer()
{
    reset_cx()
    reset_mark()
    get_argument()
    send("^s")
    after_display_transition_hook()
}

;; files(_F) > save as(_A)
write_file()
{
    reset_cx()
    reset_mark()
    get_argument()
    send("{alt down}fa{alt up}")
    after_display_transition_hook()
}

;; open file (C-o)
find_file()
{
    reset_cx()
    reset_mark()
    get_argument()
    send("^o")
    after_display_transition_hook()
}

;; launch explorer (Win-e)
dired()
{
    reset_cx()
    reset_mark()
    get_argument()
    send("#e")
    after_display_transition_hook()
}

;; ---------------
;; windows, frames
;; ---------------

;; close window (M-F4)
kill_frame()
{
    reset_cx()
    reset_mark()
    get_argument()
    send("!{F4}")
    after_display_transition_hook()
}

;; delete ARG tabs (C-F4)
delete_window()
{
    reset_cx()
    reset_mark()
    arg := get_argument()
    Loop, %arg%
        send("^{f4}")
    after_display_transition_hook()
}

;; new ARG tabs (C-t)
split_window()
{
    reset_cx()
    reset_mark()
    arg := get_argument()
    Loop, %arg%
        send("^t")
    after_display_transition_hook()
}

;; forward ARG tabs (C-TAB)
next_window()
{
    reset_cx()
    reset_mark()
    arg := get_argument()
    Loop, %arg%
        send("^{tab}")
    after_display_transition_hook()
}

;;  backward ARG tabs (C-S-TAB)
previous_window()
{
    reset_cx()
    reset_mark()
    arg := get_argument()
    Loop, %arg%
        send("^+{tab}")
    after_display_transition_hook()
}

;; minimize frame (Win-Down)
suspend_frame()
{
    reset_cx()
    reset_mark()
    get_argument()
    send("#{down}")
    after_display_transition_hook()
}

;; --------
;; movement
;; --------

;; forward ARG chars
forward_char()
{ local arg
    reset_cx()
    arg := get_argument()
    Loop, %arg%
        If mark
            send("{shift down}{right}{shift up}")
        Else
            send("{right}")
}

;; backward ARG chars
backward_char()
{ local arg
    reset_cx()
    arg := get_argument()
    Loop, %arg%
        If mark
            send("{shift down}{left}{shift up}")
        Else
            send("{left}")
}

;; forward ARG words (C-right)
forward_word()
{ local arg
    reset_cx()
    arg := get_argument()
    Loop, %arg%
        If mark
            send("{shift down}^{right}{shift up}")
        Else
            send("^{right}")
}

;; backward ARG words (C-left)
backward_word()
{ local arg
    reset_cx()
    arg := get_argument()
    Loop, %arg%
        If mark
            send("{shift down}^{left}{shift up}")
        Else
            send("^{left}")
}

;; down ARG lines
next_line()
{ local arg
    reset_cx()
    arg := get_argument()
    Loop, %arg%
        If mark
            send("{shift down}{down}{shift up}")
        Else
            send("{down}")
}

;; up ARG lines
previous_line()
{ local arg
    reset_cx()
    arg := get_argument()
    Loop, %arg%
        If mark
            send("{shift down}{up}{shift up}")
        Else
            send("{up}")
}

;; --------------
;; jumping around
;; --------------

;; PgDn ARG times
scroll_down()
{ local arg
    reset_cx()
    arg := get_argument()
    Loop, %arg%
        If mark
            send("{shift down}{pgdn}{shift up}")
        Else
            send("{pgdn}")
}

;; PgUp ARG times
scroll_up()
{ local arg
    reset_cx()
    arg := get_argument()
    Loop, %arg%
        If mark
            send("{shift down}{pgup}{shift up}")
        Else
            send("{pgup}")
}

;; scroll left ARG times (Alt+PgUp)
scroll_left()
{ local arg
    reset_cx()
    arg := get_argument()
    Loop, %arg%
        If mark
            send("{shift down}!{pgup}{shift up}")
        Else
            send("!{pgup}")
}

;; scroll right ARG times (Alt+PgDn)
scroll_right()
{ local arg
    reset_cx()
    arg := get_argument()
    Loop, %arg%
        If mark
            send("{shift down}!{pgdn}{shift up}")
        Else
            send("!{pgdn}")
}

;; Home
move_beginning_of_line()
{ Global
    reset_cx()
    get_argument()
    If mark
        send("{shift down}{home}{shift up}")
    Else
        send("{home}")
}

;; End
move_end_of_line()
{ Global
    reset_cx()
    get_argument()
    If mark
        send("{shift down}{end}{shift up}")
    Else
        send("{end}")
}

;; bob (C-Home)
beginning_of_buffer()
{ Global
    reset_cx()
    get_argument()
    If mark
        send("{shift down}^{home}{shift up}")
    Else
        send("^{home}")
}

;; eob (C-End)
end_of_buffer()
{ Global
    reset_cx()
    get_argument()
    If mark
        send("{shift down}^{end}{shift up}")
    Else
        send("^{end}")
}

;; move to the bob and forward N-1 lines
goto_line()
{
    reset_cx()
    get_argument()
    InputBox, line, Goto:, , , 130, 105
    If line is number
    {
        reset_mark()
        line--
        beginning_of_buffer()
        Loop, %line%
            next_line()
    }
}

;; ------
;; region
;; ------

;; set mark
set_mark_command()
{
    reset_cx()
    get_argument()
    set_mark()
}

;; mark this word
mark_word()
{
    reset_cx()
    reset_mark()
    get_argument()
    forward_char()
    backward_word()
    forward_word()
    set_mark()
    backward_word()
}

;; mark this line
mark_whole_line()
{
    reset_cx()
    reset_mark()
    get_argument()
    move_beginning_of_line()
    set_mark()
    move_end_of_line()
}

;; mark this buffer
mark_whole_buffer()
{
    reset_cx()
    get_argument()
    set_mark()
    send("^a")
}

;; copy (C-c)
kill_ring_save()
{
    reset_cx()
    reset_mark()
    get_argument()
    send("^c")
}

;; cut (C-x)
kill_region()
{
    reset_cx()
    reset_mark()
    get_argument()
    send("^x")
}

;; paste ARG times (C-v)
yank()
{
    reset_cx()
    reset_mark()
    arg := get_argument()
    Loop, %arg%
        send("^v")
}

;; ----------------
;; delete something
;; ----------------

;; delete ARG chars forward (Del)
delete_char()
{
    reset_cx()
    reset_mark()
    arg := get_argument()
    Loop, %arg%
        send("{del}")
}

;; delete ARG chars backward (Bs)
delete_backward_char()
{
    reset_cx()
    reset_mark()
    arg := get_argument()
    Loop, %arg%
        send("{bs}")
}

;; delete ARG words "forward"
kill_word()
{
    reset_cx()
    arg := get_argument()
    set_mark()
    Loop, %arg%
        forward_word()
    kill_region()
}

;; delete ARG words "backward"
backward_kill_word()
{
    reset_cx()
    arg := get_argument()
    set_mark()
    Loop, %arg%
        backward_word()
    kill_region()
}

;; delete this line "forward"
kill_line()
{
    reset_cx()
    get_argument()
    set_mark()
    move_end_of_line()
    kill_region()
}

;; delete whole line
kill_whole_line()
{
    reset_cx()
    get_argument()
    mark_whole_line()
    kill_region()
}

;; ------------------
;; newline and indent
;; ------------------

;; new ARG lines (Ret)
newline()
{
    reset_cx()
    reset_mark()
    arg := get_argument()
    Loop, %arg%
        send("{enter}")
}

;; open ARG lines below (Ret, Left)
open_line()
{
    reset_cx()
    reset_mark()
    arg := get_argument()
    Loop, %arg%
        send("{enter}{left}")
}

;; indent ARG times (Tab)
indent_for_tab_command()
{
    reset_cx()
    reset_mark()
    arg := get_argument()
    Loop, %arg%
        send("{tab}")
}

;; join ARG lines backward
delete_indentation()
{
    reset_cx()
    reset_mark()
    arg := get_argument()
    Loop, %arg%
    {
        move_beginning_of_line()
        delete_backward_char()
    }
}

;; -------------
;; edit commands
;; -------------

;; undo ARG times (C-z)
undo_only()
{
    reset_cx()
    reset_mark()
    arg := get_argument()
    Loop, %arg%
        send("^z")
}

;; redo ARG times (C-y)
redo()
{
    reset_cx()
    reset_mark()
    arg := get_argument()
    Loop, %arg%
        send("^y")
}

;; transpose ARG chars
transpose_chars()
{
    reset_cx()
    reset_mark()
    arg := get_argument()
    backward_char()
    set_mark()
    forward_char()
    kill_region()
    Loop, %arg%
        forward_char()
    yank()
}

;; transpose ARG words
transpose_words()
{
    reset_cx()
    arg := get_argument()
    reset_mark()
    backward_char()
    mark_word()
    kill_region()
    Loop, %arg%
        forward_word()
    yank()
}

;; transpose ARG lines
transpose_lines()
{
    reset_cx()
    arg := get_argument()
    reset_mark()
    previous_line()
    move_beginning_of_line()
    set_mark()
    next_line()
    kill_region()
    Loop, %arg%
        next_line()
    yank()
}

;; replace (C-h)
query_replace()
{
    reset_cx()
    reset_mark()
    get_argument()
    send("^h")
}

;; search (C-f)
search_forward()
{
    reset_cx()
    reset_mark()
    get_argument()
    send("^f")
}

;; insert mode (ins)
overwrite_mode()
{
    reset_cx()
    reset_mark()
    get_argument()
    send("{insert}")
}

;; ---------------
;; inserting pairs
;; ---------------

;; insert ARG parentheses
insert_parentheses()
{ local arg
    reset_cx()
    arg := get_argument()
    If mark
    {
        kill_region()
        Loop, %arg%
            send("(){left}")
        yank()
    }Else
        Loop, %arg%
            send("(){left}")
}

;; insert comment (/* `!!' */)
insert_comment()
{ Global
    reset_cx()
    get_argument()
    If mark
    {
        kill_region()
        send("/*  */{left}{left}{left}")
        yank()
    }Else
        send("/*  */{left}{left}{left}")
}

;; continue multiline comment ARG lines (\n/* `!!')
indent_new_comment_line()
{
    reset_cx()
    arg := get_argument()
    reset_mark()
    Loop, %arg%
        send("{enter}  /*{space}")
}

;; ------
;; others
;; ------

;; launch cmd.exe
shell()
{
    reset_cx()
    reset_mark()
    get_argument()
    Run, cmd.exe
    after_display_transition_hook()
}

;; execute shell command (Win-r)
shell_command()
{
    reset_cx()
    reset_mark()
    get_argument()
    send("#r")
    after_display_transition_hook()
}

;; add text properties (basically for MSWord)
facemenu()
{
    reset_cx()
    reset_mark()
    get_argument()
    send("^d")
    after_display_transition_hook()
}
