#!env bash
# xbindkeys &
# xsetwacom --set "Wacom Intuos PT M Pen stylus" Threshold 75
# xsetwacom --set "Wacom Intuos PT M Pen eraser" Threshold 75
# xsetwacom --set 15 MapToOutput HDMI-2
# setxkbmap -option ctrl:nocaps
xrdb -merge ~/.Xresources
xsetroot -cursor_name left_ptr
feh --bg-fill --no-fehbg /home/unemployed/.wallpaper
exec xmonad
