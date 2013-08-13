;; This script provides: IME commands for Japanese users

;; convert to kanji (Spc)
convert()
{
    command_simple("{space}", 1, 0)
}

;; convert to katakana (F7)
convert_to_katakana()
{
    command_simple("{f7}", 1, 0)
}

convert_to_alphabet()
{
    command_simple("{f10}", 1, 0)
}
