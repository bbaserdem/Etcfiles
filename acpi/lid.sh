#!/bin/sh
# Handler for lid open/close event

case "${3}" in
    close)
        _ac="$(acpi --ac-adapter | sed --quiet 's|Adapter 0: \(.*\)$|\1|p')"
        if [ "${_ac}" = 'off-line' ] ; then
            logger "Lid closed while running on battery, sleeping."
            echo -n mem > /sys/power/state
        fi
        ;;
    *)
        logger "User script not configured for: ${3}"
        ;;
esac
