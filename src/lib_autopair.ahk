;; this script provides : autopair-like commands

;; insert ARG colons followed by a space
smart_colon()
{
    reset_cx()
    reset_mark()
    arg := get_argument()
    Loop, %arg%
        send(",")
    send("{space}")
}

;; wrap or insert ARG parens
smart_paren()
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

;; wrap or insert brackets
smart_bracket()
{ local arg
    reset_cx()
    arg := get_argument()
    If mark
    {
        kill_region()
        Loop, %arg%
            send("[]{left}")
        yank()
    }Else
        Loop, %arg%
            send("[]{Left}")
}

;; wrap or insert braces
smart_brace()
{ local arg
    reset_cx()
    arg := get_argument()
    If mark
    {
        kill_region()
        Loop, %arg%
            send("{shift down}[]{shift up}{left}")
        yank()
    }Else
        Loop, %arg%
            send("{shift down}[]{shift up}{Left}")
}

;; wrap or insert double quotes
smart_dquot()
{ local arg, tmp
    reset_cx()
    arg := get_argument()
    tmp = ""{left}              ; can this be more smart ?
    If mark
    {
        kill_region()
        Loop, %arg%
            send(tmp)
        yank()
    }Else
        Loop, %arg%
            send(tmp)
}
