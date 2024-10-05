# XDG specification exports
export XDG_CACHE_HOME="/tmp/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc"

# To make DBUS work the DBUS Session address must be set otherwise applications
# cannot comunicate with each other.
export DBUS_SESSION_BUS_ADDRESS="unix:path=$XDG_RUNTIME_DIR/bus"

# Override default .vimrc location
#export VIMINIT='let $MYVIMRC="$XDG_CONFIG_HOME/vim/vimrc" | source $MYVIMRC'

# Make ~/.toys folder executable
export PATH="${PATH}:$HOME/.toys:$HOME/bin"

export PATH="$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH"

# Add local site packages to PYTHONPATH
export PYTHONPATH="${PYTHONPATH}:/home/unemployed/.local/lib/python3.7/site-packages"

# added by Nix installer
if [ -e "$HOME/.nix-profile/etc/profile.d/nix.sh" ]
then 
    source "$HOME/.nix-profile/etc/profile.d/nix.sh"
fi 

# >>> juliaup initialize >>>

# !! Contents within this block are managed by juliaup !!

case ":$PATH:" in *:/home/dkubek/.julia/juliaup/bin:*);; *)
    export PATH=/home/dkubek/.julia/juliaup/bin${PATH:+:${PATH}};;
esac

# <<< juliaup initialize <<<
. "$HOME/.cargo/env"

export LESS="-X"

sc() {
    grep "^[^#]" "${1}"
}

mcd() {
    mkdir -pv "${1}" && cd "${1}" || return
}

get_xinput_id() {
    local device=$1

    xinput list $1 | grep xinput list "${device}" 0 | head -1 | cut -f 2 | tr -d "id="
}

xinput map-to-output "$(get_xinput_id "Wacom Intuos PT M Pen Eraser (0)")" "HDMI-A-0"
xinput map-to-output "$(get_xinput_id "Wacom Intuos PT M Pen Pen (0)")" "HDMI-A-0"
