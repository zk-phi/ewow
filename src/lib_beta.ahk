;; this script provides : commands in beta stage

upcase_region()
{
    kill_region()
    StringUpper, Clipboard, Clipboard
    yank()
}

downcase_region()
{
    kill_region()
    StringLower, Clipboard, Clipboard
    yank()
}

upcase_word()
{
    mark_word()
    upcase_region()
}

downcase_word()
{
    mark_word()
    downcase_region()
}

capitalize_word()
{
    reset_cx()
    set_mark()
    forward_word()
    kill_region()
    StringUpper, Clipboard, Clipboard, T
    yank()
}
