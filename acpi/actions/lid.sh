#!/bin/dash
# Handler for lid open/close event

case "${3}" in
    close)
        if [ -f '/sys/class/power_supply/AC/online' ] ; then
            _ac="$(cat /sys/class/power_supply/AC/online)"
            if [ "${_ac}" = '0' ] ; then
                logger "Lid closed while running on battery, sleeping."
                echo -n mem > /sys/power/state
            fi
        fi
        ;;
    *)
        logger "User script not configured for: ${3}"
        ;;
esac
