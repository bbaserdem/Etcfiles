#!/bin/dash
# Battery handler
case "${1}" in
    battery)
        if [ -f '/proc/acpi/button/lid/LID0/state' ] ; then
            _lid="$(sed 's|state:\s*\(.*\)$|\1|' '/proc/acpi/button/lid/LID0/state')"
            if [ "${_lid}" = 'closed' ] ; then
                logger "Unplugged while lid is closed, sleeping."
                echo -n mem > /sys/power/state
            fi
        fi
        ;;
    *)
        logger "User script not configured for: ${1}"
        ;;
esac
