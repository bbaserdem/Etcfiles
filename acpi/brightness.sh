#!/bin/sh

# Manage backlight
if [ -x '/usr/bin/light' ] ; then
    case $2 in
        BRTUP)
            case "$(hostname)" in
                sbp-homestation|sbp-laptop)
                    /usr/bin/light -A 5
                    ;;
                *)
                    logger "BRTUP action undefined for $(hostname)"
                    ;;
            esac
            ;;
        BRTDN)
            case "$(hostname)" in
                sbp-homestation|sbp-laptop)
                    /usr/bin/light -D 5
                    ;;
                *)
                    logger "BRTDN action undefined for $(hostname)"
                    ;;
            esac
            ;;
        KBILLUMUP)
            case "$(hostname)" in
                sbp-homestation)
                    light -Ars "sysfs/leds/asus::kbd_backlight" 1
                    ;;
                *)
                    logger "KBILLUMUP action undefined for $(hostname)"
                    ;;
            esac
            ;;
        KBILLUMDOWN)
            case "$(hostname)" in
                sbp-homestation)
                    light -Urs "sysfs/leds/asus::kbd_backlight" 1
                    ;;
                *)
                    logger "KBILLUMDOWN action undefined for $(hostname)"
                    ;;
            esac
            ;;
    esac
fi
