#!/bin/dash
# Battery handler
case "${1}" in
    battery)
        if [ -f '/proc/acpi/button/lid/LID0/state' ] ; then
            _lid="$(cat /proc/acpi/button/lid/LID0/state | sed 's|state:\s*\(.*\)$|\1|')"
            if [ "${_lid}" = 'closed' ] ; then
                logger "Unplugged while running on battery, sleeping."
                echo -n mem > /sys/power/state
            fi
        fi
        ;;
    *)
        logger "User script not configured for: ${1}"
        ;;
esac
