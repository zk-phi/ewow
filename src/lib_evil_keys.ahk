;; This script provides: keybinds for evil

;; -----------------
;; g shift- bindings
;; -----------------
#If !dummy && !ignored_frame() && evil && preg

+`:: evil_op_case_conv()
+1:: ignore()
+2:: ignore()
+3:: evil_search_this_word()    ; search-this-partial-word
+4:: end_of_buffer()            ; last-screen-line
+5:: ignore()
+6:: beginning_of_buffer()      ; first-nonblank-screen-line
+7:: ignore()
+8:: evil_search_this_word()    ; search-this-partial-word-backward
+9:: ignore()
+0:: ignore()
+-:: move_end_of_line()         ; last-non-blank
+=:: ignore()
+q:: ignore()
+w:: ignore()
+e:: backward_word()            ; backward-blank-delimited-word-end
+r:: evil_replace_chars()       ; replace-chars-without-affecting-layout
+t:: ignore()
+y:: ignore()
+u:: evil_op_uppercase()
+i:: ignore()
+o:: ignore()
+p:: evil_yank_before()
+[:: ignore()
+]:: ignore()
+a:: ignore()
+s:: ignore()
+d:: ignore()
+f:: ignore()
+g:: ignore()
+h:: ignore()
+j:: evil_join_direct()
+k:: ignore()
+l:: ignore()
+`;:: ignore()
+':: ignore()
+\:: ignore()
+z:: ignore()
+x:: ignore()
+c:: ignore()
+v:: ignore()
+b:: ignore()
+n:: ignore()
+m:: ignore()
+,:: ignore()
+.:: ignore()
+/:: ignore()

;; ----------
;; g bindings
;; ----------
#If !dummy && !ignored_frame() && evil && preg

`:: ignore()
1:: ignore()
2:: ignore()
3:: ignore()
4:: ignore()
5:: ignore()
6:: ignore()
7:: ignore()
8:: ignore()
9:: ignore()
0:: beginning_of_buffer()      ; first-screen-line
-:: ignore()
=:: ignore()
q:: ignore()
w:: ignore()
e:: backward_word()            ; backward-word-end
r:: evil_replace_char()        ; replace-char-without-affecting-layout
t:: ignore()
y:: ignore()
u:: evil_op_lowercase()
i:: ignore()
o:: ignore()
p:: yank()
[:: ignore()
]:: ignore()
a:: ignore()
s:: ignore()
d:: ignore()
f:: ignore()
g:: evil_goto_line()
h:: ignore()
j:: ignore()
k:: ignore()
l:: ignore()
`;:: ignore()
':: ignore()
\:: ignore()
z:: ignore()
x:: ignore()
c:: ignore()
v:: ignore()
b:: ignore()
n:: ignore()
m:: ignore()
,:: ignore()
.:: ignore()
/:: ignore()

;; -----------
;; C- bindings
;; -----------
#If !dummy && !ignored_frame() && evil && !preg

^`:: ignore()
^1:: ignore()
^2:: ignore()
^3:: ignore()
^4:: ignore()
^5:: ignore()
^6:: ignore()
^7:: ignore()
^8:: ignore()
^9:: ignore()
^0:: ignore()
^-:: ignore()
^=:: ignore()
^q:: ignore()
^w:: next_window()              ; window-operations
^e:: ignore()
^r:: redo()
^t:: ignore()
^y:: ignore()
^u:: scroll_up()
^i:: ignore()
^o:: ignore()
^p:: ignore()
^[:: ignore()
^]:: ignore()
^a:: ignore()
^s:: ignore()
^d:: scroll_down()
^f:: scroll_down()
^g:: ignore()
^h:: ignore()
^j:: ignore()
^k:: ignore()
^l:: evil_reflesh()
^`;:: ignore()
^':: ignore()
^\:: ignore()
^z:: ignore()
^x:: ignore()
^c:: ignore()
^v:: ignore()
^b:: scroll_up()
^n:: ignore()
^m:: ignore()
^,:: ignore()
^.:: ignore()
^/:: ignore()

;; ---------------
;; shift- bindings
;; ---------------
#If !dummy && !ignored_frame() && evil && !preg

+`:: evil_toggle_case()
+1:: ignore()
+2:: kmacro_call_macro()
+3:: evil_search_this_word()
+4:: move_end_of_line()
+5:: ignore()
+6:: move_beginning_of_line()   ; back-to-indentation
+7:: ignore()
+8:: evil_search_this_word()       ; search-this-word-backward
+9:: move_beginning_of_line()      ; backward-sentence
+0:: move_end_of_line()            ; forward-sentence
+-:: evil_beginning_of_next_line() ; first-nonblank-of-next-line
+=:: evil_beginning_of_next_line()
+q:: ignore()
+w:: forward_word()             ; forward-blank-delimited-word
+e:: forward_word()             ; forward-blank-delimited-word-end
+r:: evil_replace_chars()
+t:: ignore()
+y:: evil_copy_line()
+u:: undo_only()                ; undo line
+i:: evil_insert_bol()
+o:: evil_open_above()
+p:: evil_yank_before()         ; yank-before-without-moving
+[:: previous_line()            ; backward-paragraph
+]:: next_line()                ; forward-paragraph
+a:: evil_append_eol()
+s:: evil_subst_line()
+d:: kill_line()
+f:: ignore()
+g:: evil_goto_line_negative()
+h:: beginning_of_buffer()      ; last-screen-line
+j:: evil_join()
+k:: help()
+l:: end_of_buffer()            ; fitst-screen-line
+`;:: evil_ex_command()
+':: ignore()
+\:: evil_goto_col()
+z:: kill_frame()               ; ZZ => save&exit / ZQ => quit
+x:: delete_backward_char()
+c:: evil_change_line()
+v:: ignore()
+b:: backward_word()            ; backward-blank-delimited-word
+n:: evil_search_forward()           ; search-previous
+m:: ignore()
+,:: ignore()
+.:: ignore()
+/:: evil_search_forward()           ; search-backward

;; --------------
;; plain bindings
;; --------------
#If !dummy && !ignored_frame() && evil && !preg

`:: ignore()
1:: evil_digit_argument()
2:: evil_digit_argument()
3:: evil_digit_argument()
4:: evil_digit_argument()
5:: evil_digit_argument()
6:: evil_digit_argument()
7:: evil_digit_argument()
8:: evil_digit_argument()
9:: evil_digit_argument()
0:: evil_digit_argument_or_bol()
-:: evil_beginning_of_previous_line() ; first-nonblank-of-previous-line
=:: ignore()
q:: evil_toggle_macro()
w:: forward_word()
e:: forward_word()              ; forward-word-end
r:: evil_replace_char()
t:: evil_till()
y:: evil_op_copy()
u:: undo_only()
i:: evil_insert()
o:: evil_open_line()
p:: yank()                      ; yank-without-moving
[:: ignore()
]:: ignore()
a:: evil_append()
s:: evil_subst()
d:: evil_op_delete()
f:: evil_find()
g:: evil_preg()
h:: backward_char()
j:: next_line()
k:: previous_line()
l:: forward_char()
`;:: evil_goto_char_repeat()
':: ignore()
z:: evil_adjust_window()
x:: delete_char()
c:: evil_op_change()
v:: set_mark_command()          ; visual-mode
b:: backward_word()
n:: evil_search_forward()            ; search-next
m:: ignore()
,:: ignore()
.:: repeat()
/:: evil_search_forward()

;; ------------
;; special keys
;; ------------
#If !dummy && !ignored_frame() && evil

bs:: backward_char()
enter:: next_line()
space:: forward_char()
escape:: evil_keyboard_quit()
