#!/bin/dash

# Send notification
notify-send \
  "Autorandr" \
  "BSPWM: Changed layout to ${AUTORANDR_CURRENT_PROFILE}"\
  --icon=display
