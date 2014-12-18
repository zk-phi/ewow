;; *** CAUTION: LOAD THIS SCRIPT AT THE LAST ***
;; This script provides: default keybinds

;; condition "!dummy" is added to prevent error "duplicate hotkeys"

;; ----------------
;; AltTab detection
;; ----------------

#If, alt_pressed
alt up:: alttab_end()
#If,
!tab:: alttab_next()

;; ---------------
;; C-x C- bindings
;; ---------------
#If !dummy && !ignored_frame() && cx

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
^0:: ignore()                   ; * text-scale-adjust
^-:: ignore()                   ; * text-scale-adjust
^=:: ignore()                   ; * text-scale-adjust
^q:: ignore()
^w:: write_file()
^e:: ignore()
^r:: find_file()                ; find-file-read-only
^t:: transpose_lines()          ; transpose-lines
^y:: ignore()
^u:: upcase_region()
^i:: ignore()
^o:: ignore()
^p:: ignore()
^[:: ignore()
^]:: ignore()
^a:: ignore()
^s:: save_buffer()
^d:: dired()                    ; list-directory
^f:: find_file()
^g:: ignore()
^h:: ignore()
^j:: ignore()
^k:: ignore()
^l:: downcase_region()
^`;:: ignore()
^':: ignore()
^\:: ignore()
^z:: suspend_frame()            ; suspend-frame
^x:: ignore()
^c:: kill_frame()               ; save-buffers-kill-emacs
^v:: find_file()                ; find-alternate-file
^b:: ignore()
^n:: ignore()
^m:: ignore()
^,:: ignore()
^.:: ignore()
^/:: ignore()

^left:: previous_window()       ; previous-buffer
^right:: next_window()          ; next-buffer

;; -------------------
;; C-x Shift- bindings
;; -------------------
#If !dummy && !ignored_frame() && cx

+`:: ignore()
+1:: ignore()
+2:: ignore()
+3:: ignore()
+4:: ignore()
+5:: ignore()
+6:: ignore()
+7:: ignore()
+8:: ignore()
+9:: kmacro_start_macro()
+0:: kmacro_end_macro()
+-:: ignore()
+=:: ignore()
+q:: ignore()
+w:: ignore()
+e:: ignore()
+r:: ignore()
+t:: ignore()
+y:: ignore()
+u:: ignore()
+i:: ignore()
+o:: ignore()
+p:: ignore()
+[:: ignore()
+]:: ignore()
+a:: ignore()
+s:: ignore()
+d:: ignore()
+f:: ignore()
+g:: ignore()
+h:: ignore()
+j:: ignore()
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
+,:: scroll_left()
+.:: scroll_right()
+/:: ignore()

;; ------------
;; C-x bindings
;; ------------
#If !dummy && !ignored_frame() && cx

`:: ignore()
1:: ignore()                    ; * delete-other-windows
2:: split_window()              ; split-window-vertically
3:: split_window()              ; split-window-horizontally
4:: ignore()
5:: ignore()
6:: ignore()
7:: ignore()
8:: ignore()
9:: ignore()
0:: delete_window()
-:: ignore()
=:: ignore()
q:: ignore()                    ; * kbd-macro-query
w:: ignore()
e:: kmacro_end_and_call_macro()
r:: redo()                      ; ignore
t:: ignore()
y:: ignore()
u:: undo_only()
i:: ignore()
o:: next_window()               ; other-window
p:: ignore()
[:: ignore()
]:: ignore()
a:: ignore()
s:: ignore()
d:: dired()
f:: ignore()
g:: ignore()
h:: mark_whole_buffer()
j:: ignore()
k:: delete_window()             ; kill-buffer
l:: ignore()
`;:: ignore()
':: ignore()
\:: ignore()
z:: repeat()
x:: ignore()
c:: ignore()
v:: ignore()
b:: ignore()
n:: ignore()
m:: ignore()
,:: ignore()
.:: ignore()
/:: ignore()

left:: previous_window()        ; previous-buffer
right:: next_window()           ; next-buffer

;; -------------------
;; C-M-Shift- bindings
;; -------------------
#If !dummy && !ignored_frame() && !cx

!^+`:: self_insert_command()
!^+1:: self_insert_command()
!^+2:: self_insert_command()
!^+3:: self_insert_command()
!^+4:: self_insert_command()
!^+5:: query_replace()          ; query-replace-regexp
!^+6:: self_insert_command()
!^+7:: self_insert_command()
!^+8:: self_insert_command()
!^+9:: self_insert_command()
!^+0:: self_insert_command()
!^+-:: self_insert_command()
!^+=:: self_insert_command()
!^+q:: self_insert_command()
!^+w:: self_insert_command()
!^+e:: self_insert_command()
!^+r:: self_insert_command()
!^+t:: self_insert_command()
!^+y:: self_insert_command()
!^+u:: self_insert_command()
!^+i:: self_insert_command()
!^+o:: self_insert_command()
!^+p:: self_insert_command()
!^+[:: self_insert_command()
!^+]:: self_insert_command()
!^+a:: self_insert_command()
!^+s:: self_insert_command()
!^+d:: self_insert_command()
!^+f:: self_insert_command()
!^+g:: self_insert_command()
!^+h:: self_insert_command()
!^+j:: self_insert_command()
!^+k:: self_insert_command()
!^+l:: self_insert_command()
!^+`;:: self_insert_command()
!^+':: self_insert_command()
!^+\:: self_insert_command()
!^+z:: self_insert_command()
!^+x:: self_insert_command()
!^+c:: self_insert_command()
!^+v:: self_insert_command()
!^+b:: self_insert_command()
!^+n:: self_insert_command()
!^+m:: self_insert_command()
!^+,:: self_insert_command()
!^+.:: self_insert_command()
!^+/:: self_insert_command()

;; -------------
;; C-M- bindings
;; -------------
#If !dummy && !ignored_frame() && !cx

!^`:: self_insert_command()
!^1:: digit_argument()
!^2:: digit_argument()
!^3:: digit_argument()
!^4:: digit_argument()
!^5:: digit_argument()
!^6:: digit_argument()
!^7:: digit_argument()
!^8:: digit_argument()
!^9:: digit_argument()
!^0:: digit_argument()
!^-:: self_insert_command()
!^=:: self_insert_command()
!^q:: self_insert_command()
!^w:: self_insert_command()
!^e:: self_insert_command()
!^r:: search_forward()          ; isearch-backward-regexp
!^t:: self_insert_command()
!^y:: self_insert_command()
!^u:: self_insert_command()
!^i:: self_insert_command()
!^o:: self_insert_command()
!^p:: self_insert_command()
!^[:: self_insert_command()
!^]:: self_insert_command()
!^a:: self_insert_command()
!^s:: search_forward()          ; isearch-forward-regexp
!^d:: self_insert_command()
!^f:: self_insert_command()
!^g:: self_insert_command()
!^h:: self_insert_command()
!^j:: indent_new_comment_line()
!^k:: self_insert_command()
!^l:: self_insert_command()
!^`;:: self_insert_command()
!^':: self_insert_command()
!^\:: self_insert_command()
!^z:: self_insert_command()
!^x:: self_insert_command()
!^c:: self_insert_command()
!^v:: self_insert_command()
!^b:: self_insert_command()
!^n:: self_insert_command()
!^m:: self_insert_command()
!^,:: self_insert_command()
!^.:: self_insert_command()
!^/:: self_insert_command()

;; -----------------
;; M-Shift- bindings
;; -----------------
#If !dummy && !ignored_frame() && !cx

!+`:: self_insert_command()
!+1:: shell_command()
!+2:: mark_word()
!+3:: self_insert_command()
!+4:: self_insert_command()
!+5:: query_replace()
!+6:: delete_indentation()
!+7:: shell_command()           ; async-shell-command
!+8:: self_insert_command()
!+9:: insert_parentheses()
!+0:: self_insert_command()
!+-:: self_insert_command()
!+=:: self_insert_command()
!+q:: self_insert_command()
!+w:: self_insert_command()
!+e:: self_insert_command()
!+r:: self_insert_command()
!+t:: self_insert_command()
!+y:: self_insert_command()
!+u:: self_insert_command()
!+i:: self_insert_command()
!+o:: self_insert_command()
!+p:: self_insert_command()
!+[:: scroll_up()               ; backward-paragraph
!+]:: scroll_down()             ; forward-paragraph
!+a:: self_insert_command()
!+s:: self_insert_command()
!+d:: self_insert_command()
!+f:: self_insert_command()
!+g:: self_insert_command()
!+h:: self_insert_command()
!+j:: self_insert_command()
!+k:: self_insert_command()
!+l:: self_insert_command()
!+`;:: self_insert_command()
!+':: self_insert_command()
!+\:: self_insert_command()
!+z:: self_insert_command()
!+x:: self_insert_command()
!+c:: self_insert_command()
!+v:: self_insert_command()
!+b:: self_insert_command()
!+n:: self_insert_command()
!+m:: self_insert_command()
!+,:: beginning_of_buffer()
!+.:: end_of_buffer()
!+/:: self_insert_command()

;; -----------
;; M- bindings
;; -----------
#If !dummy && !ignored_frame() && !cx

!`:: self_insert_command()
!1:: digit_argument()
!2:: digit_argument()
!3:: digit_argument()
!4:: digit_argument()
!5:: digit_argument()
!6:: digit_argument()
!7:: digit_argument()
!8:: digit_argument()
!9:: digit_argument()
!0:: digit_argument()
!-:: self_insert_command()
!=:: self_insert_command()
!q:: self_insert_command()
!w:: kill_ring_save()
!e:: move_end_of_line()         ; forward-sentence
!r:: self_insert_command()
!t:: transpose_words()
!y:: yank_pop()
!u:: upcase_word()
!i:: indent_for_tab_command()   ; tab-to-tab-stop
!o:: facemenu()                 ; (prefix)
!p:: self_insert_command()
![:: self_insert_command()
!]:: self_insert_command()
!a:: move_beginning_of_line()   ; backward-sentence
!s:: self_insert_command()
!d:: kill_word()
!f:: forward_word()
!g:: goto_line()                ; (prefix)
!h:: self_insert_command()
!j:: indent_new_comment_line()
!k:: self_insert_command()
!l:: downcase_word()
!`;:: insert_comment()          ; comment-dwim
!':: self_insert_command()
!\:: self_insert_command()
!z:: delete_char()              ; zap-to-char
!x:: self_insert_command()
!c:: capitalize_word()
!v:: scroll_down()
!b:: backward_word()
!n:: self_insert_command()
!m:: move_beginning_of_line()   ; back-to-indentation
!,:: self_insert_command()
!.:: self_insert_command()
!/:: self_insert_command()

!bs:: backward_kill_word()
!left:: backward_word()
!right:: forward_word()
!f4:: kill_frame()              ; save-buffers-kill-emacs

;; -----------------
;; C-Shift- bindings
;; -----------------
#If !dummy && !ignored_frame() && !cx

^+`:: self_insert_command()
^+1:: self_insert_command()
^+2:: set_mark_command()
^+3:: self_insert_command()
^+4:: self_insert_command()
^+5:: self_insert_command()
^+6:: self_insert_command()
^+7:: self_insert_command()
^+8:: self_insert_command()
^+9:: self_insert_command()
^+0:: self_insert_command()
^+-:: undo_only()
^+=:: self_insert_command()
^+q:: self_insert_command()
^+w:: self_insert_command()
^+e:: self_insert_command()
^+r:: self_insert_command()
^+t:: self_insert_command()
^+y:: self_insert_command()
^+u:: self_insert_command()
^+i:: self_insert_command()
^+o:: self_insert_command()
^+p:: self_insert_command()
^+[:: self_insert_command()
^+]:: self_insert_command()
^+a:: self_insert_command()
^+s:: self_insert_command()
^+d:: self_insert_command()
^+f:: self_insert_command()
^+g:: self_insert_command()
^+h:: self_insert_command()
^+j:: self_insert_command()
^+k:: self_insert_command()
^+l:: self_insert_command()
^+`;:: self_insert_command()
^+':: self_insert_command()
^+\:: self_insert_command()
^+z:: self_insert_command()
^+x:: self_insert_command()
^+c:: self_insert_command()
^+v:: self_insert_command()
^+b:: self_insert_command()
^+n:: self_insert_command()
^+m:: self_insert_command()
^+,:: self_insert_command()
^+.:: self_insert_command()
^+/:: self_insert_command()

^+bs:: kill_whole_line()

;; -----------
;; C- bindings
;; -----------
#If !dummy && !ignored_frame() && !cx

^`:: self_insert_command()
^1:: digit_argument()
^2:: digit_argument()
^3:: digit_argument()
^4:: digit_argument()
^5:: digit_argument()
^6:: digit_argument()
^7:: digit_argument()
^8:: digit_argument()
^9:: digit_argument()
^0:: digit_argument()
^-:: self_insert_command()
^=:: self_insert_command()
^q:: self_insert_command()
^w:: kill_region()
^e:: move_end_of_line()
^r:: search_forward()           ; isearch-backward
^t:: transpose_chars()
^y:: yank()
^u:: self_insert_command()
^i:: self_insert_command()
^o:: open_line()
^p:: previous_line()
^[:: self_insert_command()
^]:: self_insert_command()
^a:: move_beginning_of_line()
^s:: search_forward()           ; isearch-forward
^d:: delete_char()
^f:: forward_char()
^g:: keyboard_quit()
^h:: help()
^j:: newline()                  ; newline-and-indent
^k:: kill_line()
^l:: self_insert_command()
^`;:: self_insert_command()
^':: self_insert_command()
^\:: self_insert_command()
^z:: suspend_frame()
^x:: set_cx_command()
^c:: self_insert_command()
^v:: scroll_up()
^b:: backward_char()
^n:: next_line()
^m:: self_insert_command()
^,:: self_insert_command()
^.:: self_insert_command()
^/:: undo_only()

^space:: set_mark_command()
^bs:: backward_kill_word()
^delete:: kill_word()
^up:: scroll_up()               ; backward-paragraph
^down:: scroll_down()           ; forward-paragraph
^left:: backward_word()
^right:: forward_word()
^end:: end_of_buffer()
^home:: beginning_of_buffer()
^insert:: kill_ring_save()

;; ---------------
;; Shift- bindings
;; ---------------
#If !dummy && !ignored_frame() && !cx

+`:: self_insert_command()
+1:: self_insert_command()
+2:: self_insert_command()
+3:: self_insert_command()
+4:: self_insert_command()
+5:: self_insert_command()
+6:: self_insert_command()
+7:: self_insert_command()
+8:: self_insert_command()
+9:: self_insert_command()
+0:: self_insert_command()
+-:: self_insert_command()
+=:: self_insert_command()
+q:: self_insert_command()
+w:: self_insert_command()
+e:: self_insert_command()
+r:: self_insert_command()
+t:: self_insert_command()
+y:: self_insert_command()
+u:: self_insert_command()
+i:: self_insert_command()
+o:: self_insert_command()
+p:: self_insert_command()
+[:: self_insert_command()
+]:: self_insert_command()
+a:: self_insert_command()
+s:: self_insert_command()
+d:: self_insert_command()
+f:: self_insert_command()
+g:: self_insert_command()
+h:: self_insert_command()
+j:: self_insert_command()
+k:: self_insert_command()
+l:: self_insert_command()
+`;:: self_insert_command()
+':: self_insert_command()
+\:: self_insert_command()
+z:: self_insert_command()
+x:: self_insert_command()
+c:: self_insert_command()
+v:: self_insert_command()
+b:: self_insert_command()
+n:: self_insert_command()
+m:: self_insert_command()
+,:: self_insert_command()
+.:: self_insert_command()
+/:: self_insert_command()

+delete:: kill_region()

;; --------------
;; plain bindings
;; --------------
#If !dummy && !ignored_frame() && !cx

`:: self_insert_command()
1:: self_insert_command()
2:: self_insert_command()
3:: self_insert_command()
4:: self_insert_command()
5:: self_insert_command()
6:: self_insert_command()
7:: self_insert_command()
8:: self_insert_command()
9:: self_insert_command()
0:: self_insert_command()
-:: self_insert_command()
=:: self_insert_command()
q:: self_insert_command()
w:: self_insert_command()
e:: self_insert_command()
r:: self_insert_command()
t:: self_insert_command()
y:: self_insert_command()
u:: self_insert_command()
i:: self_insert_command()
o:: self_insert_command()
p:: self_insert_command()
[:: self_insert_command()
]:: self_insert_command()
a:: self_insert_command()
s:: self_insert_command()
d:: self_insert_command()
f:: self_insert_command()
g:: self_insert_command()
h:: self_insert_command()
j:: self_insert_command()
k:: self_insert_command()
l:: self_insert_command()
`;:: self_insert_command()
':: self_insert_command()
\:: self_insert_command()
z:: self_insert_command()
x:: self_insert_command()
c:: self_insert_command()
v:: self_insert_command()
b:: self_insert_command()
n:: self_insert_command()
m:: self_insert_command()
,:: self_insert_command()
.:: self_insert_command()
/:: self_insert_command()

;; -------------
;; mouse buttons
;; -------------
#If !dummy && !ignored_frame() && !cx

;; plain
lbutton:: mouse_event_command()
rbutton:: mouse_event_command()
mbutton:: mouse_event_command()
xbutton1:: mouse_event_command()
xbutton2:: mouse_event_command()
lbutton up:: mouse_event_command()
rbutton up:: mouse_event_command()
mbutton up:: mouse_event_command()
xbutton1 up:: mouse_event_command()
xbutton2 up:: mouse_event_command()

;; ctrl
^lbutton:: mouse_event_command()
^rbutton:: mouse_event_command()
^mbutton:: mouse_event_command()
^xbutton1:: mouse_event_command()
^xbutton2:: mouse_event_command()
^lbutton up:: mouse_event_command()
^rbutton up:: mouse_event_command()
^mbutton up:: mouse_event_command()
^xbutton1 up:: mouse_event_command()
^xbutton2 up:: mouse_event_command()

;; meta
!lbutton:: mouse_event_command()
!rbutton:: mouse_event_command()
!mbutton:: mouse_event_command()
!xbutton1:: mouse_event_command()
!xbutton2:: mouse_event_command()
!lbutton up:: mouse_event_command()
!rbutton up:: mouse_event_command()
!mbutton up:: mouse_event_command()
!xbutton1 up:: mouse_event_command()
!xbutton2 up:: mouse_event_command()

;; shift
+lbutton:: mouse_event_command()
+rbutton:: mouse_event_command()
+mbutton:: mouse_event_command()
+xbutton1:: mouse_event_command()
+xbutton2:: mouse_event_command()
+lbutton up:: mouse_event_command()
+rbutton up:: mouse_event_command()
+mbutton up:: mouse_event_command()
+xbutton1 up:: mouse_event_command()
+xbutton2 up:: mouse_event_command()

;; ------------
;; special keys
;; ------------
#If !dummy && !ignored_frame() && !cx

space:: self_send_command()

tab:: indent_for_tab_command()
enter:: newline()
escape:: keyboard_quit()
backspace:: delete_backward_char()
delete:: delete_char()

home:: move_beginning_of_line()
end:: move_end_of_line()
pgup:: scroll_up()
pgdn:: scroll_down()
up:: previous_line()
down:: next_line()
left:: backward_char()
right:: forward_char()

insert:: overwrite_mode()

scrolllock:: self_send_command()
capslock:: self_send_command()
numlock:: self_send_command()
appskey:: self_send_command()
printscreen:: self_send_command()
ctrlbreak:: self_send_command()
pause:: self_send_command()
break:: self_send_command()
help:: self_send_command()
sleep:: self_send_command()

;; -------------
;; function keys
;; -------------
#If !dummy && !ignored_frame() && !cx

f1:: help()
f2:: self_send_command()
f3:: kmacro_start_macro()       ; kmacro-start-macro-or-insert-counter
f4:: kmacro_end_or_call_macro()
f5:: self_send_command()
f6:: self_send_command()
f7:: self_send_command()
f8:: self_send_command()
f9:: self_send_command()
f10:: self_send_command()
f11:: self_send_command()
f12:: self_send_command()
f13:: self_send_command()
f14:: self_send_command()
f15:: self_send_command()
f16:: kill_ring_save()          ; clipboard-kill-ring-save
f17:: yank()                    ; clipboard-yank
f18:: self_send_command()
f19:: self_send_command()
f20:: kill_region()             ; clipboard-kill-region
f21:: self_send_command()
f22:: self_send_command()
f23:: self_send_command()
f24:: self_send_command()

;; -----------
;; numpad keys
;; -----------
#If !dummy && !ignored_frame() && !cx

numpad0:: self_send_command()
numpad1:: self_send_command()
numpad2:: self_send_command()
numpad3:: self_send_command()
numpad4:: self_send_command()
numpad5:: self_send_command()
numpad6:: self_send_command()
numpad7:: self_send_command()
numpad8:: self_send_command()
numpad9:: self_send_command()
numpadins:: self_send_command()
numpadend:: self_send_command()
numpaddown:: self_send_command()
numpadpgdn:: self_send_command()
numpadleft:: self_send_command()
numpadclear:: self_send_command()
numpadright:: self_send_command()
numpadhome:: self_send_command()
numpadup:: self_send_command()
numpadpgup:: self_send_command()
numpaddot:: self_send_command()
numpaddel:: self_send_command()
numpaddiv:: self_send_command()
numpadmult:: self_send_command()
numpadadd:: self_send_command()
numpadsub:: self_send_command()
numpadenter:: self_send_command()
