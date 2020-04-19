#!/bin/dash

# Execute the following if the window manager is bspwm
if [ "${XDG_CURRENT_DESKTOP}" = 'bspwm' ] ; then
    # Launch polybar instances
    if [ -x '/usr/bin/sbp-bspwm-bar' ] ; then
        /usr/bin/sbp-bspwm-bar
    fi
    # Change wallpaper instances
    if [ -x '/usr/bin/sbp-xpaper' ] ; then
        /usr/bin/sbp-xpaper
    fi
    # Refresh the window layout
    if [ -x '/usr/bin/sbp-bspwm-layout' ] ; then
        /usr/bin/sbp-bspwm-layout
    fi
    # Send notification
    notify-send \
        "Autorandr" \
        "BSPWM: Changed layout to ${AUTORANDR_CURRENT_PROFILE}"\
        --icon=display
fi
