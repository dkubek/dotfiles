#! /usr/bin/env bash

# Terminate already running bar instances
pkill -u $UID polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch Polybar, using default config location ~/.config/polybar/config
# Launch bar1 and bar2
echo "---" | tee -a /tmp/polybar1.log /tmp/polybar2.log
#polybar dummy -r 2>&1 | tee -a /tmp/polybar_dummy.log & disown
polybar top -r 2>&1 | tee -a /tmp/polybar_top.log & disown

echo "Polybar launched..."
