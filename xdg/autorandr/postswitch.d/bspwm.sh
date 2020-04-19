#!/bin/dash

# Execute the following if the window manager is bspwm
if [ "${XDG_CURRENT_DESKTOP}" = 'bspwm' ] ; then
    # Launch polybar instances
    if [ -x '/usr/bin/sbp-xbars' ] ; then
        /usr/bin/sbp-xbars
    fi
    # Change wallpaper instances
    if [ -x '/usr/bin/sbp-xpaper' ] ; then
        /usr/bin/sbp-xpaper
    fi
    # Refresh the window layout
    if [ -x '/usr/bin/sbp-bspwmlayout' ] ; then
        /usr/bin/sbp-bspwmlayout
    fi
    # Send notification
    notify-send \
        "Autorandr" \
        "BSPWM: Changed layout to ${AUTORANDR_CURRENT_PROFILE}"\
        --icon=display
fi
