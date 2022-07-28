#!/bin/dash

# Manage backlight
if [ -x '/usr/bin/light' ] ; then
    case $2 in
        BRTUP)
            /usr/bin/light -A 5
            ;;
        BRTDN)
            /usr/bin/light -D 5
            ;;
        KBILLUMUP)
            _kbd="$(light -L | sed -n '/kbd_backlight/s|^\s||p')"
            [ -n "${_kbd}" ] && light -A 1 -r -s "${_kbd}"
            ;;
        KBILLUMDOWN)
            _kbd="$(light -L | sed -n '/kbd_backlight/s|^\s||p')"
            [ -n "${_kbd}" ] && light -U 1 -r -s "${_kbd}"
            ;;
    esac
fi
