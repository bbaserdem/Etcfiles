#!/bin/dash
# Sleep handler
case "${2}" in
    SLPB|SBTN)
        echo -n mem > /sys/power/state
        ;;
    *)
        logger "User script not configured for: ${2}"
        ;;
esac
