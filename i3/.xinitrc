#!/usr/bin/env bash

# default arch init scripts
# NOTE: This _should_ be done, but for some reason breaks many things for
# me. The most probable culprit is activating dbus or someghing
#if [ -d /etc/X11/xinit/xinitrc.d ]; then
#    for f in /etc/X11/xinit/xinitrc.d/?*.sh; do
#        [ -x "$f" ] && . "$f"
#    done
#fi

# user init scripts and settings
[ -r /etc/X11/xinit/.Xmodmap ] && xmodmap /etc/X11/xinit/.Xmodmap
[ -r ~/.Xmodmap ] && xmodmap ~/.Xmodmap
[ -r ~/.Xresources ] && xrdb -merge ~/.Xresources
[ -r ~/.xprofile ] && . ~/.xprofile
[ -r ~/.xsession ] && . ~/.xsession

# xbindkeys &
# xsetwacom --set "Wacom Intuos PT M Pen stylus" Threshold 75
# xsetwacom --set "Wacom Intuos PT M Pen eraser" Threshold 75
# xsetwacom --set 15 MapToOutput HDMI-2

autorandr -c &

feh --bg-fill --no-fehbg ~/.wallpaper

# Automatically mount devices
udiskie &

# Bind Caps Lock to Ctrl
setxkbmap -option ctrl:nocaps

# Decrease sensitivity for bluetooth mouse
xinput --set-prop "Bluetooth 3.0 Mouse" "Device Accel Constant Deceleration" 2

# init keyring
#eval "$(/usr/bin/gnome-keyring-daemon --start --components=gpg,pkcs11,secrets,ssh)"
# export keyring
#export GNOME_KEYRING_CONTROL GNOME_KEYRING_PID GPG_AGENT_INFO SSH_AUTH_SOCK

# launch the session, commands below this line will be ignored
exec i3
