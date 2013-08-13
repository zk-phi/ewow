;; load libraries
;; --------------

;; #Include lib_evil.ahk
#Include lib_autopair.ahk

;; set customizable variables
;; --------------------------

;; evil_auto_mode = 1

;; ////////////////////////////////////////////////
;; /////// auto execution section ends here ///////
;; ////////////////////////////////////////////////

;; keybinds for lib_evil
;; ---------------------

;; #If !ignored_frame() && !evil
;; escape:: evil_mode()

;; #If !dummy && !ignored_frame() && evil
;; bs:: self_send_command()
;; enter:: self_send_command()
;; space:: self_send_command()

;; #Include lib_evil_keys.ahk

;; keybinds for lib_autopair
;; -------------------------

#If !ignored_frame() && !cx
,:: smart_colon()
[:: smart_bracket()
+9:: insert_parentheses()
+[:: smart_brace()
+':: smart_dquot()
