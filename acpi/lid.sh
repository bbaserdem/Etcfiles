#!/bin/sh
# Handler for lid open/close event

name="$1"
butn="$2"
state="$3"

# If autorandr is loaded and there is an external display; refresh
if [ -x '/usr/bin/autorandr' ] ; then
    autorandr --batch --change
fi

# If lid is closed; and there is only one display; turn it off
if [ "${state}" = 'close' ] ; then
    /usr/bin/xset dpms force off
fi
