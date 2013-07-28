;; This script provides: commands for browsers

;; browse back (M-Left)
browser_backward()
{
    reset_cx()
    send("!{left}")
    reset_mark()
    after_display_transition_hook()
}

;; browse forward (M-Right)
browser_forward()
{
    reset_cx()
    send("!{right}")
    reset_mark()
    after_display_transition_hook()
}

;; reflesh (F5)
browser_reflesh()
{
    reset_cx()
    send("{f5}")
    reset_mark()
    after_display_transition_hook()
}

;; goto url (C-l)
browser_url()
{
    reset_cx()
    send("^l")
    reset_mark()
    after_display_transition_hook()
}

;; search keyword (C-k)
browser_search()
{
    reset_cx()
    send("^k")
    reset_mark()
    after_display_transition_hook()
}
