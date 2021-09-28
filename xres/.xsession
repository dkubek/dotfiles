#!/usr/bin/env bash

xsettingsd &

. "$HOME/.profile"

if [ -e "$HOME/.nix-profile/etc/profile.d/nix.sh" ]
then 
    . "$HOME/.nix-profile/etc/profile.d/nix.sh"
fi # added by Nix installer
