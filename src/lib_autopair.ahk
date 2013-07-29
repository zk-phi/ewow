;; this script provides : autopair-like commands

;; insert ARG colons followed by a space
smart_colon()
{ Global
    run_hooks("pre_command_hook")
    Loop, % arg ? arg : 1
        send(",")
    send("{space}")
    run_hooks("after_change_hook")
    run_hooks("post_command_hook")
}

;; wrap or insert brackets
smart_bracket()
{
    command_pair("[]{left}")
}

;; wrap or insert bracesr
smart_brace()
{
    command_pair("{shift down}[]{shift up}{left}")
}

;; wrap or insert double quotes
smart_dquot()
{
    tmp = ""{left}
    command_pair(tmp)
}
