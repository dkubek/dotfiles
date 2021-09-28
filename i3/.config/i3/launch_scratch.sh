#!/usr/bin/env bash

# This script launches a terminal as scratchpad instance which is
# recognized by i3.

if [[ $(ps aux | grep "scratchpad" | wc -l) -lt 2 ]]
then
    # urxvt -name scratchpad -cd $HOME &
    alacritty --title scratchpad --class scratchpad &

    # NOTE: Some time is needed for i3 to recognize the urxvt window
    # Might need more time on slower mashines. Adjust accordingly.
    sleep 0.1
    i3-msg scratchpad show &
else
    i3-msg scratchpad show &
fi

