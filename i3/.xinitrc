#!/usr/bin/env bash

# xbindkeys &
# xsetwacom --set "Wacom Intuos PT M Pen stylus" Threshold 75
# xsetwacom --set "Wacom Intuos PT M Pen eraser" Threshold 75
# xsetwacom --set 15 MapToOutput HDMI-2

xrdb -load ~/.Xresources
feh --bg-fill --no-fehbg ~/.wallpaper

# Bind Caps Lock to Ctrl
setxkbmap -option ctrl:nocaps

# Decrease sensitivity for bluetooth mouse
xinput --set-prop "Bluetooth 3.0 Mouse" "Device Accel Constant Deceleration" 2

exec i3
