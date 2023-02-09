#!/usr/bin/env bash

# This is probably a good thing but breaks some things
# xsettingsd &

. "$HOME/.profile"

if [ -e "$HOME/.nix-profile/etc/profile.d/nix.sh" ]
then 
    . "$HOME/.nix-profile/etc/profile.d/nix.sh"
fi # added by Nix installer
